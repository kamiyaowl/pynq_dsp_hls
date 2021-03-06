// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1.3
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _effect_iir_HH_
#define _effect_iir_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "pynq_dsp_hls_faddbkb.h"
#include "pynq_dsp_hls_fmulcud.h"

namespace ap_rtl {

struct effect_iir : public sc_module {
    // Port declarations 16
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<32> > inData_l;
    sc_in< sc_lv<32> > inData_r;
    sc_out< sc_lv<8> > config_r_address0;
    sc_out< sc_logic > config_r_ce0;
    sc_out< sc_logic > config_r_we0;
    sc_out< sc_lv<32> > config_r_d0;
    sc_in< sc_lv<32> > config_r_q0;
    sc_in< sc_lv<5> > config_offset;
    sc_out< sc_lv<32> > ap_return_0;
    sc_out< sc_lv<32> > ap_return_1;
    sc_signal< sc_logic > ap_var_for_const0;


    // Module declarations
    effect_iir(sc_module_name name);
    SC_HAS_PROCESS(effect_iir);

    ~effect_iir();

    sc_trace_file* mVcdFile;

    pynq_dsp_hls_faddbkb<1,7,32,32,32>* pynq_dsp_hls_faddbkb_U1;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U2;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U3;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U4;
    pynq_dsp_hls_fmulcud<1,4,32,32,32>* pynq_dsp_hls_fmulcud_U5;
    sc_signal< sc_lv<38> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<32> > reg_206;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<32> > reg_211;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_logic > ap_CS_fsm_state10;
    sc_signal< sc_logic > ap_CS_fsm_state12;
    sc_signal< sc_logic > ap_CS_fsm_state13;
    sc_signal< sc_lv<32> > grp_fu_188_p2;
    sc_signal< sc_lv<32> > reg_215;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_logic > ap_CS_fsm_state15;
    sc_signal< sc_logic > ap_CS_fsm_state22;
    sc_signal< sc_lv<32> > grp_fu_193_p2;
    sc_signal< sc_lv<32> > reg_221;
    sc_signal< sc_lv<32> > reg_226;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_logic > ap_CS_fsm_state16;
    sc_signal< sc_lv<32> > reg_232;
    sc_signal< sc_logic > ap_CS_fsm_state11;
    sc_signal< sc_logic > ap_CS_fsm_state14;
    sc_signal< sc_lv<32> > grp_fu_184_p2;
    sc_signal< sc_lv<32> > reg_237;
    sc_signal< sc_logic > ap_CS_fsm_state29;
    sc_signal< sc_logic > ap_CS_fsm_state36;
    sc_signal< sc_lv<32> > reg_242;
    sc_signal< sc_logic > ap_CS_fsm_state23;
    sc_signal< sc_logic > ap_CS_fsm_state30;
    sc_signal< sc_logic > ap_CS_fsm_state37;
    sc_signal< sc_lv<9> > tmp_15_fu_247_p3;
    sc_signal< sc_lv<9> > tmp_15_reg_530;
    sc_signal< sc_lv<8> > config_addr_9_reg_556;
    sc_signal< sc_lv<8> > config_addr_10_reg_561;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<32> > config_load_9_reg_566;
    sc_signal< sc_lv<32> > b0_fu_312_p1;
    sc_signal< sc_lv<32> > b0_reg_578;
    sc_signal< sc_lv<32> > b1_fu_317_p1;
    sc_signal< sc_lv<32> > b1_reg_583;
    sc_signal< sc_lv<32> > bz1L_fu_322_p1;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_lv<32> > bz1R_fu_326_p1;
    sc_signal< sc_lv<32> > tmp_2_reg_609;
    sc_signal< sc_lv<8> > config_addr_11_reg_614;
    sc_signal< sc_lv<8> > config_addr_12_reg_619;
    sc_signal< sc_lv<32> > b2_fu_387_p1;
    sc_signal< sc_lv<32> > b2_reg_629;
    sc_signal< sc_lv<32> > bz2L_fu_392_p1;
    sc_signal< sc_lv<8> > config_addr_5_reg_639;
    sc_signal< sc_lv<32> > bz2R_fu_411_p1;
    sc_signal< sc_lv<8> > config_addr_6_reg_649;
    sc_signal< sc_lv<32> > config_load_6_reg_659;
    sc_signal< sc_lv<8> > config_addr_7_reg_664;
    sc_signal< sc_lv<8> > config_addr_8_reg_669;
    sc_signal< sc_lv<32> > config_load_1_reg_674;
    sc_signal< sc_lv<32> > config_load_7_reg_679;
    sc_signal< sc_logic > ap_CS_fsm_state17;
    sc_signal< sc_lv<32> > config_load_8_reg_684;
    sc_signal< sc_logic > ap_CS_fsm_state18;
    sc_signal< sc_lv<32> > a1_fu_472_p1;
    sc_signal< sc_logic > ap_CS_fsm_state19;
    sc_signal< sc_lv<32> > a2_fu_478_p1;
    sc_signal< sc_lv<32> > az1L_fu_483_p1;
    sc_signal< sc_lv<32> > az2L_fu_492_p1;
    sc_signal< sc_lv<32> > grp_fu_198_p2;
    sc_signal< sc_lv<32> > tmp_12_reg_721;
    sc_signal< sc_lv<32> > grp_fu_202_p2;
    sc_signal< sc_lv<32> > tmp_14_reg_726;
    sc_signal< sc_lv<64> > tmp_18_fu_261_p3;
    sc_signal< sc_lv<64> > tmp_19_fu_275_p3;
    sc_signal< sc_lv<64> > tmp_25_fu_289_p3;
    sc_signal< sc_lv<64> > tmp_26_fu_303_p3;
    sc_signal< sc_lv<64> > tmp_20_fu_336_p3;
    sc_signal< sc_lv<64> > tmp_27_fu_350_p3;
    sc_signal< sc_lv<64> > tmp_28_fu_364_p3;
    sc_signal< sc_lv<64> > tmp_16_fu_378_p3;
    sc_signal< sc_lv<64> > tmp_21_fu_402_p3;
    sc_signal< sc_lv<64> > tmp_22_fu_421_p3;
    sc_signal< sc_lv<64> > tmp_17_fu_435_p3;
    sc_signal< sc_lv<64> > tmp_23_fu_449_p3;
    sc_signal< sc_lv<64> > tmp_24_fu_463_p3;
    sc_signal< sc_logic > ap_CS_fsm_state20;
    sc_signal< sc_lv<32> > bitcast_ln705_2_fu_500_p1;
    sc_signal< sc_logic > ap_CS_fsm_state21;
    sc_signal< sc_lv<32> > bitcast_ln705_3_fu_504_p1;
    sc_signal< sc_lv<32> > bitcast_ln705_fu_508_p1;
    sc_signal< sc_logic > ap_CS_fsm_state38;
    sc_signal< sc_lv<32> > bitcast_ln705_1_fu_513_p1;
    sc_signal< sc_lv<32> > grp_fu_184_p0;
    sc_signal< sc_lv<32> > grp_fu_184_p1;
    sc_signal< sc_logic > ap_CS_fsm_state24;
    sc_signal< sc_logic > ap_CS_fsm_state31;
    sc_signal< sc_lv<32> > grp_fu_188_p0;
    sc_signal< sc_lv<32> > grp_fu_188_p1;
    sc_signal< sc_lv<32> > grp_fu_193_p0;
    sc_signal< sc_lv<32> > grp_fu_193_p1;
    sc_signal< sc_lv<32> > grp_fu_198_p0;
    sc_signal< sc_lv<32> > grp_fu_198_p1;
    sc_signal< sc_lv<32> > grp_fu_202_p0;
    sc_signal< sc_lv<32> > grp_fu_202_p1;
    sc_signal< sc_lv<9> > or_ln112_fu_255_p2;
    sc_signal< sc_lv<9> > or_ln113_fu_270_p2;
    sc_signal< sc_lv<9> > or_ln121_fu_284_p2;
    sc_signal< sc_lv<9> > or_ln122_fu_298_p2;
    sc_signal< sc_lv<9> > or_ln114_fu_331_p2;
    sc_signal< sc_lv<9> > or_ln123_fu_345_p2;
    sc_signal< sc_lv<9> > or_ln124_fu_359_p2;
    sc_signal< sc_lv<9> > or_ln110_fu_373_p2;
    sc_signal< sc_lv<9> > or_ln117_fu_397_p2;
    sc_signal< sc_lv<9> > or_ln118_fu_416_p2;
    sc_signal< sc_lv<9> > or_ln111_fu_430_p2;
    sc_signal< sc_lv<9> > or_ln119_fu_444_p2;
    sc_signal< sc_lv<9> > or_ln120_fu_458_p2;
    sc_signal< sc_lv<38> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<38> ap_ST_fsm_state1;
    static const sc_lv<38> ap_ST_fsm_state2;
    static const sc_lv<38> ap_ST_fsm_state3;
    static const sc_lv<38> ap_ST_fsm_state4;
    static const sc_lv<38> ap_ST_fsm_state5;
    static const sc_lv<38> ap_ST_fsm_state6;
    static const sc_lv<38> ap_ST_fsm_state7;
    static const sc_lv<38> ap_ST_fsm_state8;
    static const sc_lv<38> ap_ST_fsm_state9;
    static const sc_lv<38> ap_ST_fsm_state10;
    static const sc_lv<38> ap_ST_fsm_state11;
    static const sc_lv<38> ap_ST_fsm_state12;
    static const sc_lv<38> ap_ST_fsm_state13;
    static const sc_lv<38> ap_ST_fsm_state14;
    static const sc_lv<38> ap_ST_fsm_state15;
    static const sc_lv<38> ap_ST_fsm_state16;
    static const sc_lv<38> ap_ST_fsm_state17;
    static const sc_lv<38> ap_ST_fsm_state18;
    static const sc_lv<38> ap_ST_fsm_state19;
    static const sc_lv<38> ap_ST_fsm_state20;
    static const sc_lv<38> ap_ST_fsm_state21;
    static const sc_lv<38> ap_ST_fsm_state22;
    static const sc_lv<38> ap_ST_fsm_state23;
    static const sc_lv<38> ap_ST_fsm_state24;
    static const sc_lv<38> ap_ST_fsm_state25;
    static const sc_lv<38> ap_ST_fsm_state26;
    static const sc_lv<38> ap_ST_fsm_state27;
    static const sc_lv<38> ap_ST_fsm_state28;
    static const sc_lv<38> ap_ST_fsm_state29;
    static const sc_lv<38> ap_ST_fsm_state30;
    static const sc_lv<38> ap_ST_fsm_state31;
    static const sc_lv<38> ap_ST_fsm_state32;
    static const sc_lv<38> ap_ST_fsm_state33;
    static const sc_lv<38> ap_ST_fsm_state34;
    static const sc_lv<38> ap_ST_fsm_state35;
    static const sc_lv<38> ap_ST_fsm_state36;
    static const sc_lv<38> ap_ST_fsm_state37;
    static const sc_lv<38> ap_ST_fsm_state38;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<32> ap_const_lv32_B;
    static const sc_lv<32> ap_const_lv32_C;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_E;
    static const sc_lv<32> ap_const_lv32_15;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_F;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<32> ap_const_lv32_D;
    static const sc_lv<32> ap_const_lv32_1C;
    static const sc_lv<32> ap_const_lv32_23;
    static const sc_lv<32> ap_const_lv32_16;
    static const sc_lv<32> ap_const_lv32_1D;
    static const sc_lv<32> ap_const_lv32_24;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<32> ap_const_lv32_11;
    static const sc_lv<32> ap_const_lv32_12;
    static const sc_lv<32> ap_const_lv32_13;
    static const sc_lv<32> ap_const_lv32_14;
    static const sc_lv<32> ap_const_lv32_25;
    static const sc_lv<32> ap_const_lv32_17;
    static const sc_lv<32> ap_const_lv32_1E;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<9> ap_const_lv9_5;
    static const sc_lv<55> ap_const_lv55_0;
    static const sc_lv<9> ap_const_lv9_6;
    static const sc_lv<9> ap_const_lv9_C;
    static const sc_lv<9> ap_const_lv9_D;
    static const sc_lv<9> ap_const_lv9_7;
    static const sc_lv<9> ap_const_lv9_E;
    static const sc_lv<9> ap_const_lv9_F;
    static const sc_lv<9> ap_const_lv9_3;
    static const sc_lv<9> ap_const_lv9_8;
    static const sc_lv<9> ap_const_lv9_9;
    static const sc_lv<9> ap_const_lv9_4;
    static const sc_lv<9> ap_const_lv9_A;
    static const sc_lv<9> ap_const_lv9_B;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_clk_no_reset_();
    void thread_a1_fu_472_p1();
    void thread_a2_fu_478_p1();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state10();
    void thread_ap_CS_fsm_state11();
    void thread_ap_CS_fsm_state12();
    void thread_ap_CS_fsm_state13();
    void thread_ap_CS_fsm_state14();
    void thread_ap_CS_fsm_state15();
    void thread_ap_CS_fsm_state16();
    void thread_ap_CS_fsm_state17();
    void thread_ap_CS_fsm_state18();
    void thread_ap_CS_fsm_state19();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state20();
    void thread_ap_CS_fsm_state21();
    void thread_ap_CS_fsm_state22();
    void thread_ap_CS_fsm_state23();
    void thread_ap_CS_fsm_state24();
    void thread_ap_CS_fsm_state29();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state30();
    void thread_ap_CS_fsm_state31();
    void thread_ap_CS_fsm_state36();
    void thread_ap_CS_fsm_state37();
    void thread_ap_CS_fsm_state38();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state5();
    void thread_ap_CS_fsm_state6();
    void thread_ap_CS_fsm_state8();
    void thread_ap_CS_fsm_state9();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_return_0();
    void thread_ap_return_1();
    void thread_az1L_fu_483_p1();
    void thread_az2L_fu_492_p1();
    void thread_b0_fu_312_p1();
    void thread_b1_fu_317_p1();
    void thread_b2_fu_387_p1();
    void thread_bitcast_ln705_1_fu_513_p1();
    void thread_bitcast_ln705_2_fu_500_p1();
    void thread_bitcast_ln705_3_fu_504_p1();
    void thread_bitcast_ln705_fu_508_p1();
    void thread_bz1L_fu_322_p1();
    void thread_bz1R_fu_326_p1();
    void thread_bz2L_fu_392_p1();
    void thread_bz2R_fu_411_p1();
    void thread_config_r_address0();
    void thread_config_r_ce0();
    void thread_config_r_d0();
    void thread_config_r_we0();
    void thread_grp_fu_184_p0();
    void thread_grp_fu_184_p1();
    void thread_grp_fu_188_p0();
    void thread_grp_fu_188_p1();
    void thread_grp_fu_193_p0();
    void thread_grp_fu_193_p1();
    void thread_grp_fu_198_p0();
    void thread_grp_fu_198_p1();
    void thread_grp_fu_202_p0();
    void thread_grp_fu_202_p1();
    void thread_or_ln110_fu_373_p2();
    void thread_or_ln111_fu_430_p2();
    void thread_or_ln112_fu_255_p2();
    void thread_or_ln113_fu_270_p2();
    void thread_or_ln114_fu_331_p2();
    void thread_or_ln117_fu_397_p2();
    void thread_or_ln118_fu_416_p2();
    void thread_or_ln119_fu_444_p2();
    void thread_or_ln120_fu_458_p2();
    void thread_or_ln121_fu_284_p2();
    void thread_or_ln122_fu_298_p2();
    void thread_or_ln123_fu_345_p2();
    void thread_or_ln124_fu_359_p2();
    void thread_tmp_15_fu_247_p3();
    void thread_tmp_16_fu_378_p3();
    void thread_tmp_17_fu_435_p3();
    void thread_tmp_18_fu_261_p3();
    void thread_tmp_19_fu_275_p3();
    void thread_tmp_20_fu_336_p3();
    void thread_tmp_21_fu_402_p3();
    void thread_tmp_22_fu_421_p3();
    void thread_tmp_23_fu_449_p3();
    void thread_tmp_24_fu_463_p3();
    void thread_tmp_25_fu_289_p3();
    void thread_tmp_26_fu_303_p3();
    void thread_tmp_27_fu_350_p3();
    void thread_tmp_28_fu_364_p3();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
