#include <ap_int.h>
#include <cstdint>

// �G�t�F�N�g�̒���Ɏ��s�ł��鑍��
#define EFFECT_STAGE_N (4)
// I2S�̗L���f�[�^��(LSB�l�ł��邱��)
#define I2S_DATA_BIT_WIDTH (24)
// �����f�[�^�̑S�̕�
#define INTERNAL_FIXED_BIT_WIDTH (32)
// 24bit��2�̕␔�\����32bit�Ɋg�����邽�߂�Ma����
#define INTERNAL_SIGN_EXTENSION_MASK (~(0xffffffff >> (INTERNAL_FIXED_BIT_WIDTH - I2S_DATA_BIT_WIDTH)))
// �����f�[�^�̂����A�Œ菬���_�̐��x�ɂ�����bit��
#define INTERNAL_FIXED_PRESICION_BIT_WIDTH (23)
// int24�̐��̒l��-1.0 ~ +1.0�Ɋۂ߂�Ƃ��̕���
#define INTERNAL_FIXED_UNIT (0x1 << INTERNAL_FIXED_PRESICION_BIT_WIDTH);
// �Œ菬���_Format
typedef ap_fixed<INTERNAL_FIXED_BIT_WIDTH, (INTERNAL_FIXED_BIT_WIDTH - INTERNAL_FIXED_PRESICION_BIT_WIDTH), AP_RND, AP_SAT> dsp_fixed;

// from audio_adau1761.cpp 4byte���ƂȂ̂�4�ł���Ă���
const ap_uint<32> I2S_DATA_RX_L_REG = 0x00;
const ap_uint<32> I2S_DATA_RX_R_REG = 0x01;
const ap_uint<32> I2S_DATA_TX_L_REG = 0x02;
const ap_uint<32> I2S_DATA_TX_R_REG = 0x03;
const ap_uint<32> I2S_STATUS_REG    = 0x04;

// ���f�[�^
typedef struct {
	dsp_fixed lch; // Lch�̃f�[�^���i�[
	dsp_fixed rch; // Rch�̃f�[�^���i�[
} SampleData;

// �G�t�F�N�g�̎��
typedef enum {
	BYPASS = 0x0,
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
typedef struct {
	EffectId effectId; // �G�t�F�N�g�̎�ނ��i�[
	union {
		struct {
			float threash; // �����N���b�v���������l
			uint32_t reserved;
		} distortion;
		struct {
			float threash; // �X����}�������������l
			float ratio;   // threash�𒴂����Ƃ��Ɍ���������䗦
		} compressor;
		uint32_t raw[2]; // ARM��unaligned access�ŉ���̕|���̂�
	} detail;
} EffectConfig;

// �G�t�F�N�g���s���֐��|�C���^��\��(�܂Ƃ߂��肷��Ȃ�....)
typedef SampleData(*DspFunc)(SampleData inData, EffectConfig* config);

SampleData effect_bypass(SampleData inData, EffectConfig* config) {
	return inData;
}

SampleData effect_distortion(SampleData inData, EffectConfig* config) {
	const dsp_fixed threash = static_cast<dsp_fixed>(config->detail.distortion.threash);
	// TODO: work in progress
	SampleData dst;
	return dst;
}


// top level function
void pynq_dsp_hls(
		ap_uint<1> lrclk,                       // I2S��LR Clock�A�J�n�^�C�~���O�̓����p
		volatile ap_uint<32>* physMemPtr,       // AXI4Master��Pointer�AbasePhysAddr����+5*4byte�A�N�Z�X����
		ap_uint<32> basePhysAddr,               // �ǂݏo����̕����x�[�X�A�h���X
		uint8_t configReg[sizeof(EffectConfig)][EFFECT_STAGE_N] // ���s����G�t�F�N�g�̐ݒ�, Vivado HLS��union�w��ɑΉ����Ă��Ȃ��̂ŋ����������Cast���Ďg���B�]�v�Ȏ����N����ƕ|���̂�ap_uint�͎g��Ȃ�
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
	const ap_uint<32> lsrc = physMemPtr[addr + I2S_DATA_RX_L_REG];
	const ap_uint<32> rsrc = physMemPtr[addr + I2S_DATA_RX_R_REG];
	const ap_int<32> lsignExt = lsrc.bit(I2S_DATA_BIT_WIDTH - 1) ? static_cast<ap_int<32>>(lsrc | INTERNAL_SIGN_EXTENSION_MASK) : static_cast<ap_int<32>>(lsrc);
	const ap_int<32> rsignExt = rsrc.bit(I2S_DATA_BIT_WIDTH - 1) ? static_cast<ap_int<32>>(rsrc | INTERNAL_SIGN_EXTENSION_MASK) : static_cast<ap_int<32>>(rsrc);
	const float lsrcf = static_cast<float>(lsignExt) / INTERNAL_FIXED_UNIT;
	const float rsrcf = static_cast<float>(rsignExt) / INTERNAL_FIXED_UNIT;
	// �������̉����f�[�^�i�[����쐬
	SampleData currentData;
	currentData.lch = static_cast<dsp_fixed>(lsrcf);
	currentData.rch = static_cast<dsp_fixed>(rsrcf);

	for (ap_uint<32> stageIndex = 0; stageIndex < EFFECT_STAGE_N; stageIndex++) {
		// �ݒ背�W�X�^��ǂݏo���Ďg��(�^�Ƃ�...)
		void* configRegAddr = static_cast<void*>(configReg[stageIndex]);
		EffectConfig* config = static_cast<EffectConfig*>(configRegAddr);
		// �G�t�F�N�g�ŕ��򂵂ď���
		switch (config->effectId) {
			case EffectId::BYPASS:
				currentData = effect_bypass(currentData, config);
				break;
			case EffectId::DISTORTION:
				currentData = effect_distortion(currentData, config);
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
				currentData = effect_bypass(currentData, config);
				break;
		}

	}
	// �G�t�F�N�g���|���������f�[�^��fixed����ǂ��ɂ����Ƃ̒P�ʂɖ߂�
	const float ldstf = currentData.lch.to_float() * INTERNAL_FIXED_UNIT;
	const float rdstf = currentData.rch.to_float() * INTERNAL_FIXED_UNIT;
	const ap_int<32> ldst = static_cast<ap_int<32>>(ldstf);
	const ap_int<32> rdst = static_cast<ap_int<32>>(rdstf);

	// L/R ch�̃f�[�^��ݒ�
	physMemPtr[addr + I2S_DATA_TX_L_REG] = ldst;
	physMemPtr[addr + I2S_DATA_TX_R_REG] = rdst;
}
