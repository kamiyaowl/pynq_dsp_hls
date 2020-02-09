#include <ap_common.h>
#include <ap_int.h>
#include <hls_math.h>

// エフェクトの直列に実行できる総数
#define EFFECT_STAGE_N (4)
// 24bit signedの最大値
#define INTERNAL_FIXED_UNIT (0x7fffff)

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
#define EFFECT_CONFIG_SIZE (8)

SampleData effect_distortion(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
	const float threash = hls::abs(rawBitsToFloat(config[1])); // 負数が指定されると音が出なくなる想定, 1.0以上の場合は実質効かない(エフェクトの途中で超えていた場合を除く)

	SampleData dst;
	const float labs = hls::abs(inData.lch);
	const float rabs = hls::abs(inData.rch);
	const float ldst = hls::min(labs, threash);
	const float rdst = hls::min(rabs, threash);
	dst.lch = (inData.lch < 0.0f) ? -ldst : ldst;
	dst.rch = (inData.rch < 0.0f) ? -rdst : rdst;
	return dst;
}

SampleData effect_compressor(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
	const float threash = hls::abs(rawBitsToFloat(config[1])); // compが効き始めるしきい値
	const float ratio   = hls::abs(rawBitsToFloat(config[2])); // threashを超えたときの傾き、そのまま乗算される

	SampleData dst;
	const float labs = hls::abs(inData.lch);
	const float rabs = hls::abs(inData.rch);
	dst.lch = (inData.lch < labs) ? inData.lch : (inData.lch * ratio);
	dst.rch = (inData.rch < rabs) ? inData.rch : (inData.rch * ratio);
	return dst;
}

SampleData effect_delay(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE], volatile ap_uint<32>* extMemPtr) {
	const size_t SIZE_PER_SAMPLE = 2; // 1sampleあたり64byte

	const ap_uint<32> memAddr   = config[1]; // 任意にR/Wしてよい先頭領域
	const ap_uint<32> memSize   = config[2]; // Delayに使える空間Word数,最大サンプル数はこの半分まで
	const float volRatio    = hls::abs(rawBitsToFloat(config[3])); // Delayする際のVolumeを小さくできる
	const float periodRatio = hls::abs(rawBitsToFloat(config[4])); // Delayする時間。(memSize/2/SampleRate)*timeRatioした時間になる
	ap_uint<32>* wrIndex = &config[5]; // tail,今回の周回でデータを書き込むインデックス
	ap_uint<32>* rdIndex = &config[6]; // head, 今回の周回でデータを読み出すインデックス。設定時間分のDelayが経過していなければまつ

	// メモリが確保されていない、範囲外にある状態で初期化された場合の対策
	const ap_uint<32> maxIndex = memSize / 2; // 1sample=8byte
	if (maxIndex == 0) {
		return inData;
	}
	if ((*wrIndex >= maxIndex) || (*rdIndex >= maxIndex)) {
		*wrIndex = 0;
		*rdIndex = 0;
	}
	// 現在のデータを書く
	const float srcL = rawBitsToFloat(inData.lch) * volRatio;
	const float srcR = rawBitsToFloat(inData.rch) * volRatio;
	extMemPtr[memAddr + (*wrIndex) * SIZE_PER_SAMPLE + 0] = floatToRawBits(srcL);
	extMemPtr[memAddr + (*wrIndex) * SIZE_PER_SAMPLE + 1] = floatToRawBits(srcR);
	*wrIndex = (*wrIndex) < (maxIndex - 2) ? ((*wrIndex) + 1) : 0; // 進めておく

	// 設定分だけ遠ざかってなければReadするデータがない
	const ap_uint<32> configPeriod = static_cast<ap_uint<32>>(memSize.to_float() * periodRatio);
	const ap_uint<32> currentPeriod = ((*wrIndex) >= (*rdIndex)) ? ((*wrIndex) - (*rdIndex))
						                                         : ((*wrIndex) + (*rdIndex) - memSize);
	if (currentPeriod < configPeriod) {
		return inData; // 加算するデータはない
	}

	// 途中で設定値が変えられたときの対策、最新のデータまで飛ぶ

	// 読みだしたデータを加算する

	SampleData dst;
	const float labs = hls::abs(inData.lch);
	const float rabs = hls::abs(inData.rch);
	dst.lch = (inData.lch < labs) ? inData.lch : (inData.lch / ratio);
	dst.rch = (inData.rch < rabs) ? inData.rch : (inData.rch / ratio);
	return dst;
}


