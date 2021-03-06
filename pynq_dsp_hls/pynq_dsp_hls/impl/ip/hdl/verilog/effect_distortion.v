// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1.3
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module effect_distortion (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        inData_l,
        inData_r,
        config_r_address0,
        config_r_ce0,
        config_r_q0,
        config_offset,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] inData_l;
input  [31:0] inData_r;
output  [7:0] config_r_address0;
output   config_r_ce0;
input  [31:0] config_r_q0;
input  [4:0] config_offset;
output  [31:0] ap_return_0;
output  [31:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg config_r_ce0;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [30:0] trunc_ln368_fu_126_p1;
reg   [30:0] trunc_ln368_reg_378;
wire    ap_CS_fsm_state2;
wire   [0:0] or_ln257_1_fu_156_p2;
reg   [0:0] or_ln257_1_reg_383;
wire    ap_CS_fsm_state3;
wire   [31:0] thresh_fu_169_p1;
reg   [31:0] thresh_reg_399;
wire   [31:0] absL_fu_195_p1;
reg   [31:0] absL_reg_407;
wire   [31:0] absR_fu_220_p1;
reg   [31:0] absR_reg_413;
wire   [0:0] or_ln257_fu_247_p2;
reg   [0:0] or_ln257_reg_419;
wire   [0:0] or_ln257_2_fu_275_p2;
reg   [0:0] or_ln257_2_reg_425;
wire   [31:0] monitorDstL_fu_291_p3;
reg   [31:0] monitorDstL_reg_431;
wire    ap_CS_fsm_state4;
wire   [31:0] monitorDstR_fu_307_p3;
reg   [31:0] monitorDstR_reg_437;
wire   [0:0] grp_fu_91_p2;
reg   [0:0] tmp_14_reg_443;
wire   [0:0] grp_fu_97_p2;
reg   [0:0] tmp_16_reg_448;
wire   [63:0] tmp_30_fu_117_p3;
wire   [31:0] grp_fu_83_p0;
wire   [31:0] grp_fu_87_p0;
wire   [8:0] tmp_29_fu_103_p3;
wire   [8:0] or_ln4_fu_111_p2;
wire   [7:0] tmp_8_fu_134_p4;
wire   [22:0] trunc_ln257_fu_130_p1;
wire   [0:0] icmp_ln257_3_fu_150_p2;
wire   [0:0] icmp_ln257_2_fu_144_p2;
wire   [31:0] p_Result_s_fu_162_p3;
wire   [31:0] p_Val2_4_fu_175_p1;
wire   [30:0] trunc_ln368_1_fu_179_p1;
wire   [31:0] p_Result_6_fu_187_p3;
wire   [31:0] p_Val2_5_fu_200_p1;
wire   [30:0] trunc_ln368_2_fu_204_p1;
wire   [31:0] p_Result_7_fu_212_p3;
wire   [7:0] tmp_7_fu_225_p4;
wire   [22:0] trunc_ln257_1_fu_183_p1;
wire   [0:0] icmp_ln257_1_fu_241_p2;
wire   [0:0] icmp_ln257_fu_235_p2;
wire   [7:0] tmp_10_fu_253_p4;
wire   [22:0] trunc_ln257_2_fu_208_p1;
wire   [0:0] icmp_ln257_5_fu_269_p2;
wire   [0:0] icmp_ln257_4_fu_263_p2;
wire   [0:0] and_ln257_fu_281_p2;
wire   [0:0] grp_fu_83_p2;
wire   [0:0] and_ln257_1_fu_285_p2;
wire   [0:0] and_ln257_2_fu_297_p2;
wire   [0:0] grp_fu_87_p2;
wire   [0:0] and_ln257_3_fu_301_p2;
wire    ap_CS_fsm_state5;
wire   [31:0] bitcast_ln11_fu_317_p1;
wire   [31:0] xor_ln11_fu_320_p2;
wire   [0:0] and_ln11_fu_313_p2;
wire   [31:0] bitcast_ln11_1_fu_326_p1;
wire   [31:0] bitcast_ln12_fu_341_p1;
wire   [31:0] xor_ln12_fu_344_p2;
wire   [0:0] and_ln12_fu_337_p2;
wire   [31:0] bitcast_ln12_1_fu_350_p1;
wire   [31:0] dst_l_fu_330_p3;
wire   [31:0] dst_r_fu_354_p3;
reg   [4:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
end

pynq_dsp_hls_fcmpeOg #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
pynq_dsp_hls_fcmpeOg_U41(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_83_p0),
    .din1(thresh_fu_169_p1),
    .ce(1'b1),
    .opcode(5'd4),
    .dout(grp_fu_83_p2)
);

pynq_dsp_hls_fcmpeOg #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
pynq_dsp_hls_fcmpeOg_U42(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_87_p0),
    .din1(thresh_fu_169_p1),
    .ce(1'b1),
    .opcode(5'd4),
    .dout(grp_fu_87_p2)
);

pynq_dsp_hls_fcmpeOg #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
pynq_dsp_hls_fcmpeOg_U43(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(inData_l),
    .din1(32'd0),
    .ce(1'b1),
    .opcode(5'd4),
    .dout(grp_fu_91_p2)
);

pynq_dsp_hls_fcmpeOg #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
pynq_dsp_hls_fcmpeOg_U44(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(inData_r),
    .din1(32'd0),
    .ce(1'b1),
    .opcode(5'd4),
    .dout(grp_fu_97_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        absL_reg_407[30 : 0] <= absL_fu_195_p1[30 : 0];
        absR_reg_413[30 : 0] <= absR_fu_220_p1[30 : 0];
        or_ln257_2_reg_425 <= or_ln257_2_fu_275_p2;
        or_ln257_reg_419 <= or_ln257_fu_247_p2;
        thresh_reg_399[30 : 0] <= thresh_fu_169_p1[30 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        monitorDstL_reg_431[30 : 0] <= monitorDstL_fu_291_p3[30 : 0];
        monitorDstR_reg_437[30 : 0] <= monitorDstR_fu_307_p3[30 : 0];
        tmp_14_reg_443 <= grp_fu_91_p2;
        tmp_16_reg_448 <= grp_fu_97_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        or_ln257_1_reg_383 <= or_ln257_1_fu_156_p2;
        trunc_ln368_reg_378 <= trunc_ln368_fu_126_p1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        config_r_ce0 = 1'b1;
    end else begin
        config_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign absL_fu_195_p1 = p_Result_6_fu_187_p3;

assign absR_fu_220_p1 = p_Result_7_fu_212_p3;

assign and_ln11_fu_313_p2 = (tmp_14_reg_443 & or_ln257_reg_419);

assign and_ln12_fu_337_p2 = (tmp_16_reg_448 & or_ln257_2_reg_425);

assign and_ln257_1_fu_285_p2 = (grp_fu_83_p2 & and_ln257_fu_281_p2);

assign and_ln257_2_fu_297_p2 = (or_ln257_2_reg_425 & or_ln257_1_reg_383);

assign and_ln257_3_fu_301_p2 = (grp_fu_87_p2 & and_ln257_2_fu_297_p2);

assign and_ln257_fu_281_p2 = (or_ln257_reg_419 & or_ln257_1_reg_383);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_return_0 = dst_l_fu_330_p3;

assign ap_return_1 = dst_r_fu_354_p3;

assign bitcast_ln11_1_fu_326_p1 = xor_ln11_fu_320_p2;

assign bitcast_ln11_fu_317_p1 = monitorDstL_reg_431;

assign bitcast_ln12_1_fu_350_p1 = xor_ln12_fu_344_p2;

assign bitcast_ln12_fu_341_p1 = monitorDstR_reg_437;

assign config_r_address0 = tmp_30_fu_117_p3;

assign dst_l_fu_330_p3 = ((and_ln11_fu_313_p2[0:0] === 1'b1) ? bitcast_ln11_1_fu_326_p1 : monitorDstL_reg_431);

assign dst_r_fu_354_p3 = ((and_ln12_fu_337_p2[0:0] === 1'b1) ? bitcast_ln12_1_fu_350_p1 : monitorDstR_reg_437);

assign grp_fu_83_p0 = p_Result_6_fu_187_p3;

assign grp_fu_87_p0 = p_Result_7_fu_212_p3;

assign icmp_ln257_1_fu_241_p2 = ((trunc_ln257_1_fu_183_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln257_2_fu_144_p2 = ((tmp_8_fu_134_p4 != 8'd255) ? 1'b1 : 1'b0);

assign icmp_ln257_3_fu_150_p2 = ((trunc_ln257_fu_130_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln257_4_fu_263_p2 = ((tmp_10_fu_253_p4 != 8'd255) ? 1'b1 : 1'b0);

assign icmp_ln257_5_fu_269_p2 = ((trunc_ln257_2_fu_208_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln257_fu_235_p2 = ((tmp_7_fu_225_p4 != 8'd255) ? 1'b1 : 1'b0);

assign monitorDstL_fu_291_p3 = ((and_ln257_1_fu_285_p2[0:0] === 1'b1) ? absL_reg_407 : thresh_reg_399);

assign monitorDstR_fu_307_p3 = ((and_ln257_3_fu_301_p2[0:0] === 1'b1) ? absR_reg_413 : thresh_reg_399);

assign or_ln257_1_fu_156_p2 = (icmp_ln257_3_fu_150_p2 | icmp_ln257_2_fu_144_p2);

assign or_ln257_2_fu_275_p2 = (icmp_ln257_5_fu_269_p2 | icmp_ln257_4_fu_263_p2);

assign or_ln257_fu_247_p2 = (icmp_ln257_fu_235_p2 | icmp_ln257_1_fu_241_p2);

assign or_ln4_fu_111_p2 = (tmp_29_fu_103_p3 | 9'd1);

assign p_Result_6_fu_187_p3 = {{1'd0}, {trunc_ln368_1_fu_179_p1}};

assign p_Result_7_fu_212_p3 = {{1'd0}, {trunc_ln368_2_fu_204_p1}};

assign p_Result_s_fu_162_p3 = {{1'd0}, {trunc_ln368_reg_378}};

assign p_Val2_4_fu_175_p1 = inData_l;

assign p_Val2_5_fu_200_p1 = inData_r;

assign thresh_fu_169_p1 = p_Result_s_fu_162_p3;

assign tmp_10_fu_253_p4 = {{p_Val2_5_fu_200_p1[30:23]}};

assign tmp_29_fu_103_p3 = {{config_offset}, {4'd0}};

assign tmp_30_fu_117_p3 = {{55'd0}, {or_ln4_fu_111_p2}};

assign tmp_7_fu_225_p4 = {{p_Val2_4_fu_175_p1[30:23]}};

assign tmp_8_fu_134_p4 = {{config_r_q0[30:23]}};

assign trunc_ln257_1_fu_183_p1 = p_Val2_4_fu_175_p1[22:0];

assign trunc_ln257_2_fu_208_p1 = p_Val2_5_fu_200_p1[22:0];

assign trunc_ln257_fu_130_p1 = config_r_q0[22:0];

assign trunc_ln368_1_fu_179_p1 = p_Val2_4_fu_175_p1[30:0];

assign trunc_ln368_2_fu_204_p1 = p_Val2_5_fu_200_p1[30:0];

assign trunc_ln368_fu_126_p1 = config_r_q0[30:0];

assign xor_ln11_fu_320_p2 = (bitcast_ln11_fu_317_p1 ^ 32'd2147483648);

assign xor_ln12_fu_344_p2 = (bitcast_ln12_fu_341_p1 ^ 32'd2147483648);

always @ (posedge ap_clk) begin
    thresh_reg_399[31] <= 1'b0;
    absL_reg_407[31] <= 1'b0;
    absR_reg_413[31] <= 1'b0;
    monitorDstL_reg_431[31] <= 1'b0;
    monitorDstR_reg_437[31] <= 1'b0;
end

endmodule //effect_distortion
