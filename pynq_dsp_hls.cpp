#include <ap_int.h>
#include <hls_math.h>

// エフェクトの直列に実行できる総数
#define EFFECT_STAGE_N (4)
// I2Sの有効データ幅(LSB詰であること)
#define I2S_DATA_BIT_WIDTH (24)
// 符号1bitがいるので23シフトした値が最大値
#define INTERNAL_FIXED_UNIT (0x1 << (I2S_DATA_BIT_WIDTH - 1))
// 内部データの全体幅
#define INTERNAL_FIXED_BIT_WIDTH (32)

// int24でデータが来るのでint32になるように符号拡張します
ap_int<INTERNAL_FIXED_BIT_WIDTH> sign_ext(ap_uint<INTERNAL_FIXED_BIT_WIDTH> src) {
	auto mask = src[I2S_DATA_BIT_WIDTH - 1] ? ( ap_uint<INTERNAL_FIXED_BIT_WIDTH-I2S_DATA_BIT_WIDTH>(~(0xffffffff << (INTERNAL_FIXED_BIT_WIDTH - I2S_DATA_BIT_WIDTH))) )
			                                : ap_uint<INTERNAL_FIXED_BIT_WIDTH-I2S_DATA_BIT_WIDTH>(0x0);
	return static_cast<ap_int<INTERNAL_FIXED_BIT_WIDTH>>((mask, src));
}

typedef union {
	uint32_t uint_data;
	float float_data;
} float_data_conversion_t;

float to_float(uint32_t src) {
	float_data_conversion_t dst;
	dst.uint_data = src;
	return dst.float_data;
}

// from audio_adau1761.cpp 4byteごとなので4でわってある
const ap_uint<32> I2S_DATA_RX_L_REG = 0x00;
const ap_uint<32> I2S_DATA_RX_R_REG = 0x01;
const ap_uint<32> I2S_DATA_TX_L_REG = 0x02;
const ap_uint<32> I2S_DATA_TX_R_REG = 0x03;
const ap_uint<32> I2S_STATUS_REG    = 0x04;

// 音データ
typedef struct {
	float lch; // Lchのデータを格納
	float rch; // Rchのデータを格納
} SampleData;

// エフェクトの種類
typedef enum {
	BYPASS = 0x0, // default
	DISTORTION,
	COMPRESSOR,
	FIR,
	IIR,
	DELAY,
	REVERB,
	CHORUS,
	TREMOLO,
	VIBRATO,
} EffectId;

// エフェクトの設定用, AXI経由で固定長の領域として見せたいので共用体で定義
// CPU側で書く時点では固定小数点フォーマットを意識させない
// 4byte以上の型を扱うと、Lower/Upperのトランザクションを保証できず壊れたデータがセットされる可能性があるので控えるか書き換え完了を保証させるレジスタを増やして転送するなどして工夫する
#define EFFECT_CONFIG_SIZE (4)

SampleData effect_distortion(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
	const float threash = to_float(config[1]);

	SampleData dst;
	const float labs = hls::abs(inData.lch);
	const float rabs = hls::abs(inData.rch);
	const float ldst = hls::min(labs, threash);
	const float rdst = hls::min(labs, threash);
	dst.lch = (inData.lch < 0) ? -ldst : ldst;
	dst.rch = (inData.rch < 0) ? -rdst : rdst;
	return dst;
}

// top level function
void pynq_dsp_hls(
		ap_uint<1> lrclk,                       // I2SのLR Clock、開始タイミングの同期用
		volatile ap_uint<32>* physMemPtr,       // AXI4MasterのPointer、basePhysAddrから+5*4byteアクセスする
		ap_uint<32> basePhysAddr,               // 読み出し先の物理ベースアドレス
		uint32_t configReg[EFFECT_STAGE_N][EFFECT_CONFIG_SIZE] // 実行するエフェクトの設定, Vivado HLSがunion指定に対応していないので泣く泣く後でCastして使う。余計な事が起きると怖いのでap_uintは使わない
		){
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE ap_none register port=lrclk
#pragma HLS INTERFACE m_axi depth=32 port=physMemPtr
#pragma HLS INTERFACE s_axilite port=basePhysAddr
#pragma HLS INTERFACE s_axilite port=configReg

	// 4byteごとに扱っているので治す
	const ap_uint<32> addr = (basePhysAddr >> 2);// (/= 4)
	const ap_uint<32> status = physMemPtr[addr + I2S_STATUS_REG];
	if (!status) { // data_rdy_bitが立っていなければ処理しない
		return;
	}

	// LRそろって処理したら一旦Sleepさせる
	static bool readyLch = false;
	static bool readyRch = false;
	if (lrclk == 0x1) {
		readyRch = true;
	} else {
		readyLch = true;
	}
	if (!readyLch || !readyRch) { // どちらかのデータが古いかもしれない
		return;
	} else {
		// status flagをリセットして処理続行
		readyLch = false;
		readyRch = false;
	}

	// L/R chのデータを取得
	const ap_int<32> lsrc = sign_ext(physMemPtr[addr + I2S_DATA_RX_L_REG]);// 24bit->32bitに符号拡張する
	const ap_int<32> rsrc = sign_ext(physMemPtr[addr + I2S_DATA_RX_R_REG]);
	const float lsrcf = static_cast<float>(lsrc) / INTERNAL_FIXED_UNIT;
	const float rsrcf = static_cast<float>(rsrc) / INTERNAL_FIXED_UNIT;
	// 処理中の音声データ格納先を作成
	SampleData currentData;
	currentData.lch = lsrcf;
	currentData.rch = rsrcf;

	for (ap_uint<32> stageIndex = 0; stageIndex < EFFECT_STAGE_N; stageIndex++) {
		// エフェクトで分岐して処理
		switch (static_cast<EffectId>(configReg[stageIndex][0])) {
			case EffectId::DISTORTION:
				currentData = effect_distortion(currentData, configReg[stageIndex]);
				break;
			case EffectId::COMPRESSOR:
			case EffectId::FIR:
			case EffectId::IIR:
			case EffectId::DELAY:
			case EffectId::REVERB:
			case EffectId::CHORUS:
			case EffectId::TREMOLO:
			case EffectId::VIBRATO:
				// TODO: not implemented
				break;
			case EffectId::BYPASS:
			default:
				// bypassは何もしない
				break;
		}

	}
	// エフェクトを掛けた音声データをfixedからどうにかもとの単位に戻す
	const float ldstf = currentData.lch * INTERNAL_FIXED_UNIT;
	const float rdstf = currentData.rch * INTERNAL_FIXED_UNIT;
	const ap_int<32> ldst = static_cast<ap_int<32>>(ldstf);
	const ap_int<32> rdst = static_cast<ap_int<32>>(rdstf);

	// L/R chのデータを設定
	physMemPtr[addr + I2S_DATA_TX_L_REG] = static_cast<ap_uint<32>>(ldst);
	physMemPtr[addr + I2S_DATA_TX_R_REG] = static_cast<ap_uint<32>>(rdst);
}