// top level function
void pynq_dsp_hls(
		ap_uint<1> lrclk,                       // I2SのLR Clock、開始タイミングの同期用
		volatile ap_uint<32>* physMemPtr,       // AXI4MasterのPointer、basePhysAddrから+5*4byteアクセスする
		ap_uint<32> basePhysAddr,               // 読み出し先の物理ベースアドレス
		volatile ap_uint<32>* extMemPtr,        // AXI4MasterのPointer、Delay/Reberb等で指定されたアドレスにデータを保持する
		float *srcL,                            // 入力音データをfloat変換時の値を保持。モニター用
		float *srcR,                            // 入力音データをfloat変換時の値を保持。モニター用
		float *dstL,                            // 出音データをfloat変換時の値を保持。モニター用
		float *dstR,                            // 出力音データをfloat変換時の値を保持。モニター用
		ap_uint<32>* numOfStage,                // エフェクトパイプラインのステージ数。configRegのサイズ確認用
		ap_uint<32>* configSizePerStage,        // エフェクトパイプラインごとのconfigRegのサイズ
		uint32_t configReg[EFFECT_STAGE_N][EFFECT_CONFIG_SIZE] // 実行するエフェクトの設定, Vivado HLSがunion指定に対応していないので泣く泣く後でCastして使う。余計な事が起きると怖いのでap_uintは使わない
		){
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE ap_none register port=lrclk
#pragma HLS INTERFACE m_axi depth=32 port=physMemPtr
#pragma HLS INTERFACE s_axilite port=basePhysAddr
#pragma HLS INTERFACE m_axi depth=32 port=extMemPtr
#pragma HLS INTERFACE s_axilite register port=srcL
#pragma HLS INTERFACE s_axilite register port=srcR
#pragma HLS INTERFACE s_axilite register port=dstL
#pragma HLS INTERFACE s_axilite register port=dstR
#pragma HLS INTERFACE s_axilite register port=numOfStage
#pragma HLS INTERFACE s_axilite register port=configSizePerStage
#pragma HLS INTERFACE s_axilite port=configReg

	// デバッグ情報
	*numOfStage = EFFECT_STAGE_N;
	*configSizePerStage = EFFECT_CONFIG_SIZE;

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
	const ap_uint<32> lraw = physMemPtr[addr + I2S_DATA_RX_L_REG];
	const ap_uint<32> rraw = physMemPtr[addr + I2S_DATA_RX_R_REG];
	const ap_int<24> lsrc = lraw.range(23, 0); // 実際は24bitしかないので切り出す
	const ap_int<24> rsrc = rraw.range(23, 0);
	const float lsrcf = lsrc.to_float() / INTERNAL_FIXED_UNIT; // max 1.0に収まるようにする
	const float rsrcf = rsrc.to_float() / INTERNAL_FIXED_UNIT;
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
				currentData = effect_compressor(currentData, configReg[stageIndex]);
				break;
			case EffectId::DELAY:
				currentData = effect_delay(currentData, configReg[stageIndex], extMemPtr);
				break;
			case EffectId::FIR:
			case EffectId::IIR:
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
	const float ldstf = currentData.lch * INTERNAL_FIXED_UNIT; // max 1.0から元の符号なしに戻す
	const float rdstf = currentData.rch * INTERNAL_FIXED_UNIT;
	const ap_int<24> ldst = static_cast<ap_int<24>>(ldstf);
	const ap_int<24> rdst = static_cast<ap_int<24>>(rdstf);

	// L/R chのデータを設定
	physMemPtr[addr + I2S_DATA_TX_L_REG] = static_cast<ap_uint<32>>(ldst);
	physMemPtr[addr + I2S_DATA_TX_R_REG] = static_cast<ap_uint<32>>(rdst);

	// その他デバッグ情報
	*srcL = lsrcf;
	*srcR = rsrcf;
	*dstL = ldstf;
	*dstR = rdstf;
}
