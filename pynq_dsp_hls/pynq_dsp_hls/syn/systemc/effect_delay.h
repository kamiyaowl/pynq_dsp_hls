// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1.3
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _effect_delay_HH_
#define _effect_delay_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "pynq_dsp_hls_faddbkb.h"
#include "pynq_dsp_hls_fmulcud.h"
#include "pynq_dsp_hls_uitodEe.h"
#include "pynq_dsp_hls_fcmpeOg.h"

namespace ap_rtl {

struct effect_delay : public sc_module {
    // Port declarations 61
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<32> > inData_l;
    sc_in< sc_lv<32> > inData_r;
    sc_out< sc_lv<6> > config_r_address0;
    sc_out< sc_logic > config_r_ce0;
    sc_out< sc_logic > config_r_we0;
    sc_out< sc_lv<32> > config_r_d0;
    sc_in< sc_lv<32> > config_r_q0;
    sc_in< sc_lv<3> > config_offset;
    sc_out< sc_logic > m_axi_extMemPtr_V_AWVALID;
    sc_in< sc_logic > m_axi_extMemPtr_V_AWREADY;
    sc_out< sc_lv<32> > m_axi_extMemPtr_V_AWADDR;
    sc_out< sc_lv<1> > m_axi_extMemPtr_V_AWID;
    sc_out< sc_lv<32> > m_axi_extMemPtr_V_AWLEN;
    sc_out< sc_lv<3> > m_axi_extMemPtr_V_AWSIZE;
    sc_out< sc_lv<2> > m_axi_extMemPtr_V_AWBURST;
    sc_out< sc_lv<2> > m_axi_extMemPtr_V_AWLOCK;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_AWCACHE;
    sc_out< sc_lv<3> > m_axi_extMemPtr_V_AWPROT;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_AWQOS;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_AWREGION;
    sc_out< sc_lv<1> > m_axi_extMemPtr_V_AWUSER;
    sc_out< sc_logic > m_axi_extMemPtr_V_WVALID;
    sc_in< sc_logic > m_axi_extMemPtr_V_WREADY;
    sc_out< sc_lv<32> > m_axi_extMemPtr_V_WDATA;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_WSTRB;
    sc_out< sc_logic > m_axi_extMemPtr_V_WLAST;
    sc_out< sc_lv<1> > m_axi_extMemPtr_V_WID;
    sc_out< sc_lv<1> > m_axi_extMemPtr_V_WUSER;
    sc_out< sc_logic > m_axi_extMemPtr_V_ARVALID;
    sc_in< sc_logic > m_axi_extMemPtr_V_ARREADY;
    sc_out< sc_lv<32> > m_axi_extMemPtr_V_ARADDR;
    sc_out< sc_lv<1> > m_axi_extMemPtr_V_ARID;
    sc_out< sc_lv<32> > m_axi_extMemPtr_V_ARLEN;
    sc_out< sc_lv<3> > m_axi_extMemPtr_V_ARSIZE;
    sc_out< sc_lv<2> > m_axi_extMemPtr_V_ARBURST;
    sc_out< sc_lv<2> > m_axi_extMemPtr_V_ARLOCK;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_ARCACHE;
    sc_out< sc_lv<3> > m_axi_extMemPtr_V_ARPROT;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_ARQOS;
    sc_out< sc_lv<4> > m_axi_extMemPtr_V_ARREGION;
    sc_out< sc_lv<1> > m_axi_extMemPtr_V_ARUSER;
    sc_in< sc_logic > m_axi_extMemPtr_V_RVALID;
    sc_out< sc_logic > m_axi_extMemPtr_V_RREADY;
    sc_in< sc_lv<32> > m_axi_extMemPtr_V_RDATA;
    sc_in< sc_logic > m_axi_extMemPtr_V_RLAST;
    sc_in< sc_lv<1> > m_axi_extMemPtr_V_RID;
    sc_in< sc_lv<1> > m_axi_extMemPtr_V_RUSER;
    sc_in< sc_lv<2> > m_axi_extMemPtr_V_RRESP;
    sc_in< sc_logic > m_axi_extMemPtr_V_BVALID;
    sc_out< sc_logic > m_axi_extMemPtr_V_BREADY;
    sc_in< sc_lv<2> > m_axi_extMemPtr_V_BRESP;
    sc_in< sc_lv<1> > m_axi_extMemPtr_V_BID;
    sc_in< sc_lv<1> > m_axi_extMemPtr_V_BUSER;
    sc_out< sc_lv<32> > ap_return_0;
    sc_out< sc_lv<32> > ap_return_1;
    sc_signal< sc_logic > ap_var_for_const0;
    sc_signal< sc_lv<32> > ap_var_for_const1;
    sc_signal< sc_lv<5> > ap_var_for_const2;


