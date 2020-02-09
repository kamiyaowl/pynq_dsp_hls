#include <iostream>
#include <cassert>
#include <ap_int.h>

// from audio_adau1761.cpp 4byteごとなので4でわってある
const ap_uint<32> I2S_DATA_RX_L_REG = 0x00;
const ap_uint<32> I2S_DATA_RX_R_REG = 0x01;
const ap_uint<32> I2S_DATA_TX_L_REG = 0x02;
const ap_uint<32> I2S_DATA_TX_R_REG = 0x03;
const ap_uint<32> I2S_STATUS_REG    = 0x04;

void bypass(
		volatile ap_uint<32>* physMemPtr, // AXI4MasterのPointer、basePhysAddrから+5*4byteアクセスする
		ap_uint<32> basePhysAddr // 読み出し先の物理ベースアドレス
		);


#define TEST_BUF_SIZE (64)

typedef struct {
	std::size_t basePhysAddr;
	ap_uint<32> status;
	ap_uint<32> srcL;
	ap_uint<32> srcR;
	ap_uint<32> ldst_expect; // l 出力期待値
	ap_uint<32> rdst_expect; // r 出力期待値
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
		// 期待値をセット
		const std::size_t baseIndex = vectors[i].basePhysAddr / 4;
		buf[baseIndex + I2S_DATA_RX_L_REG] = vectors[i].srcL;
		buf[baseIndex + I2S_DATA_RX_R_REG] = vectors[i].srcR;
		buf[baseIndex + I2S_DATA_TX_L_REG] = 0x0;
		buf[baseIndex + I2S_DATA_TX_R_REG] = 0x0;
		buf[baseIndex + I2S_STATUS_REG] = vectors[i].status;
		// テストする
		bypass((volatile ap_uint<32>*)&buf,  static_cast<ap_uint<32>>(vectors[i].basePhysAddr));
		// 結果を検証
		assert(buf[baseIndex + I2S_DATA_TX_L_REG] == vectors[i].ldst_expect);
		assert(buf[baseIndex + I2S_DATA_TX_R_REG] == vectors[i].rdst_expect);
	}

	return 0;
}
