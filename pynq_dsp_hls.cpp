#include "pynq_dsp_hls.h"

SampleData effect_distortion(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
	const float thresh = hls::abs(rawBitsToFloat(config[1])); // 負数が指定されると音が出なくなる想定, 1.0以上の場合は実質効かない(エフェクトの途中で超えていた場合を除く)

    SampleData dst;
    const float absL = hls::abs(inData.l);
    const float absR = hls::abs(inData.r);
    const float monitorDstL = hls::min(absL, thresh);
    const float monitorDstR = hls::min(absR, thresh);
    dst.l = (inData.l < 0.0f) ? -monitorDstL : monitorDstL;
    dst.r = (inData.r < 0.0f) ? -monitorDstR : monitorDstR;
    return dst;
}

SampleData effect_compressor(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
    const float thresh = hls::abs(rawBitsToFloat(config[1])); // compが効き始めるしきい値
    const float ratio  = hls::abs(rawBitsToFloat(config[2])); // threshを超えたときの傾き、そのまま乗算される

    SampleData dst;
    const float absL = hls::abs(inData.l);
    const float absR = hls::abs(inData.r);

    if (absL < thresh) {
        dst.l = inData.l;
    } else {
        const float absDst = thresh + (absL - thresh) * ratio;
        dst.l = (inData.l < 0.0f) ? (-absDst) : absDst;
    }

    if (absR < thresh) {
        dst.r = inData.r;
    } else {
        const float absDst = thresh + (absR - thresh) * ratio;
        dst.r = (inData.r < 0.0f) ? (-absDst) : absDst;
    }

    return dst;
}

SampleData effect_delay(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE], volatile ap_uint<32>* extMemPtr) {
    const size_t SIZE_PER_SAMPLE = 2; // 1sampleあたり64byte
    const float DELAY_VOL_RATIO_LIMIT = 0.8;

    const uint32_t DELAY_START_BIT = 0; // Delayを実際に開始させる場合はtrue, 設定を書き換える際は一旦0に設定する
    const ap_uint<32> delayCtrl = static_cast<ap_uint<32>>(config[1]); //Bypassに戻して設定するのは冗長なので設定レジスタを用意する

    const uint32_t memAddr = config[2]; // 任意にR/Wしてよい先頭領域
    const uint32_t memSize = config[3]; // Delayに使える空間Word数,最大サンプル数はこの半分まで
    const float directVolRatio = rawBitsToFloat(config[4]); // 入力音をそのまま出す割合
    const float delayVolRatio  = rawBitsToFloat(config[5]); // Delayした音を出力に混ぜる割合
    const float feedbackVolRatio = hls::min(DELAY_VOL_RATIO_LIMIT, hls::abs(rawBitsToFloat(config[6]))); // Delayした音を再度Delayさせるときの比率。発振対策にDELAY_VOL_RATIO_LIMIT以下しか指定できない
    const float periodRatio = hls::abs(rawBitsToFloat(config[7])); // Delayする時間。(memSize/2/SampleRate)*timeRatioした時間になる

    uint32_t* wrIndex = &config[8]; // tail, 今回の周回でデータを書き込むインデックス
    uint32_t* rdIndex = &config[9]; // head, 今回の周回でデータを読み出すインデックス。設定時間分のDelayが経過していなければまつ

    // メモリが確保されていない、範囲外にある状態で初期化された場合、設定値更新中の対策
    const ap_uint<32> maxIndex = memSize / 2; // 1sample=8byte
    const bool isNotRunning = !delayCtrl[DELAY_START_BIT];
    const bool hasMemSizeError = (maxIndex == 0);
    if (isNotRunning || hasMemSizeError || (*wrIndex >= maxIndex) || (*rdIndex >= maxIndex)) {
        *wrIndex = 0;
        *rdIndex = 0;
    }
    if (isNotRunning || hasMemSizeError) {
        return inData;
    }
    // 設定分だけ遠ざかってなければReadするデータがない
    const uint32_t configPeriod = static_cast<uint32_t>(static_cast<float>(memSize) * periodRatio);
    const uint32_t currentPeriod = ((*wrIndex) >= (*rdIndex)) ? ((*wrIndex) - (*rdIndex))
                                                              : ((*wrIndex) + (*rdIndex) - memSize);

    float auxL = 0.0;
    float auxR = 0.0;
    if (currentPeriod >= configPeriod) {
        // 読みだしたデータを加算する(追加時にratioを乗算済
        const ap_uint<32> auxRawL = extMemPtr[memAddr + (*rdIndex) * SIZE_PER_SAMPLE + 0];
        const ap_uint<32> auxRawR = extMemPtr[memAddr + (*rdIndex) * SIZE_PER_SAMPLE + 1];
        auxL = rawBitsToFloat(auxRawL.to_uint());
        auxR = rawBitsToFloat(auxRawR.to_uint());
        *rdIndex = (*rdIndex) < (maxIndex - 2) ? ((*rdIndex) + 1) : 0;
    }


    // 現在のデータを書く、これにはDelayのループバック分も挿入する
    const float delayInL = inData.l + (auxL * feedbackVolRatio);
    const float delayInR = inData.r + (auxR * feedbackVolRatio); 
    extMemPtr[memAddr + (*wrIndex) * SIZE_PER_SAMPLE + 0] = floatToRawBits(delayInL);
    extMemPtr[memAddr + (*wrIndex) * SIZE_PER_SAMPLE + 1] = floatToRawBits(delayInR);
    *wrIndex = (*wrIndex) < (maxIndex - 2) ? ((*wrIndex) + 1) : 0; // 進めておく

    SampleData dst;
    dst.l = (inData.l * directVolRatio) + (auxL * delayVolRatio);
    dst.r = (inData.r * directVolRatio) + (auxR * delayVolRatio);
    return dst;
}

