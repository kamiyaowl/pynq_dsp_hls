#include <ap_int.h>
#include <hls_math.h>

// �G�t�F�N�g�̒���Ɏ��s�ł��鑍��
#define EFFECT_STAGE_N (4)
// I2S�̗L���f�[�^��(LSB�l�ł��邱��)
#define I2S_DATA_BIT_WIDTH (24)
// ����1bit������̂�23�V�t�g�����l���ő�l
#define INTERNAL_FIXED_UNIT (0x1 << (I2S_DATA_BIT_WIDTH - 1))
// �����f�[�^�̑S�̕�
#define INTERNAL_FIXED_BIT_WIDTH (32)

// int24�Ńf�[�^������̂�int32�ɂȂ�悤�ɕ����g�����܂�
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

// from audio_adau1761.cpp 4byte���ƂȂ̂�4�ł���Ă���
const ap_uint<32> I2S_DATA_RX_L_REG = 0x00;
const ap_uint<32> I2S_DATA_RX_R_REG = 0x01;
const ap_uint<32> I2S_DATA_TX_L_REG = 0x02;
const ap_uint<32> I2S_DATA_TX_R_REG = 0x03;
const ap_uint<32> I2S_STATUS_REG    = 0x04;

// ���f�[�^
typedef struct {
	float lch; // Lch�̃f�[�^���i�[
	float rch; // Rch�̃f�[�^���i�[
} SampleData;

// �G�t�F�N�g�̎��
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

// �G�t�F�N�g�̐ݒ�p, AXI�o�R�ŌŒ蒷�̗̈�Ƃ��Č��������̂ŋ��p�̂Œ�`
// CPU���ŏ������_�ł͌Œ菬���_�t�H�[�}�b�g���ӎ������Ȃ�
// 4byte�ȏ�̌^�������ƁALower/Upper�̃g�����U�N�V������ۏ؂ł�����ꂽ�f�[�^���Z�b�g�����\��������̂ōT���邩��������������ۏ؂����郌�W�X�^�𑝂₵�ē]������Ȃǂ��čH�v����
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
		ap_uint<1> lrclk,                       // I2S��LR Clock�A�J�n�^�C�~���O�̓����p
		volatile ap_uint<32>* physMemPtr,       // AXI4Master��Pointer�AbasePhysAddr����+5*4byte�A�N�Z�X����
		ap_uint<32> basePhysAddr,               // �ǂݏo����̕����x�[�X�A�h���X
		uint32_t configReg[EFFECT_STAGE_N][EFFECT_CONFIG_SIZE] // ���s����G�t�F�N�g�̐ݒ�, Vivado HLS��union�w��ɑΉ����Ă��Ȃ��̂ŋ����������Cast���Ďg���B�]�v�Ȏ����N����ƕ|���̂�ap_uint�͎g��Ȃ�
		){
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE ap_none register port=lrclk
#pragma HLS INTERFACE m_axi depth=32 port=physMemPtr
#pragma HLS INTERFACE s_axilite port=basePhysAddr
#pragma HLS INTERFACE s_axilite port=configReg

	// 4byte���ƂɈ����Ă���̂Ŏ���
	const ap_uint<32> addr = (basePhysAddr >> 2);// (/= 4)
	const ap_uint<32> status = physMemPtr[addr + I2S_STATUS_REG];
	if (!status) { // data_rdy_bit�������Ă��Ȃ���Ώ������Ȃ�
		return;
	}

	// LR������ď����������USleep������
	static bool readyLch = false;
	static bool readyRch = false;
	if (lrclk == 0x1) {
		readyRch = true;
	} else {
		readyLch = true;
	}
	if (!readyLch || !readyRch) { // �ǂ��炩�̃f�[�^���Â���������Ȃ�
		return;
	} else {
		// status flag�����Z�b�g���ď������s
		readyLch = false;
		readyRch = false;
	}

	// L/R ch�̃f�[�^���擾
	const ap_int<32> lsrc = sign_ext(physMemPtr[addr + I2S_DATA_RX_L_REG]);// 24bit->32bit�ɕ����g������
	const ap_int<32> rsrc = sign_ext(physMemPtr[addr + I2S_DATA_RX_R_REG]);
	const float lsrcf = static_cast<float>(lsrc) / INTERNAL_FIXED_UNIT;
	const float rsrcf = static_cast<float>(rsrc) / INTERNAL_FIXED_UNIT;
	// �������̉����f�[�^�i�[����쐬
	SampleData currentData;
	currentData.lch = lsrcf;
	currentData.rch = rsrcf;

	for (ap_uint<32> stageIndex = 0; stageIndex < EFFECT_STAGE_N; stageIndex++) {
		// �G�t�F�N�g�ŕ��򂵂ď���
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
				// bypass�͉������Ȃ�
				break;
		}

	}
	// �G�t�F�N�g���|���������f�[�^��fixed����ǂ��ɂ����Ƃ̒P�ʂɖ߂�
	const float ldstf = currentData.lch * INTERNAL_FIXED_UNIT;
	const float rdstf = currentData.rch * INTERNAL_FIXED_UNIT;
	const ap_int<32> ldst = static_cast<ap_int<32>>(ldstf);
	const ap_int<32> rdst = static_cast<ap_int<32>>(rdstf);

	// L/R ch�̃f�[�^��ݒ�
	physMemPtr[addr + I2S_DATA_TX_L_REG] = static_cast<ap_uint<32>>(ldst);
	physMemPtr[addr + I2S_DATA_TX_R_REG] = static_cast<ap_uint<32>>(rdst);
}
