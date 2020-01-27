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
		){
#pragma HLS INTERFACE m_axi depth=32 port=physMemPtr
#pragma HLS INTERFACE s_axilite port=basePhysAddr
#pragma HLS INTERFACE s_axilite port=threash
#pragma HLS INTERFACE s_axilite port=ratio

	// 4byteごとに扱っているので治す
	const ap_uint<32> addr = (basePhysAddr >> 2);// (=/ 4)

	// data_rdy_bitが立っていなければ処理しない
	const ap_uint<32> status = physMemPtr[addr + I2S_STATUS_REG];
	if (!status) {
		return;
	}
	// L/R chのデータを取得
	const ap_uint<32> lsrc = physMemPtr[addr + I2S_DATA_RX_L_REG];
	const ap_uint<32> rsrc = physMemPtr[addr + I2S_DATA_RX_R_REG];
	// 何かしらの音声処理
	const ap_uint<32> ldst = lsrc;
	const ap_uint<32> rdst = rsrc;
	// L/R chのデータを設定
	physMemPtr[addr + I2S_DATA_TX_L_REG] = ldst;
	physMemPtr[addr + I2S_DATA_TX_R_REG] = rdst;
}