SampleData effect_iir(SampleData inData, uint32_t config[EFFECT_CONFIG_SIZE]) {
    const uint32_t AZ1L_IDX = 8;
    const uint32_t AZ1R_IDX = 9;
    const uint32_t AZ2L_IDX = 10;
    const uint32_t AZ2R_IDX = 11;
    const uint32_t BZ1L_IDX = 12;
    const uint32_t BZ1R_IDX = 13;
    const uint32_t BZ2L_IDX = 14;
    const uint32_t BZ2R_IDX = 15;

    // const float a0 = hls::abs(rawBitsToFloat(config[2])); // scipyはa0=1固定で返してくる
    const float a1 = rawBitsToFloat(config[3]);
    const float a2 = rawBitsToFloat(config[4]);
    const float b0 = rawBitsToFloat(config[5]);
    const float b1 = rawBitsToFloat(config[6]);
    const float b2 = rawBitsToFloat(config[7]);

    // floatでtapの変数を読み戻す
    const float az1L = rawBitsToFloat(config[AZ1L_IDX]);
    const float az1R = rawBitsToFloat(config[AZ1R_IDX]);
    const float az2L = rawBitsToFloat(config[AZ2L_IDX]);
    const float az2R = rawBitsToFloat(config[AZ2R_IDX]);
    const float bz1L = rawBitsToFloat(config[BZ1L_IDX]);
    const float bz1R = rawBitsToFloat(config[BZ1R_IDX]);
    const float bz2L = rawBitsToFloat(config[BZ2L_IDX]);
    const float bz2R = rawBitsToFloat(config[BZ2R_IDX]);

    // bz0は入力そのまま
    const float bz0L = inData.l;
    const float bz0R = inData.r;
    // az0(dst相当)は愚直に計算 a0=1固定
    const float az0L = (bz0L * b0) + (bz1L * b1) + (bz2L * b2) + (az1L * a1) + (az2L * a2);
    const float az0R = (bz0R * b0) + (bz1R * b1) + (bz2R * b2) + (az1R * a1) + (az2R * a2);

    // 現在の値をconfigに遅延値として保存しておく
    config[AZ1L_IDX] = floatToRawBits(az0L);
    config[AZ1R_IDX] = floatToRawBits(az0R);
    config[AZ2L_IDX] = floatToRawBits(az1L);
    config[AZ2R_IDX] = floatToRawBits(az1L);
    config[BZ1L_IDX] = floatToRawBits(bz0L);
    config[BZ1R_IDX] = floatToRawBits(bz0R);
    config[BZ2L_IDX] = floatToRawBits(bz1L);
    config[BZ2R_IDX] = floatToRawBits(bz1R);

    // 結果を返す
    SampleData dst;
    dst.l = az0L;
    dst.r = az0R;
    return dst;
}

