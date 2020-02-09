// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.3 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXILiteS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of basePhysAddr_V
//        bit 31~0 - basePhysAddr_V[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of monitorSrcL
//        bit 31~0 - monitorSrcL[31:0] (Read)
// 0x1c : Control signal of monitorSrcL
//        bit 0  - monitorSrcL_ap_vld (Read/COR)
//        others - reserved
// 0x20 : Data signal of monitorSrcR
//        bit 31~0 - monitorSrcR[31:0] (Read)
// 0x24 : Control signal of monitorSrcR
//        bit 0  - monitorSrcR_ap_vld (Read/COR)
//        others - reserved
// 0x28 : Data signal of monitorDstL
//        bit 31~0 - monitorDstL[31:0] (Read)
// 0x2c : Control signal of monitorDstL
//        bit 0  - monitorDstL_ap_vld (Read/COR)
//        others - reserved
// 0x30 : Data signal of monitorDstR
//        bit 31~0 - monitorDstR[31:0] (Read)
// 0x34 : Control signal of monitorDstR
//        bit 0  - monitorDstR_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of counter_i
//        bit 31~0 - counter_i[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of counter_o
//        bit 31~0 - counter_o[31:0] (Read)
// 0x44 : Control signal of counter_o
//        bit 0  - counter_o_ap_vld (Read/COR)
//        others - reserved
// 0x48 : Data signal of numOfStage
//        bit 31~0 - numOfStage[31:0] (Read)
// 0x4c : Control signal of numOfStage
//        bit 0  - numOfStage_ap_vld (Read/COR)
//        others - reserved
// 0x50 : Data signal of configSizePerStage
//        bit 31~0 - configSizePerStage[31:0] (Read)
// 0x54 : Control signal of configSizePerStage
//        bit 0  - configSizePerStage_ap_vld (Read/COR)
//        others - reserved
// 0x80 ~
// 0xff : Memory 'configReg' (32 * 32b)
//        Word n : bit [31:0] - configReg[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPYNQ_DSP_HLS_AXILITES_ADDR_AP_CTRL                 0x00
#define XPYNQ_DSP_HLS_AXILITES_ADDR_GIE                     0x04
#define XPYNQ_DSP_HLS_AXILITES_ADDR_IER                     0x08
#define XPYNQ_DSP_HLS_AXILITES_ADDR_ISR                     0x0c
#define XPYNQ_DSP_HLS_AXILITES_ADDR_BASEPHYSADDR_V_DATA     0x10
#define XPYNQ_DSP_HLS_AXILITES_BITS_BASEPHYSADDR_V_DATA     32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORSRCL_DATA        0x18
#define XPYNQ_DSP_HLS_AXILITES_BITS_MONITORSRCL_DATA        32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORSRCL_CTRL        0x1c
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORSRCR_DATA        0x20
#define XPYNQ_DSP_HLS_AXILITES_BITS_MONITORSRCR_DATA        32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORSRCR_CTRL        0x24
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORDSTL_DATA        0x28
#define XPYNQ_DSP_HLS_AXILITES_BITS_MONITORDSTL_DATA        32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORDSTL_CTRL        0x2c
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORDSTR_DATA        0x30
#define XPYNQ_DSP_HLS_AXILITES_BITS_MONITORDSTR_DATA        32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_MONITORDSTR_CTRL        0x34
#define XPYNQ_DSP_HLS_AXILITES_ADDR_COUNTER_I_DATA          0x38
#define XPYNQ_DSP_HLS_AXILITES_BITS_COUNTER_I_DATA          32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_COUNTER_O_DATA          0x40
#define XPYNQ_DSP_HLS_AXILITES_BITS_COUNTER_O_DATA          32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_COUNTER_O_CTRL          0x44
#define XPYNQ_DSP_HLS_AXILITES_ADDR_NUMOFSTAGE_DATA         0x48
#define XPYNQ_DSP_HLS_AXILITES_BITS_NUMOFSTAGE_DATA         32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_NUMOFSTAGE_CTRL         0x4c
#define XPYNQ_DSP_HLS_AXILITES_ADDR_CONFIGSIZEPERSTAGE_DATA 0x50
#define XPYNQ_DSP_HLS_AXILITES_BITS_CONFIGSIZEPERSTAGE_DATA 32
#define XPYNQ_DSP_HLS_AXILITES_ADDR_CONFIGSIZEPERSTAGE_CTRL 0x54
#define XPYNQ_DSP_HLS_AXILITES_ADDR_CONFIGREG_BASE          0x80
#define XPYNQ_DSP_HLS_AXILITES_ADDR_CONFIGREG_HIGH          0xff
#define XPYNQ_DSP_HLS_AXILITES_WIDTH_CONFIGREG              32
#define XPYNQ_DSP_HLS_AXILITES_DEPTH_CONFIGREG              32

