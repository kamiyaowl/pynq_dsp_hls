#include <ap_common.h>
#include <ap_int.h>
#include <hls_math.h>

// �G�t�F�N�g�̒���Ɏ��s�ł��鑍��
#define EFFECT_STAGE_N (4)
// 24bit signed�̍ő�l
#define INTERNAL_FIXED_UNIT (0x7fffff)

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
#define EFFECT_CONFIG_SIZE (8)

SampleData effect_distortion(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
	const float threash = hls::abs(rawBitsToFloat(config[1])); // �������w�肳���Ɖ����o�Ȃ��Ȃ�z��, 1.0�ȏ�̏ꍇ�͎��������Ȃ�(�G�t�F�N�g�̓r���Œ����Ă����ꍇ������)

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
	const float threash = hls::abs(rawBitsToFloat(config[1])); // comp�������n�߂邵�����l
	const float ratio   = hls::abs(rawBitsToFloat(config[2])); // threash�𒴂����Ƃ��̌X���A���̂܂܏�Z�����

	SampleData dst;
	const float labs = hls::abs(inData.lch);
	const float rabs = hls::abs(inData.rch);
	dst.lch = (inData.lch < labs) ? inData.lch : (inData.lch * ratio);
	dst.rch = (inData.rch < rabs) ? inData.rch : (inData.rch * ratio);
	return dst;
}

SampleData effect_delay(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE], volatile ap_uint<32>* extMemPtr) {
	const size_t SIZE_PER_SAMPLE = 2; // 1sample������64byte

	const ap_uint<32> memAddr   = config[1]; // �C�ӂ�R/W���Ă悢�擪�̈�
	const ap_uint<32> memSize   = config[2]; // Delay�Ɏg������Word��,�ő�T���v�����͂��̔����܂�
	const float volRatio    = hls::abs(rawBitsToFloat(config[3])); // Delay����ۂ�Volume���������ł���
	const float periodRatio = hls::abs(rawBitsToFloat(config[4])); // Delay���鎞�ԁB(memSize/2/SampleRate)*timeRatio�������ԂɂȂ�
	ap_uint<32>* wrIndex = &config[5]; // tail,����̎���Ńf�[�^���������ރC���f�b�N�X
	ap_uint<32>* rdIndex = &config[6]; // head, ����̎���Ńf�[�^��ǂݏo���C���f�b�N�X�B�ݒ莞�ԕ���Delay���o�߂��Ă��Ȃ���΂܂�

	// ���������m�ۂ���Ă��Ȃ��A�͈͊O�ɂ����Ԃŏ��������ꂽ�ꍇ�̑΍�
	const ap_uint<32> maxIndex = memSize / 2; // 1sample=8byte
	if (maxIndex == 0) {
		return inData;
	}
	if ((*wrIndex >= maxIndex) || (*rdIndex >= maxIndex)) {
		*wrIndex = 0;
		*rdIndex = 0;
	}
	// ���݂̃f�[�^������
	const float srcL = rawBitsToFloat(inData.lch) * volRatio;
	const float srcR = rawBitsToFloat(inData.rch) * volRatio;
	extMemPtr[memAddr + (*wrIndex) * SIZE_PER_SAMPLE + 0] = floatToRawBits(srcL);
	extMemPtr[memAddr + (*wrIndex) * SIZE_PER_SAMPLE + 1] = floatToRawBits(srcR);
	*wrIndex = (*wrIndex) < (maxIndex - 2) ? ((*wrIndex) + 1) : 0; // �i�߂Ă���

	// �ݒ蕪�������������ĂȂ����Read����f�[�^���Ȃ�
	const ap_uint<32> configPeriod = static_cast<ap_uint<32>>(memSize.to_float() * periodRatio);
	const ap_uint<32> currentPeriod = ((*wrIndex) >= (*rdIndex)) ? ((*wrIndex) - (*rdIndex))
						                                         : ((*wrIndex) + (*rdIndex) - memSize);
	if (currentPeriod < configPeriod) {
		return inData; // ���Z����f�[�^�͂Ȃ�
	}

	// �r���Őݒ�l���ς���ꂽ�Ƃ��̑΍�A�ŐV�̃f�[�^�܂Ŕ��

	// �ǂ݂������f�[�^�����Z����

	SampleData dst;
	const float labs = hls::abs(inData.lch);
	const float rabs = hls::abs(inData.rch);
	dst.lch = (inData.lch < labs) ? inData.lch : (inData.lch / ratio);
	dst.rch = (inData.rch < rabs) ? inData.rch : (inData.rch / ratio);
	return dst;
}


