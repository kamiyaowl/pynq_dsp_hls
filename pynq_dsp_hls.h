#ifndef PYNQ_DSP_HLS_H
#define PYNQ_DSP_HLS_H

#include <ap_int.h>
#include <ap_common.h>
#include <hls_math.h>
#include <cstdint>

// エフェクトの直列に実行できる総数
#define EFFECT_STAGE_N (16)
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
    float l; // Lchのデータを格納
    float r; // Rchのデータを格納
} SampleData;

// エフェクトの種類
typedef enum {
    BYPASS = 0x0, // default
    DISTORTION,
    COMPRESSOR,
    DELAY,
    IIR,
} EffectId;

// エフェクトの設定用, AXI経由で固定長の領域として見せたいので共用体で定義
// CPU側で書く時点では固定小数点フォーマットを意識させない
// 4byte以上の型を扱うと、Lower/Upperのトランザクションを保証できず壊れたデータがセットされる可能性があるので控えるか書き換え完了を保証させるレジスタを増やして転送するなどして工夫する
#define EFFECT_CONFIG_SIZE (16)

SampleData effect_distortion(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]);
SampleData effect_compressor(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]);
SampleData effect_delay(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE], volatile ap_uint<32>* extMemPtr);
void pynq_dsp_hls(
        bool lrclk,                             // I2SのLR Clock、開始タイミングの同期用
        volatile ap_uint<32>* physMemPtr,       // AXI4MasterのPointer、basePhysAddrから+5*4byteアクセスする
        volatile ap_uint<32>* extMemPtr,        // AXI4MasterのPointer、Delay/Reberb等で指定されたアドレスにデータを保持する
        ap_uint<32> basePhysAddr,               // 読み出し先の物理ベースアドレス
        float* monitorSrcL,                     // 入力音データをfloat変換時の値を保持。モニター用
        float* monitorSrcR,                     // 入力音データをfloat変換時の値を保持。モニター用
        float* monitorDstL,                     // 出音データをfloat変換時の値を保持。モニター用
        float* monitorDstR,                     // 出力音データをfloat変換時の値を保持。モニター用
        uint32_t* counter,                      // 実行するたびにインクリメント
        uint32_t* numOfStage,                   // エフェクトパイプラインのステージ数。configRegのサイズ確認用
        uint32_t* configSizePerStage,           // エフェクトパイプラインごとのconfigRegのサイズ
        uint32_t configReg[EFFECT_STAGE_N][EFFECT_CONFIG_SIZE] // 実行するエフェクトの設定, Vivado HLSがunion指定に対応していないので泣く泣く後でCastして使う。余計な事が起きると怖いのでap_uintは使わない
        );

#endif /* PYNQ_DSP_HLS_H */