// top level function
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
        ){
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE ap_none register port=lrclk
#pragma HLS INTERFACE m_axi depth=32 port=physMemPtr
#pragma HLS INTERFACE m_axi depth=32 port=extMemPtr
#pragma HLS INTERFACE s_axilite register port=basePhysAddr
#pragma HLS INTERFACE s_axilite register port=monitorSrcL
#pragma HLS INTERFACE s_axilite register port=monitorSrcR
#pragma HLS INTERFACE s_axilite register port=monitorDstL
#pragma HLS INTERFACE s_axilite register port=monitorDstR
#pragma HLS INTERFACE s_axilite register port=counter
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
    if (lrclk) {
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

    // カウンターをインクリメントしとく
    *counter = (*counter < 0xfffffffe) ? ((*counter) + 1) : 0;

    // L/R chのデータを取得
    const ap_uint<32> rawL = physMemPtr[addr + I2S_DATA_RX_L_REG];
    const ap_uint<32> rawR = physMemPtr[addr + I2S_DATA_RX_R_REG];
    const ap_int<24> srcL = rawL.range(23, 0); // 実際は24bitしかないので切り出す
    const ap_int<24> srcR = rawR.range(23, 0);
    const float floatSrcL = srcL.to_float() / INTERNAL_FIXED_UNIT; // max 1.0に収まるようにする
    const float floatSrcR = srcR.to_float() / INTERNAL_FIXED_UNIT;


    // 処�?中の音声�?ータ格納�??
    static SampleData srcDatas[EFFECT_STAGE_N] = {};
    srcDatas[0].l = floatSrcL;
    srcDatas[0].r = floatSrcR;

    SampleData dstDatas[EFFECT_STAGE_N];
    for (ap_uint<32> stageIndex = 0; stageIndex < EFFECT_STAGE_N; stageIndex++) {
    	const EffectId id = static_cast<EffectId>(configReg[stageIndex][0]);
        switch (id) {
            case EffectId::DISTORTION:
                dstDatas[stageIndex] = effect_distortion(srcDatas[stageIndex], configReg[stageIndex]);
                break;
            case EffectId::COMPRESSOR:
                dstDatas[stageIndex] = effect_compressor(srcDatas[stageIndex], configReg[stageIndex]);
                break;
            case EffectId::DELAY:
                dstDatas[stageIndex] = effect_delay(srcDatas[stageIndex], configReg[stageIndex], extMemPtr);
                break;
            case EffectId::IIR:
                dstDatas[stageIndex] = effect_iir(srcDatas[stageIndex], configReg[stageIndex]);
                break;
            case EffectId::BYPASS:
            default:
                dstDatas[stageIndex].l = srcDatas[stageIndex].l;
                dstDatas[stageIndex].r = srcDatas[stageIndex].r;
                break;
        }
    }

    // 計算結果を浮動小数点からもとの形式に戻して反映する
    const float floatDstL = dstDatas[EFFECT_STAGE_N - 1].l * INTERNAL_FIXED_UNIT;
    const float floatDstR = dstDatas[EFFECT_STAGE_N - 1].r * INTERNAL_FIXED_UNIT;
    const ap_int<24> dstL = static_cast<ap_int<24>>(floatDstL);
    const ap_int<24> dstR = static_cast<ap_int<24>>(floatDstR);
    physMemPtr[addr + I2S_DATA_TX_L_REG] = static_cast<ap_uint<32>>(dstL);
    physMemPtr[addr + I2S_DATA_TX_R_REG] = static_cast<ap_uint<32>>(dstR);

    // srcDatasに次使うデータをセット
    for (ap_uint<32> stageIndex = 0; stageIndex < (EFFECT_STAGE_N - 1); stageIndex++) {
        srcDatas[stageIndex + 1].l = dstDatas[stageIndex].l;
        srcDatas[stageIndex + 1].r = dstDatas[stageIndex].r;
    }

    // Debug info
    *monitorSrcL = floatSrcL;
    *monitorSrcR = floatSrcR;
    *monitorDstL = floatDstL;
    *monitorDstR = floatDstR;
}