    // Module declarations
    effect_delay(sc_module_name name);
    SC_HAS_PROCESS(effect_delay);

    ~effect_delay();

    sc_trace_file* mVcdFile;

    pynq_dsp_hls_faddbkb<1,7,32,32,32>* pynq_dsp_hls_faddbkb_U1;
    pynq_dsp_hls_faddbkb<1,7,32,32,32>* pynq_dsp_hls_faddbkb_U2;
    pynq_dsp_hls_faddbkb<1,7,32,32,32>* pynq_dsp_hls_faddbkb_U3;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U4;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U5;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U6;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U7;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U8;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U9;
    pynq_dsp_hls_uitodEe<1,6,32,32>* pynq_dsp_hls_uitodEe_U10;
    pynq_dsp_hls_fcmpeOg<1,2,32,32,1>* pynq_dsp_hls_fcmpeOg_U11;
    sc_signal< sc_lv<51> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > extMemPtr_V_blk_n_AR;
    sc_signal< sc_logic > ap_CS_fsm_state24;
    sc_signal< sc_logic > extMemPtr_V_blk_n_R;
    sc_signal< sc_logic > ap_CS_fsm_state31;
    sc_signal< sc_logic > ap_CS_fsm_state25;
    sc_signal< sc_logic > ap_CS_fsm_state32;
    sc_signal< sc_logic > extMemPtr_V_blk_n_AW;
    sc_signal< sc_logic > ap_CS_fsm_state44;
    sc_signal< sc_logic > extMemPtr_V_blk_n_W;
    sc_signal< sc_logic > ap_CS_fsm_state45;
    sc_signal< sc_logic > extMemPtr_V_blk_n_B;
    sc_signal< sc_logic > ap_CS_fsm_state50;
    sc_signal< sc_logic > ap_CS_fsm_state46;
    sc_signal< sc_logic > ap_CS_fsm_state51;
    sc_signal< sc_lv<1> > or_ln62_reg_1108;
    sc_signal< sc_lv<32> > reg_401;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<32> > reg_406;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_lv<32> > reg_411;
    sc_signal< sc_logic > ap_CS_fsm_state7;
    sc_signal< sc_logic > ap_CS_fsm_state10;
    sc_signal< sc_lv<1> > icmp_ln891_reg_1169;
    sc_signal< sc_lv<32> > grp_fu_343_p2;
    sc_signal< sc_lv<32> > reg_416;
    sc_signal< bool > ap_block_state45_io;
    sc_signal< sc_lv<7> > tmp_16_fu_420_p3;
    sc_signal< sc_lv<7> > tmp_16_reg_1031;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<31> > trunc_ln368_fu_457_p1;
    sc_signal< sc_lv<31> > trunc_ln368_reg_1053;
    sc_signal< sc_lv<1> > icmp_ln257_fu_475_p2;
    sc_signal< sc_lv<1> > icmp_ln257_reg_1058;
    sc_signal< sc_lv<1> > icmp_ln257_6_fu_481_p2;
    sc_signal< sc_lv<1> > icmp_ln257_6_reg_1063;
    sc_signal< sc_lv<32> > bitcast_ln348_fu_508_p1;
    sc_signal< sc_lv<32> > bitcast_ln348_reg_1073;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<32> > memAddr_reg_1084;
    sc_signal< sc_lv<32> > feedbackVolRatio_fu_537_p3;
    sc_signal< sc_lv<32> > feedbackVolRatio_reg_1092;
    sc_signal< sc_lv<31> > val_assign_s_fu_562_p4;
    sc_signal< sc_lv<31> > val_assign_s_reg_1103;
    sc_signal< sc_lv<1> > or_ln62_fu_584_p2;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_lv<6> > wrIndex_reg_1136;
    sc_signal< sc_lv<6> > rdIndex_reg_1141;
    sc_signal< sc_lv<32> > directVolRatio_fu_646_p1;
    sc_signal< sc_lv<32> > directVolRatio_reg_1146;
    sc_signal< sc_lv<32> > delayVolRatio_fu_650_p1;
    sc_signal< sc_lv<32> > delayVolRatio_reg_1152;
    sc_signal< sc_lv<32> > periodRatio_fu_666_p1;
    sc_signal< sc_lv<32> > periodRatio_reg_1158;
    sc_signal< sc_lv<32> > maxIndex_V_fu_670_p1;
    sc_signal< sc_lv<32> > maxIndex_V_reg_1163;
    sc_signal< sc_lv<1> > grp_fu_391_p2;
    sc_signal< sc_lv<1> > icmp_ln891_1_reg_1173;
    sc_signal< sc_lv<32> > grp_fu_383_p1;
    sc_signal< sc_lv<32> > tmp_7_reg_1177;
    sc_signal< sc_logic > ap_CS_fsm_state16;
    sc_signal< sc_lv<8> > tmp_V_reg_1182;
    sc_signal< sc_logic > ap_CS_fsm_state20;
    sc_signal< sc_lv<23> > tmp_V_1_fu_687_p1;
    sc_signal< sc_lv<23> > tmp_V_1_reg_1188;
    sc_signal< sc_lv<1> > isNeg_fu_700_p3;
    sc_signal< sc_lv<1> > isNeg_reg_1193;
    sc_signal< sc_logic > ap_CS_fsm_state21;
    sc_signal< sc_lv<9> > ush_fu_717_p3;
    sc_signal< sc_lv<9> > ush_reg_1198;
    sc_signal< sc_lv<1> > icmp_ln76_fu_821_p2;
    sc_signal< sc_lv<1> > icmp_ln76_reg_1204;
    sc_signal< sc_logic > ap_CS_fsm_state22;
    sc_signal< sc_lv<32> > extMemPtr_V_addr_reg_1208;
    sc_signal< sc_logic > ap_CS_fsm_state23;
    sc_signal< sc_lv<32> > extMemPtr_V_addr_1_reg_1214;
    sc_signal< sc_lv<32> > select_ln82_fu_907_p3;
    sc_signal< sc_lv<32> > select_ln82_reg_1220;
    sc_signal< sc_lv<32> > auxRawL_V_reg_1225;
    sc_signal< sc_lv<32> > auxRawR_V_reg_1230;
    sc_signal< sc_lv<32> > auxL_fu_915_p1;
    sc_signal< sc_logic > ap_CS_fsm_state33;
    sc_signal< sc_lv<32> > auxR_fu_918_p1;
    sc_signal< sc_lv<1> > icmp_ln887_1_fu_929_p2;
    sc_signal< sc_lv<1> > icmp_ln887_1_reg_1245;
    sc_signal< sc_lv<32> > grp_fu_355_p2;
    sc_signal< sc_lv<32> > tmp_9_reg_1250;
    sc_signal< sc_logic > ap_CS_fsm_state37;
    sc_signal< sc_lv<32> > grp_fu_360_p2;
    sc_signal< sc_lv<32> > tmp_s_reg_1255;
    sc_signal< sc_lv<32> > grp_fu_365_p2;
    sc_signal< sc_lv<32> > tmp_1_reg_1260;
    sc_signal< sc_lv<32> > grp_fu_369_p2;
    sc_signal< sc_lv<32> > tmp_2_reg_1265;
    sc_signal< sc_lv<32> > grp_fu_374_p2;
    sc_signal< sc_lv<32> > tmp_3_reg_1270;
    sc_signal< sc_lv<32> > grp_fu_378_p2;
    sc_signal< sc_lv<32> > tmp_4_reg_1275;
    sc_signal< sc_lv<32> > extMemPtr_V_addr_2_reg_1280;
    sc_signal< sc_logic > ap_CS_fsm_state43;
    sc_signal< sc_lv<32> > extMemPtr_V_addr_3_reg_1286;
    sc_signal< sc_lv<32> > grp_fu_347_p2;
    sc_signal< sc_lv<32> > dst_l_reg_1292;
    sc_signal< sc_lv<32> > grp_fu_351_p2;
    sc_signal< sc_lv<32> > dst_r_reg_1297;
    sc_signal< sc_lv<32> > i_op_assign_2_reg_279;
    sc_signal< sc_logic > ap_CS_fsm_state11;
    sc_signal< sc_lv<32> > i_op_assign_3_reg_290;
    sc_signal< sc_lv<32> > auxL_0_reg_301;
    sc_signal< sc_lv<32> > auxR_0_reg_313;
    sc_signal< sc_lv<32> > ap_phi_mux_agg_result_l_write_a_phi_fu_328_p4;
    sc_signal< sc_lv<32> > agg_result_l_write_a_reg_325;
    sc_signal< bool > ap_block_state51;
    sc_signal< sc_lv<32> > ap_phi_mux_agg_result_r_write_a_phi_fu_337_p4;
    sc_signal< sc_lv<32> > agg_result_r_write_a_reg_334;
    sc_signal< sc_lv<64> > tmp_22_fu_434_p3;
    sc_signal< sc_lv<64> > tmp_17_fu_448_p3;
    sc_signal< sc_lv<64> > tmp_18_fu_492_p3;
    sc_signal< sc_lv<64> > tmp_19_fu_518_p3;
    sc_signal< sc_lv<64> > tmp_20_fu_549_p3;
    sc_signal< sc_lv<64> > tmp_21_fu_595_p3;
    sc_signal< sc_lv<64> > tmp_23_fu_609_p3;
    sc_signal< sc_lv<64> > tmp_24_fu_623_p3;
    sc_signal< sc_lv<64> > tmp_25_fu_637_p3;
    sc_signal< sc_lv<64> > zext_ln78_4_fu_855_p1;
    sc_signal< sc_lv<64> > zext_ln79_1_fu_881_p1;
    sc_signal< sc_lv<64> > zext_ln89_4_fu_973_p1;
    sc_signal< sc_lv<64> > zext_ln90_1_fu_999_p1;
    sc_signal< sc_lv<32> > bitcast_ln705_fu_1009_p1;
    sc_signal< sc_lv<32> > bitcast_ln705_1_fu_1014_p1;
    sc_signal< sc_logic > ap_CS_fsm_state34;
    sc_signal< sc_lv<32> > select_ln91_fu_941_p3;
    sc_signal< sc_lv<32> > grp_fu_343_p0;
    sc_signal< sc_lv<32> > grp_fu_343_p1;
    sc_signal< sc_logic > ap_CS_fsm_state38;
    sc_signal< sc_logic > ap_CS_fsm_state39;
    sc_signal< sc_lv<32> > grp_fu_355_p0;
    sc_signal< sc_lv<32> > grp_fu_355_p1;
    sc_signal< sc_logic > ap_CS_fsm_state17;
    sc_signal< sc_lv<32> > grp_fu_386_p0;
    sc_signal< sc_lv<7> > or_ln52_fu_428_p2;
    sc_signal< sc_lv<7> > or_ln46_fu_443_p2;
    sc_signal< sc_lv<8> > tmp_26_fu_465_p4;
    sc_signal< sc_lv<23> > trunc_ln257_fu_461_p1;
    sc_signal< sc_lv<7> > or_ln48_fu_487_p2;
    sc_signal< sc_lv<32> > p_Result_s_fu_501_p3;
    sc_signal< sc_lv<7> > or_ln49_fu_513_p2;
    sc_signal< sc_lv<1> > or_ln257_fu_527_p2;
    sc_signal< sc_lv<1> > grp_fu_386_p2;
    sc_signal< sc_lv<1> > and_ln257_fu_531_p2;
    sc_signal< sc_lv<7> > or_ln50_fu_544_p2;
    sc_signal< sc_lv<1> > trunc_ln302_fu_558_p1;
    sc_signal< sc_lv<1> > hasMemSizeError_fu_578_p2;
    sc_signal< sc_lv<1> > isNotRunning_fu_572_p2;
    sc_signal< sc_lv<7> > or_ln51_fu_590_p2;
    sc_signal< sc_lv<7> > or_ln53_fu_604_p2;
    sc_signal< sc_lv<7> > or_ln55_fu_618_p2;
    sc_signal< sc_lv<7> > or_ln56_fu_632_p2;
    sc_signal< sc_lv<31> > trunc_ln368_7_fu_654_p1;
    sc_signal< sc_lv<32> > p_Result_20_fu_658_p3;
    sc_signal< sc_lv<32> > p_Val2_13_fu_673_p1;
    sc_signal< sc_lv<9> > zext_ln339_fu_691_p1;
    sc_signal< sc_lv<9> > add_ln339_fu_694_p2;
    sc_signal< sc_lv<8> > sub_ln1311_fu_708_p2;
    sc_signal< sc_lv<9> > sext_ln1311_fu_713_p1;
    sc_signal< sc_lv<25> > mantissa_V_fu_725_p4;
    sc_signal< sc_lv<32> > sext_ln1311_1_fu_738_p1;
    sc_signal< sc_lv<25> > sext_ln1311_2_fu_741_p1;
    sc_signal< sc_lv<79> > zext_ln682_fu_734_p1;
    sc_signal< sc_lv<79> > zext_ln1287_fu_744_p1;
    sc_signal< sc_lv<25> > r_V_fu_748_p2;
    sc_signal< sc_lv<1> > tmp_fu_760_p3;
    sc_signal< sc_lv<79> > r_V_1_fu_754_p2;
    sc_signal< sc_lv<32> > zext_ln662_fu_768_p1;
    sc_signal< sc_lv<32> > tmp_27_fu_772_p4;
    sc_signal< sc_lv<32> > sub_ln72_1_fu_795_p2;
    sc_signal< sc_lv<1> > icmp_ln72_fu_789_p2;
    sc_signal< sc_lv<32> > add_ln72_fu_801_p2;
    sc_signal< sc_lv<32> > sub_ln72_fu_807_p2;
    sc_signal< sc_lv<32> > currentPeriod_fu_813_p3;
    sc_signal< sc_lv<32> > val_V_fu_782_p3;
    sc_signal< sc_lv<33> > shl_ln_fu_837_p3;
    sc_signal< sc_lv<34> > zext_ln78_1_fu_830_p1;
    sc_signal< sc_lv<34> > zext_ln78_3_fu_845_p1;
    sc_signal< sc_lv<34> > add_ln78_fu_849_p2;
    sc_signal< sc_lv<33> > zext_ln78_fu_827_p1;
    sc_signal< sc_lv<33> > add_ln79_fu_865_p2;
    sc_signal< sc_lv<34> > zext_ln79_fu_871_p1;
    sc_signal< sc_lv<34> > add_ln79_1_fu_875_p2;
    sc_signal< sc_lv<32> > grp_fu_396_p2;
    sc_signal< sc_lv<33> > zext_ln78_2_fu_833_p1;
    sc_signal< sc_lv<33> > sext_ln1354_fu_891_p1;
    sc_signal< sc_lv<1> > icmp_ln887_fu_895_p2;
    sc_signal< sc_lv<32> > add_ln82_fu_901_p2;
    sc_signal< sc_lv<33> > zext_ln89_2_fu_921_p1;
    sc_signal< sc_lv<33> > sext_ln1354_1_fu_925_p1;
    sc_signal< sc_lv<32> > add_ln91_fu_935_p2;
    sc_signal< sc_lv<33> > shl_ln1_fu_955_p3;
    sc_signal< sc_lv<34> > zext_ln89_1_fu_952_p1;
    sc_signal< sc_lv<34> > zext_ln89_3_fu_963_p1;
    sc_signal< sc_lv<34> > add_ln89_fu_967_p2;
    sc_signal< sc_lv<33> > zext_ln89_fu_949_p1;
    sc_signal< sc_lv<33> > add_ln90_fu_983_p2;
    sc_signal< sc_lv<34> > zext_ln90_fu_989_p1;
    sc_signal< sc_lv<34> > add_ln90_1_fu_993_p2;
    sc_signal< sc_logic > grp_fu_343_ce;
    sc_signal< sc_logic > ap_CS_fsm_state40;
    sc_signal< sc_logic > ap_CS_fsm_state41;
    sc_signal< sc_logic > ap_CS_fsm_state42;
    sc_signal< sc_logic > grp_fu_347_ce;
    sc_signal< sc_logic > grp_fu_351_ce;
    sc_signal< sc_lv<32> > ap_return_0_preg;
    sc_signal< sc_lv<32> > ap_return_1_preg;
    sc_signal< sc_lv<51> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<51> ap_ST_fsm_state1;
    static const sc_lv<51> ap_ST_fsm_state2;
    static const sc_lv<51> ap_ST_fsm_state3;
    static const sc_lv<51> ap_ST_fsm_state4;
    static const sc_lv<51> ap_ST_fsm_state5;
    static const sc_lv<51> ap_ST_fsm_state6;
    static const sc_lv<51> ap_ST_fsm_state7;
    static const sc_lv<51> ap_ST_fsm_state8;
    static const sc_lv<51> ap_ST_fsm_state9;
    static const sc_lv<51> ap_ST_fsm_state10;
    static const sc_lv<51> ap_ST_fsm_state11;
    static const sc_lv<51> ap_ST_fsm_state12;
    static const sc_lv<51> ap_ST_fsm_state13;
    static const sc_lv<51> ap_ST_fsm_state14;
    static const sc_lv<51> ap_ST_fsm_state15;
    static const sc_lv<51> ap_ST_fsm_state16;
    static const sc_lv<51> ap_ST_fsm_state17;
    static const sc_lv<51> ap_ST_fsm_state18;
    static const sc_lv<51> ap_ST_fsm_state19;
    static const sc_lv<51> ap_ST_fsm_state20;
    static const sc_lv<51> ap_ST_fsm_state21;
    static const sc_lv<51> ap_ST_fsm_state22;
    static const sc_lv<51> ap_ST_fsm_state23;
    static const sc_lv<51> ap_ST_fsm_state24;
    static const sc_lv<51> ap_ST_fsm_state25;
    static const sc_lv<51> ap_ST_fsm_state26;
    static const sc_lv<51> ap_ST_fsm_state27;
    static const sc_lv<51> ap_ST_fsm_state28;
    static const sc_lv<51> ap_ST_fsm_state29;
    static const sc_lv<51> ap_ST_fsm_state30;
    static const sc_lv<51> ap_ST_fsm_state31;
    static const sc_lv<51> ap_ST_fsm_state32;
    static const sc_lv<51> ap_ST_fsm_state33;
    static const sc_lv<51> ap_ST_fsm_state34;
    static const sc_lv<51> ap_ST_fsm_state35;
    static const sc_lv<51> ap_ST_fsm_state36;
    static const sc_lv<51> ap_ST_fsm_state37;
    static const sc_lv<51> ap_ST_fsm_state38;
    static const sc_lv<51> ap_ST_fsm_state39;
    static const sc_lv<51> ap_ST_fsm_state40;
    static const sc_lv<51> ap_ST_fsm_state41;
    static const sc_lv<51> ap_ST_fsm_state42;
    static const sc_lv<51> ap_ST_fsm_state43;
    static const sc_lv<51> ap_ST_fsm_state44;
    static const sc_lv<51> ap_ST_fsm_state45;
    static const sc_lv<51> ap_ST_fsm_state46;
    static const sc_lv<51> ap_ST_fsm_state47;
    static const sc_lv<51> ap_ST_fsm_state48;
    static const sc_lv<51> ap_ST_fsm_state49;
    static const sc_lv<51> ap_ST_fsm_state50;
    static const sc_lv<51> ap_ST_fsm_state51;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_17;
    static const sc_lv<32> ap_const_lv32_1E;
    static const sc_lv<32> ap_const_lv32_18;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<32> ap_const_lv32_2B;
    static const sc_lv<32> ap_const_lv32_2C;
    static const sc_lv<32> ap_const_lv32_31;
    static const sc_lv<32> ap_const_lv32_2D;
    static const sc_lv<32> ap_const_lv32_32;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<1> ap_const_lv1_1;
    static const bool ap_const_boolean_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_F;
    static const sc_lv<32> ap_const_lv32_13;
    static const sc_lv<32> ap_const_lv32_14;
    static const sc_lv<32> ap_const_lv32_15;
    static const sc_lv<32> ap_const_lv32_16;
    static const sc_lv<32> ap_const_lv32_20;
    static const sc_lv<32> ap_const_lv32_24;
    static const sc_lv<32> ap_const_lv32_2A;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<4> ap_const_lv4_F;
    static const sc_lv<32> ap_const_lv32_21;
    static const sc_lv<32> ap_const_lv32_25;
    static const sc_lv<32> ap_const_lv32_26;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<32> ap_const_lv32_3F4CCCCD;
    static const sc_lv<32> ap_const_lv32_FFFFFFFE;
    static const sc_lv<7> ap_const_lv7_6;
    static const sc_lv<57> ap_const_lv57_0;
    static const sc_lv<7> ap_const_lv7_1;
    static const sc_lv<8> ap_const_lv8_FF;
    static const sc_lv<23> ap_const_lv23_0;
    static const sc_lv<7> ap_const_lv7_2;
    static const sc_lv<7> ap_const_lv7_3;
    static const sc_lv<7> ap_const_lv7_4;
    static const sc_lv<31> ap_const_lv31_0;
    static const sc_lv<7> ap_const_lv7_5;
    static const sc_lv<7> ap_const_lv7_7;
    static const sc_lv<7> ap_const_lv7_8;
    static const sc_lv<7> ap_const_lv7_9;
    static const sc_lv<9> ap_const_lv9_181;
    static const sc_lv<8> ap_const_lv8_7F;
    static const sc_lv<32> ap_const_lv32_37;
    static const sc_lv<33> ap_const_lv33_1;
    static const sc_lv<32> ap_const_lv32_27;
    static const sc_lv<32> ap_const_lv32_28;
    static const sc_lv<32> ap_const_lv32_29;
    static const sc_lv<5> ap_const_lv5_2;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_var_for_const1();
    void thread_ap_var_for_const2();
    void thread_ap_clk_no_reset_();
    void thread_add_ln339_fu_694_p2();
    void thread_add_ln72_fu_801_p2();
    void thread_add_ln78_fu_849_p2();
    void thread_add_ln79_1_fu_875_p2();
    void thread_add_ln79_fu_865_p2();
    void thread_add_ln82_fu_901_p2();
    void thread_add_ln89_fu_967_p2();
    void thread_add_ln90_1_fu_993_p2();
    void thread_add_ln90_fu_983_p2();
    void thread_add_ln91_fu_935_p2();
    void thread_and_ln257_fu_531_p2();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state10();
    void thread_ap_CS_fsm_state11();
    void thread_ap_CS_fsm_state16();
    void thread_ap_CS_fsm_state17();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state20();
    void thread_ap_CS_fsm_state21();
    void thread_ap_CS_fsm_state22();
    void thread_ap_CS_fsm_state23();
    void thread_ap_CS_fsm_state24();
    void thread_ap_CS_fsm_state25();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state31();
    void thread_ap_CS_fsm_state32();
    void thread_ap_CS_fsm_state33();
    void thread_ap_CS_fsm_state34();
    void thread_ap_CS_fsm_state37();
    void thread_ap_CS_fsm_state38();
    void thread_ap_CS_fsm_state39();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state40();
    void thread_ap_CS_fsm_state41();
    void thread_ap_CS_fsm_state42();
    void thread_ap_CS_fsm_state43();
    void thread_ap_CS_fsm_state44();
    void thread_ap_CS_fsm_state45();
    void thread_ap_CS_fsm_state46();
    void thread_ap_CS_fsm_state5();
    void thread_ap_CS_fsm_state50();
    void thread_ap_CS_fsm_state51();
    void thread_ap_CS_fsm_state6();
    void thread_ap_CS_fsm_state7();
    void thread_ap_CS_fsm_state8();
    void thread_ap_CS_fsm_state9();
    void thread_ap_block_state45_io();
    void thread_ap_block_state51();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_phi_mux_agg_result_l_write_a_phi_fu_328_p4();
    void thread_ap_phi_mux_agg_result_r_write_a_phi_fu_337_p4();
    void thread_ap_ready();
    void thread_ap_return_0();
    void thread_ap_return_1();
    void thread_auxL_fu_915_p1();
    void thread_auxR_fu_918_p1();
    void thread_bitcast_ln348_fu_508_p1();
    void thread_bitcast_ln705_1_fu_1014_p1();
    void thread_bitcast_ln705_fu_1009_p1();
    void thread_config_r_address0();
    void thread_config_r_ce0();
    void thread_config_r_d0();
    void thread_config_r_we0();
    void thread_currentPeriod_fu_813_p3();
    void thread_delayVolRatio_fu_650_p1();
    void thread_directVolRatio_fu_646_p1();
    void thread_extMemPtr_V_blk_n_AR();
    void thread_extMemPtr_V_blk_n_AW();
    void thread_extMemPtr_V_blk_n_B();
    void thread_extMemPtr_V_blk_n_R();
    void thread_extMemPtr_V_blk_n_W();
    void thread_feedbackVolRatio_fu_537_p3();
    void thread_grp_fu_343_ce();
    void thread_grp_fu_343_p0();
    void thread_grp_fu_343_p1();
    void thread_grp_fu_347_ce();
    void thread_grp_fu_351_ce();
    void thread_grp_fu_355_p0();
    void thread_grp_fu_355_p1();
    void thread_grp_fu_386_p0();
    void thread_grp_fu_391_p2();
    void thread_grp_fu_396_p2();
    void thread_hasMemSizeError_fu_578_p2();
    void thread_icmp_ln257_6_fu_481_p2();
    void thread_icmp_ln257_fu_475_p2();
    void thread_icmp_ln72_fu_789_p2();
    void thread_icmp_ln76_fu_821_p2();
    void thread_icmp_ln887_1_fu_929_p2();
    void thread_icmp_ln887_fu_895_p2();
    void thread_isNeg_fu_700_p3();
    void thread_isNotRunning_fu_572_p2();
    void thread_m_axi_extMemPtr_V_ARADDR();
    void thread_m_axi_extMemPtr_V_ARBURST();
    void thread_m_axi_extMemPtr_V_ARCACHE();
    void thread_m_axi_extMemPtr_V_ARID();
    void thread_m_axi_extMemPtr_V_ARLEN();
    void thread_m_axi_extMemPtr_V_ARLOCK();
    void thread_m_axi_extMemPtr_V_ARPROT();
    void thread_m_axi_extMemPtr_V_ARQOS();
    void thread_m_axi_extMemPtr_V_ARREGION();
    void thread_m_axi_extMemPtr_V_ARSIZE();
    void thread_m_axi_extMemPtr_V_ARUSER();
    void thread_m_axi_extMemPtr_V_ARVALID();
    void thread_m_axi_extMemPtr_V_AWADDR();
    void thread_m_axi_extMemPtr_V_AWBURST();
    void thread_m_axi_extMemPtr_V_AWCACHE();
    void thread_m_axi_extMemPtr_V_AWID();
    void thread_m_axi_extMemPtr_V_AWLEN();
    void thread_m_axi_extMemPtr_V_AWLOCK();
    void thread_m_axi_extMemPtr_V_AWPROT();
    void thread_m_axi_extMemPtr_V_AWQOS();
    void thread_m_axi_extMemPtr_V_AWREGION();
    void thread_m_axi_extMemPtr_V_AWSIZE();
    void thread_m_axi_extMemPtr_V_AWUSER();
    void thread_m_axi_extMemPtr_V_AWVALID();
    void thread_m_axi_extMemPtr_V_BREADY();
    void thread_m_axi_extMemPtr_V_RREADY();
    void thread_m_axi_extMemPtr_V_WDATA();
    void thread_m_axi_extMemPtr_V_WID();
    void thread_m_axi_extMemPtr_V_WLAST();
    void thread_m_axi_extMemPtr_V_WSTRB();
    void thread_m_axi_extMemPtr_V_WUSER();
    void thread_m_axi_extMemPtr_V_WVALID();
    void thread_mantissa_V_fu_725_p4();
    void thread_maxIndex_V_fu_670_p1();
    void thread_or_ln257_fu_527_p2();
    void thread_or_ln46_fu_443_p2();
    void thread_or_ln48_fu_487_p2();
    void thread_or_ln49_fu_513_p2();
    void thread_or_ln50_fu_544_p2();
    void thread_or_ln51_fu_590_p2();
    void thread_or_ln52_fu_428_p2();
    void thread_or_ln53_fu_604_p2();
    void thread_or_ln55_fu_618_p2();
    void thread_or_ln56_fu_632_p2();
    void thread_or_ln62_fu_584_p2();
    void thread_p_Result_20_fu_658_p3();
    void thread_p_Result_s_fu_501_p3();
    void thread_p_Val2_13_fu_673_p1();
    void thread_periodRatio_fu_666_p1();
    void thread_r_V_1_fu_754_p2();
    void thread_r_V_fu_748_p2();
    void thread_select_ln82_fu_907_p3();
    void thread_select_ln91_fu_941_p3();
    void thread_sext_ln1311_1_fu_738_p1();
    void thread_sext_ln1311_2_fu_741_p1();
    void thread_sext_ln1311_fu_713_p1();
    void thread_sext_ln1354_1_fu_925_p1();
    void thread_sext_ln1354_fu_891_p1();
    void thread_shl_ln1_fu_955_p3();
    void thread_shl_ln_fu_837_p3();
    void thread_sub_ln1311_fu_708_p2();
    void thread_sub_ln72_1_fu_795_p2();
    void thread_sub_ln72_fu_807_p2();
    void thread_tmp_16_fu_420_p3();
    void thread_tmp_17_fu_448_p3();
    void thread_tmp_18_fu_492_p3();
    void thread_tmp_19_fu_518_p3();
    void thread_tmp_20_fu_549_p3();
    void thread_tmp_21_fu_595_p3();
    void thread_tmp_22_fu_434_p3();
    void thread_tmp_23_fu_609_p3();
    void thread_tmp_24_fu_623_p3();
    void thread_tmp_25_fu_637_p3();
    void thread_tmp_26_fu_465_p4();
    void thread_tmp_27_fu_772_p4();
    void thread_tmp_V_1_fu_687_p1();
    void thread_tmp_fu_760_p3();
    void thread_trunc_ln257_fu_461_p1();
    void thread_trunc_ln302_fu_558_p1();
    void thread_trunc_ln368_7_fu_654_p1();
    void thread_trunc_ln368_fu_457_p1();
    void thread_ush_fu_717_p3();
    void thread_val_V_fu_782_p3();
    void thread_val_assign_s_fu_562_p4();
    void thread_zext_ln1287_fu_744_p1();
    void thread_zext_ln339_fu_691_p1();
    void thread_zext_ln662_fu_768_p1();
    void thread_zext_ln682_fu_734_p1();
    void thread_zext_ln78_1_fu_830_p1();
    void thread_zext_ln78_2_fu_833_p1();
    void thread_zext_ln78_3_fu_845_p1();
    void thread_zext_ln78_4_fu_855_p1();
    void thread_zext_ln78_fu_827_p1();
    void thread_zext_ln79_1_fu_881_p1();
    void thread_zext_ln79_fu_871_p1();
    void thread_zext_ln89_1_fu_952_p1();
    void thread_zext_ln89_2_fu_921_p1();
    void thread_zext_ln89_3_fu_963_p1();
    void thread_zext_ln89_4_fu_973_p1();
    void thread_zext_ln89_fu_949_p1();
    void thread_zext_ln90_1_fu_999_p1();
    void thread_zext_ln90_fu_989_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