// top level function
void pynq_dsp_hls(
		ap_uint<1> lrclk,                       // I2S��LR Clock�A�J�n�^�C�~���O�̓����p
		volatile ap_uint<32>* physMemPtr,       // AXI4Master��Pointer�AbasePhysAddr����+5*4byte�A�N�Z�X����
		ap_uint<32> basePhysAddr,               // �ǂݏo����̕����x�[�X�A�h���X
		volatile ap_uint<32>* extMemPtr,        // AXI4Master��Pointer�ADelay/Reberb���Ŏw�肳�ꂽ�A�h���X�Ƀf�[�^��ێ�����
		float *srcL,                            // ���͉��f�[�^��float�ϊ����̒l��ێ��B���j�^�[�p
		float *srcR,                            // ���͉��f�[�^��float�ϊ����̒l��ێ��B���j�^�[�p
		float *dstL,                            // �o���f�[�^��float�ϊ����̒l��ێ��B���j�^�[�p
		float *dstR,                            // �o�͉��f�[�^��float�ϊ����̒l��ێ��B���j�^�[�p
		ap_uint<32>* numOfStage,                // �G�t�F�N�g�p�C�v���C���̃X�e�[�W���BconfigReg�̃T�C�Y�m�F�p
		ap_uint<32>* configSizePerStage,        // �G�t�F�N�g�p�C�v���C�����Ƃ�configReg�̃T�C�Y
		uint32_t configReg[EFFECT_STAGE_N][EFFECT_CONFIG_SIZE] // ���s����G�t�F�N�g�̐ݒ�, Vivado HLS��union�w��ɑΉ����Ă��Ȃ��̂ŋ����������Cast���Ďg���B�]�v�Ȏ����N����ƕ|���̂�ap_uint�͎g��Ȃ�
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

	// �f�o�b�O���
	*numOfStage = EFFECT_STAGE_N;
	*configSizePerStage = EFFECT_CONFIG_SIZE;

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
	const ap_uint<32> lraw = physMemPtr[addr + I2S_DATA_RX_L_REG];
	const ap_uint<32> rraw = physMemPtr[addr + I2S_DATA_RX_R_REG];
	const ap_int<24> lsrc = lraw.range(23, 0); // ���ۂ�24bit�����Ȃ��̂Ő؂�o��
	const ap_int<24> rsrc = rraw.range(23, 0);
	const float lsrcf = lsrc.to_float() / INTERNAL_FIXED_UNIT; // max 1.0�Ɏ��܂�悤�ɂ���
	const float rsrcf = rsrc.to_float() / INTERNAL_FIXED_UNIT;
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
				// bypass�͉������Ȃ�
				break;
		}

	}
	// �G�t�F�N�g���|���������f�[�^��fixed����ǂ��ɂ����Ƃ̒P�ʂɖ߂�
	const float ldstf = currentData.lch * INTERNAL_FIXED_UNIT; // max 1.0���猳�̕����Ȃ��ɖ߂�
	const float rdstf = currentData.rch * INTERNAL_FIXED_UNIT;
	const ap_int<24> ldst = static_cast<ap_int<24>>(ldstf);
	const ap_int<24> rdst = static_cast<ap_int<24>>(rdstf);

	// L/R ch�̃f�[�^��ݒ�
	physMemPtr[addr + I2S_DATA_TX_L_REG] = static_cast<ap_uint<32>>(ldst);
	physMemPtr[addr + I2S_DATA_TX_R_REG] = static_cast<ap_uint<32>>(rdst);

	// ���̑��f�o�b�O���
	*srcL = lsrcf;
	*srcR = rsrcf;
	*dstL = ldstf;
	*dstR = rdstf;
}
