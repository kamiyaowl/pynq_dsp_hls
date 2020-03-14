-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1.3
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity effect_compressor is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    inData_l : IN STD_LOGIC_VECTOR (31 downto 0);
    inData_r : IN STD_LOGIC_VECTOR (31 downto 0);
    config_r_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    config_r_ce0 : OUT STD_LOGIC;
    config_r_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    config_offset : IN STD_LOGIC_VECTOR (4 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of effect_compressor is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (22 downto 0) := "00000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (22 downto 0) := "00000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (22 downto 0) := "00000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (22 downto 0) := "00000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (22 downto 0) := "00000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (22 downto 0) := "00000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (22 downto 0) := "00001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (22 downto 0) := "00010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (22 downto 0) := "00100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (22 downto 0) := "01000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (22 downto 0) := "10000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv55_0 : STD_LOGIC_VECTOR (54 downto 0) := "0000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv23_0 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
    constant ap_const_lv9_2 : STD_LOGIC_VECTOR (8 downto 0) := "000000010";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_80000000 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv5_4 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_fu_95_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_121 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal and_ln24_1_reg_525 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state22 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state22 : signal is "none";
    signal grp_fu_99_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_126 : STD_LOGIC_VECTOR (31 downto 0);
    signal and_ln31_1_reg_531 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_43_fu_131_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_43_reg_458 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln368_fu_154_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal trunc_ln368_reg_468 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal or_ln24_1_fu_184_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln24_1_reg_473 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal thresh_fu_197_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal thresh_reg_491 : STD_LOGIC_VECTOR (31 downto 0);
    signal absL_fu_223_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal absL_reg_501 : STD_LOGIC_VECTOR (31 downto 0);
    signal absR_fu_248_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal absR_reg_507 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln24_fu_275_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln24_reg_513 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln31_fu_303_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln31_reg_519 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln24_1_fu_313_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal and_ln31_1_fu_323_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal trunc_ln368_4_fu_343_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal trunc_ln368_4_reg_542 : STD_LOGIC_VECTOR (30 downto 0);
    signal ratio_fu_354_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal grp_fu_103_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_22_reg_553 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal grp_fu_107_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_26_reg_558 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_111_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_34_reg_563 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_115_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_39_reg_568 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_44_fu_145_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_45_fu_334_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_95_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_95_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal grp_fu_99_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_99_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_111_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_111_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state21 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state21 : signal is "none";
    signal grp_fu_115_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_115_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln17_fu_139_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_31_fu_162_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln31_fu_158_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal icmp_ln24_3_fu_178_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln24_2_fu_172_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_s_fu_190_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Val2_13_fu_203_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln368_5_fu_207_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal p_Result_10_fu_215_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Val2_14_fu_228_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln368_6_fu_232_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal p_Result_11_fu_240_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_30_fu_253_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln24_fu_211_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal icmp_ln24_1_fu_269_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln24_fu_263_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_35_fu_281_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln31_1_fu_236_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal icmp_ln31_1_fu_297_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln31_fu_291_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln24_fu_309_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln31_fu_319_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln18_fu_329_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal p_Result_9_fu_347_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state23 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state23 : signal is "none";
    signal bitcast_ln28_fu_364_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln28_fu_368_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal and_ln28_fu_360_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln24_fu_378_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln28_1_fu_383_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bitcast_ln28_1_fu_374_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln28_fu_389_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln35_fu_407_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln35_fu_411_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal and_ln35_fu_403_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln31_fu_421_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln35_1_fu_426_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bitcast_ln35_1_fu_417_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln35_fu_432_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_l_fu_397_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal dst_r_fu_440_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_95_opcode : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_fu_99_opcode : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (22 downto 0);

    component pynq_dsp_hls_faddfYi IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        opcode : IN STD_LOGIC_VECTOR (1 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component pynq_dsp_hls_fmulcud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component pynq_dsp_hls_fcmpeOg IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        opcode : IN STD_LOGIC_VECTOR (4 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    pynq_dsp_hls_faddfYi_U30 : component pynq_dsp_hls_faddfYi
    generic map (
        ID => 1,
        NUM_STAGE => 7,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_95_p0,
        din1 => grp_fu_95_p1,
        opcode => grp_fu_95_opcode,
        ce => ap_const_logic_1,
        dout => grp_fu_95_p2);

    pynq_dsp_hls_faddfYi_U31 : component pynq_dsp_hls_faddfYi
    generic map (
        ID => 1,
        NUM_STAGE => 7,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_99_p0,
        din1 => grp_fu_99_p1,
        opcode => grp_fu_99_opcode,
        ce => ap_const_logic_1,
        dout => grp_fu_99_p2);

    pynq_dsp_hls_fmulcud_U32 : component pynq_dsp_hls_fmulcud
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => reg_121,
        din1 => ratio_fu_354_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_103_p2);

    pynq_dsp_hls_fmulcud_U33 : component pynq_dsp_hls_fmulcud
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => reg_126,
        din1 => ratio_fu_354_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_107_p2);

    pynq_dsp_hls_fcmpeOg_U34 : component pynq_dsp_hls_fcmpeOg
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_111_p0,
        din1 => grp_fu_111_p1,
        ce => ap_const_logic_1,
        opcode => ap_const_lv5_4,
        dout => grp_fu_111_p2);

    pynq_dsp_hls_fcmpeOg_U35 : component pynq_dsp_hls_fcmpeOg
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_115_p0,
        din1 => grp_fu_115_p1,
        ce => ap_const_logic_1,
        opcode => ap_const_lv5_4,
        dout => grp_fu_115_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                    absL_reg_501(30 downto 0) <= absL_fu_223_p1(30 downto 0);
                    absR_reg_507(30 downto 0) <= absR_fu_248_p1(30 downto 0);
                or_ln24_reg_513 <= or_ln24_fu_275_p2;
                or_ln31_reg_519 <= or_ln31_fu_303_p2;
                    thresh_reg_491(30 downto 0) <= thresh_fu_197_p1(30 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                and_ln24_1_reg_525 <= and_ln24_1_fu_313_p2;
                and_ln31_1_reg_531 <= and_ln31_1_fu_323_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                or_ln24_1_reg_473 <= or_ln24_1_fu_184_p2;
                trunc_ln368_reg_468 <= trunc_ln368_fu_154_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_lv1_0 = and_ln24_1_reg_525) and (ap_const_logic_1 = ap_CS_fsm_state22)) or ((ap_const_lv1_0 = and_ln24_1_reg_525) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then
                reg_121 <= grp_fu_95_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_lv1_0 = and_ln31_1_reg_531) and (ap_const_logic_1 = ap_CS_fsm_state22)) or ((ap_const_lv1_0 = and_ln31_1_reg_531) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then
                reg_126 <= grp_fu_99_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_0 = and_ln24_1_reg_525) and (ap_const_logic_1 = ap_CS_fsm_state15))) then
                tmp_22_reg_553 <= grp_fu_103_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_0 = and_ln31_1_reg_531) and (ap_const_logic_1 = ap_CS_fsm_state15))) then
                tmp_26_reg_558 <= grp_fu_107_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_0 = and_ln24_1_reg_525) and (ap_const_logic_1 = ap_CS_fsm_state22))) then
                tmp_34_reg_563 <= grp_fu_111_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_0 = and_ln31_1_reg_531) and (ap_const_logic_1 = ap_CS_fsm_state22))) then
                tmp_39_reg_568 <= grp_fu_115_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    tmp_43_reg_458(8 downto 4) <= tmp_43_fu_131_p3(8 downto 4);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state11)) then
                trunc_ln368_4_reg_542 <= trunc_ln368_4_fu_343_p1;
            end if;
        end if;
    end process;
    tmp_43_reg_458(3 downto 0) <= "0000";
    thresh_reg_491(31) <= '0';
    absL_reg_501(31) <= '0';
    absR_reg_507(31) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                ap_NS_fsm <= ap_ST_fsm_state20;
            when ap_ST_fsm_state20 => 
                ap_NS_fsm <= ap_ST_fsm_state21;
            when ap_ST_fsm_state21 => 
                ap_NS_fsm <= ap_ST_fsm_state22;
            when ap_ST_fsm_state22 => 
                ap_NS_fsm <= ap_ST_fsm_state23;
            when ap_ST_fsm_state23 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    absL_fu_223_p1 <= p_Result_10_fu_215_p3;
    absR_fu_248_p1 <= p_Result_11_fu_240_p3;
    and_ln24_1_fu_313_p2 <= (grp_fu_111_p2 and and_ln24_fu_309_p2);
    and_ln24_fu_309_p2 <= (or_ln24_reg_513 and or_ln24_1_reg_473);
    and_ln28_1_fu_383_p2 <= (xor_ln24_fu_378_p2 and and_ln28_fu_360_p2);
    and_ln28_fu_360_p2 <= (tmp_34_reg_563 and or_ln24_reg_513);
    and_ln31_1_fu_323_p2 <= (grp_fu_115_p2 and and_ln31_fu_319_p2);
    and_ln31_fu_319_p2 <= (or_ln31_reg_519 and or_ln24_1_reg_473);
    and_ln35_1_fu_426_p2 <= (xor_ln31_fu_421_p2 and and_ln35_fu_403_p2);
    and_ln35_fu_403_p2 <= (tmp_39_reg_568 and or_ln31_reg_519);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state21 <= ap_CS_fsm(20);
    ap_CS_fsm_state22 <= ap_CS_fsm(21);
    ap_CS_fsm_state23 <= ap_CS_fsm(22);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state23)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state23) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state23)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state23)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return_0 <= dst_l_fu_397_p3;
    ap_return_1 <= dst_r_fu_440_p3;
    bitcast_ln28_1_fu_374_p1 <= xor_ln28_fu_368_p2;
    bitcast_ln28_fu_364_p1 <= reg_121;
    bitcast_ln35_1_fu_417_p1 <= xor_ln35_fu_411_p2;
    bitcast_ln35_fu_407_p1 <= reg_126;

    config_r_address0_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state10, tmp_44_fu_145_p3, tmp_45_fu_334_p3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            config_r_address0 <= tmp_45_fu_334_p3(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            config_r_address0 <= tmp_44_fu_145_p3(8 - 1 downto 0);
        else 
            config_r_address0 <= "XXXXXXXX";
        end if; 
    end process;


    config_r_ce0_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state10)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            config_r_ce0 <= ap_const_logic_1;
        else 
            config_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dst_l_fu_397_p3 <= 
        inData_l when (and_ln24_1_reg_525(0) = '1') else 
        select_ln28_fu_389_p3;
    dst_r_fu_440_p3 <= 
        inData_r when (and_ln31_1_reg_531(0) = '1') else 
        select_ln35_fu_432_p3;

    grp_fu_111_p0_assign_proc : process(inData_l, ap_CS_fsm_state3, absL_fu_223_p1, ap_CS_fsm_state21)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state21)) then 
            grp_fu_111_p0 <= inData_l;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_111_p0 <= absL_fu_223_p1;
        else 
            grp_fu_111_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_111_p1_assign_proc : process(ap_CS_fsm_state3, thresh_fu_197_p1, ap_CS_fsm_state21)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state21)) then 
            grp_fu_111_p1 <= ap_const_lv32_0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_111_p1 <= thresh_fu_197_p1;
        else 
            grp_fu_111_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_115_p0_assign_proc : process(inData_r, ap_CS_fsm_state3, absR_fu_248_p1, ap_CS_fsm_state21)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state21)) then 
            grp_fu_115_p0 <= inData_r;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_115_p0 <= absR_fu_248_p1;
        else 
            grp_fu_115_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_115_p1_assign_proc : process(ap_CS_fsm_state3, thresh_fu_197_p1, ap_CS_fsm_state21)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state21)) then 
            grp_fu_115_p1 <= ap_const_lv32_0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_115_p1 <= thresh_fu_197_p1;
        else 
            grp_fu_115_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_95_opcode_assign_proc : process(and_ln24_1_reg_525, ap_CS_fsm_state5, ap_CS_fsm_state16)
    begin
        if ((ap_const_lv1_0 = and_ln24_1_reg_525)) then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                grp_fu_95_opcode <= ap_const_lv2_1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                grp_fu_95_opcode <= ap_const_lv2_0;
            else 
                grp_fu_95_opcode <= "XX";
            end if;
        else 
            grp_fu_95_opcode <= "XX";
        end if; 
    end process;


    grp_fu_95_p0_assign_proc : process(thresh_reg_491, absL_reg_501, ap_CS_fsm_state5, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_95_p0 <= thresh_reg_491;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_95_p0 <= absL_reg_501;
        else 
            grp_fu_95_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_95_p1_assign_proc : process(thresh_reg_491, tmp_22_reg_553, ap_CS_fsm_state5, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_95_p1 <= tmp_22_reg_553;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_95_p1 <= thresh_reg_491;
        else 
            grp_fu_95_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_99_opcode_assign_proc : process(and_ln31_1_reg_531, ap_CS_fsm_state5, ap_CS_fsm_state16)
    begin
        if ((ap_const_lv1_0 = and_ln31_1_reg_531)) then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                grp_fu_99_opcode <= ap_const_lv2_1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                grp_fu_99_opcode <= ap_const_lv2_0;
            else 
                grp_fu_99_opcode <= "XX";
            end if;
        else 
            grp_fu_99_opcode <= "XX";
        end if; 
    end process;


    grp_fu_99_p0_assign_proc : process(thresh_reg_491, absR_reg_507, ap_CS_fsm_state5, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_99_p0 <= thresh_reg_491;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_99_p0 <= absR_reg_507;
        else 
            grp_fu_99_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_99_p1_assign_proc : process(thresh_reg_491, tmp_26_reg_558, ap_CS_fsm_state5, ap_CS_fsm_state16)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
            grp_fu_99_p1 <= tmp_26_reg_558;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_99_p1 <= thresh_reg_491;
        else 
            grp_fu_99_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    icmp_ln24_1_fu_269_p2 <= "1" when (trunc_ln24_fu_211_p1 = ap_const_lv23_0) else "0";
    icmp_ln24_2_fu_172_p2 <= "0" when (tmp_31_fu_162_p4 = ap_const_lv8_FF) else "1";
    icmp_ln24_3_fu_178_p2 <= "1" when (trunc_ln31_fu_158_p1 = ap_const_lv23_0) else "0";
    icmp_ln24_fu_263_p2 <= "0" when (tmp_30_fu_253_p4 = ap_const_lv8_FF) else "1";
    icmp_ln31_1_fu_297_p2 <= "1" when (trunc_ln31_1_fu_236_p1 = ap_const_lv23_0) else "0";
    icmp_ln31_fu_291_p2 <= "0" when (tmp_35_fu_281_p4 = ap_const_lv8_FF) else "1";
    or_ln17_fu_139_p2 <= (tmp_43_fu_131_p3 or ap_const_lv9_1);
    or_ln18_fu_329_p2 <= (tmp_43_reg_458 or ap_const_lv9_2);
    or_ln24_1_fu_184_p2 <= (icmp_ln24_3_fu_178_p2 or icmp_ln24_2_fu_172_p2);
    or_ln24_fu_275_p2 <= (icmp_ln24_fu_263_p2 or icmp_ln24_1_fu_269_p2);
    or_ln31_fu_303_p2 <= (icmp_ln31_fu_291_p2 or icmp_ln31_1_fu_297_p2);
    p_Result_10_fu_215_p3 <= (ap_const_lv1_0 & trunc_ln368_5_fu_207_p1);
    p_Result_11_fu_240_p3 <= (ap_const_lv1_0 & trunc_ln368_6_fu_232_p1);
    p_Result_9_fu_347_p3 <= (ap_const_lv1_0 & trunc_ln368_4_reg_542);
    p_Result_s_fu_190_p3 <= (ap_const_lv1_0 & trunc_ln368_reg_468);
    p_Val2_13_fu_203_p1 <= inData_l;
    p_Val2_14_fu_228_p1 <= inData_r;
    ratio_fu_354_p1 <= p_Result_9_fu_347_p3;
    select_ln28_fu_389_p3 <= 
        bitcast_ln28_1_fu_374_p1 when (and_ln28_1_fu_383_p2(0) = '1') else 
        reg_121;
    select_ln35_fu_432_p3 <= 
        bitcast_ln35_1_fu_417_p1 when (and_ln35_1_fu_426_p2(0) = '1') else 
        reg_126;
    thresh_fu_197_p1 <= p_Result_s_fu_190_p3;
    tmp_30_fu_253_p4 <= p_Val2_13_fu_203_p1(30 downto 23);
    tmp_31_fu_162_p4 <= config_r_q0(30 downto 23);
    tmp_35_fu_281_p4 <= p_Val2_14_fu_228_p1(30 downto 23);
    tmp_43_fu_131_p3 <= (config_offset & ap_const_lv4_0);
    tmp_44_fu_145_p3 <= (ap_const_lv55_0 & or_ln17_fu_139_p2);
    tmp_45_fu_334_p3 <= (ap_const_lv55_0 & or_ln18_fu_329_p2);
    trunc_ln24_fu_211_p1 <= p_Val2_13_fu_203_p1(23 - 1 downto 0);
    trunc_ln31_1_fu_236_p1 <= p_Val2_14_fu_228_p1(23 - 1 downto 0);
    trunc_ln31_fu_158_p1 <= config_r_q0(23 - 1 downto 0);
    trunc_ln368_4_fu_343_p1 <= config_r_q0(31 - 1 downto 0);
    trunc_ln368_5_fu_207_p1 <= p_Val2_13_fu_203_p1(31 - 1 downto 0);
    trunc_ln368_6_fu_232_p1 <= p_Val2_14_fu_228_p1(31 - 1 downto 0);
    trunc_ln368_fu_154_p1 <= config_r_q0(31 - 1 downto 0);
    xor_ln24_fu_378_p2 <= (ap_const_lv1_1 xor and_ln24_1_reg_525);
    xor_ln28_fu_368_p2 <= (bitcast_ln28_fu_364_p1 xor ap_const_lv32_80000000);
    xor_ln31_fu_421_p2 <= (ap_const_lv1_1 xor and_ln31_1_reg_531);
    xor_ln35_fu_411_p2 <= (bitcast_ln35_fu_407_p1 xor ap_const_lv32_80000000);
end behav;