#include <iostream>
#include <cassert>
#include <ap_int.h>

// from audio_adau1761.cpp 4byte���ƂȂ̂�4�ł���Ă���
const ap_uint<32> I2S_DATA_RX_L_REG = 0x00;
const ap_uint<32> I2S_DATA_RX_R_REG = 0x01;
const ap_uint<32> I2S_DATA_TX_L_REG = 0x02;
const ap_uint<32> I2S_DATA_TX_R_REG = 0x03;
const ap_uint<32> I2S_STATUS_REG    = 0x04;

void bypass(
		volatile ap_uint<32>* physMemPtr, // AXI4Master��Pointer�AbasePhysAddr����+5*4byte�A�N�Z�X����
		ap_uint<32> basePhysAddr // �ǂݏo����̕����x�[�X�A�h���X
		);


#define TEST_BUF_SIZE (64)

typedef struct {
	std::size_t basePhysAddr;
	ap_uint<32> status;
	ap_uint<32> lsrc;
	ap_uint<32> rsrc;
	ap_uint<32> ldst_expect; // lch �o�͊��Ғl
	ap_uint<32> rdst_expect; // rch �o�͊��Ғl
} BypassVector_t;

template<typename T, std::size_t S>
std::size_t array_len(const T (&)[S]) {
	return S;
}

int main(void) {
	ap_uint<32> buf[TEST_BUF_SIZE] = {};
	BypassVector_t vectors[] = {
			{ 0x0, 0x0, 0xaa, 0x55, 0x0, 0x0 },
			{ 0x0, 0x1, 0xaa, 0x55, 0xaa, 0x55 },
			{ 0x10, 0x0, 0xaa, 0x55, 0x0, 0x0 },
			{ 0x10, 0x1, 0xaa, 0x55, 0xaa, 0x55 },
	};
	for (std::size_t i = 0; i < array_len(vectors); i++) {
		// ���Ғl���Z�b�g
		const std::size_t baseIndex = vectors[i].basePhysAddr / 4;
		buf[baseIndex + I2S_DATA_RX_L_REG] = vectors[i].lsrc;
		buf[baseIndex + I2S_DATA_RX_R_REG] = vectors[i].rsrc;
		buf[baseIndex + I2S_DATA_TX_L_REG] = 0x0;
		buf[baseIndex + I2S_DATA_TX_R_REG] = 0x0;
		buf[baseIndex + I2S_STATUS_REG] = vectors[i].status;
		// �e�X�g����
		bypass((volatile ap_uint<32>*)&buf,  static_cast<ap_uint<32>>(vectors[i].basePhysAddr));
		// ���ʂ�����
		assert(buf[baseIndex + I2S_DATA_TX_L_REG] == vectors[i].ldst_expect);
		assert(buf[baseIndex + I2S_DATA_TX_R_REG] == vectors[i].rdst_expect);
	}

	return 0;
}
