// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1.3
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="bypass,hls_ip_2019_1_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.000000,HLS_SYN_LAT=17,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=797,HLS_SYN_LUT=974,HLS_VERSION=2019_1_3}" *)

module bypass (
        ap_clk,
        ap_rst_n,
        m_axi_physMemPtr_V_AWVALID,
        m_axi_physMemPtr_V_AWREADY,
        m_axi_physMemPtr_V_AWADDR,
        m_axi_physMemPtr_V_AWID,
        m_axi_physMemPtr_V_AWLEN,
        m_axi_physMemPtr_V_AWSIZE,
        m_axi_physMemPtr_V_AWBURST,
        m_axi_physMemPtr_V_AWLOCK,
        m_axi_physMemPtr_V_AWCACHE,
        m_axi_physMemPtr_V_AWPROT,
        m_axi_physMemPtr_V_AWQOS,
        m_axi_physMemPtr_V_AWREGION,
        m_axi_physMemPtr_V_AWUSER,
        m_axi_physMemPtr_V_WVALID,
        m_axi_physMemPtr_V_WREADY,
        m_axi_physMemPtr_V_WDATA,
        m_axi_physMemPtr_V_WSTRB,
        m_axi_physMemPtr_V_WLAST,
        m_axi_physMemPtr_V_WID,
        m_axi_physMemPtr_V_WUSER,
        m_axi_physMemPtr_V_ARVALID,
        m_axi_physMemPtr_V_ARREADY,
        m_axi_physMemPtr_V_ARADDR,
        m_axi_physMemPtr_V_ARID,
        m_axi_physMemPtr_V_ARLEN,
        m_axi_physMemPtr_V_ARSIZE,
        m_axi_physMemPtr_V_ARBURST,
        m_axi_physMemPtr_V_ARLOCK,
        m_axi_physMemPtr_V_ARCACHE,
        m_axi_physMemPtr_V_ARPROT,
        m_axi_physMemPtr_V_ARQOS,
        m_axi_physMemPtr_V_ARREGION,
        m_axi_physMemPtr_V_ARUSER,
        m_axi_physMemPtr_V_RVALID,
        m_axi_physMemPtr_V_RREADY,
        m_axi_physMemPtr_V_RDATA,
        m_axi_physMemPtr_V_RLAST,
        m_axi_physMemPtr_V_RID,
        m_axi_physMemPtr_V_RUSER,
        m_axi_physMemPtr_V_RRESP,
        m_axi_physMemPtr_V_BVALID,
        m_axi_physMemPtr_V_BREADY,
        m_axi_physMemPtr_V_BRESP,
        m_axi_physMemPtr_V_BID,
        m_axi_physMemPtr_V_BUSER,
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 24'd1;
parameter    ap_ST_fsm_state2 = 24'd2;
parameter    ap_ST_fsm_state3 = 24'd4;
parameter    ap_ST_fsm_state4 = 24'd8;
parameter    ap_ST_fsm_state5 = 24'd16;
parameter    ap_ST_fsm_state6 = 24'd32;
parameter    ap_ST_fsm_state7 = 24'd64;
parameter    ap_ST_fsm_state8 = 24'd128;
parameter    ap_ST_fsm_state9 = 24'd256;
parameter    ap_ST_fsm_state10 = 24'd512;
parameter    ap_ST_fsm_state11 = 24'd1024;
parameter    ap_ST_fsm_state12 = 24'd2048;
parameter    ap_ST_fsm_state13 = 24'd4096;
parameter    ap_ST_fsm_state14 = 24'd8192;
parameter    ap_ST_fsm_state15 = 24'd16384;
parameter    ap_ST_fsm_state16 = 24'd32768;
parameter    ap_ST_fsm_state17 = 24'd65536;
parameter    ap_ST_fsm_state18 = 24'd131072;
parameter    ap_ST_fsm_state19 = 24'd262144;
parameter    ap_ST_fsm_state20 = 24'd524288;
parameter    ap_ST_fsm_state21 = 24'd1048576;
parameter    ap_ST_fsm_state22 = 24'd2097152;
parameter    ap_ST_fsm_state23 = 24'd4194304;
parameter    ap_ST_fsm_state24 = 24'd8388608;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_PHYSMEMPTR_V_ID_WIDTH = 1;
parameter    C_M_AXI_PHYSMEMPTR_V_ADDR_WIDTH = 32;
parameter    C_M_AXI_PHYSMEMPTR_V_DATA_WIDTH = 32;
parameter    C_M_AXI_PHYSMEMPTR_V_AWUSER_WIDTH = 1;
parameter    C_M_AXI_PHYSMEMPTR_V_ARUSER_WIDTH = 1;
parameter    C_M_AXI_PHYSMEMPTR_V_WUSER_WIDTH = 1;
parameter    C_M_AXI_PHYSMEMPTR_V_RUSER_WIDTH = 1;
parameter    C_M_AXI_PHYSMEMPTR_V_BUSER_WIDTH = 1;
parameter    C_M_AXI_PHYSMEMPTR_V_TARGET_ADDR = 0;
parameter    C_M_AXI_PHYSMEMPTR_V_USER_VALUE = 0;
parameter    C_M_AXI_PHYSMEMPTR_V_PROT_VALUE = 0;
parameter    C_M_AXI_PHYSMEMPTR_V_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_AXILITES_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_PHYSMEMPTR_V_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output   m_axi_physMemPtr_V_AWVALID;
input   m_axi_physMemPtr_V_AWREADY;
output  [C_M_AXI_PHYSMEMPTR_V_ADDR_WIDTH - 1:0] m_axi_physMemPtr_V_AWADDR;
output  [C_M_AXI_PHYSMEMPTR_V_ID_WIDTH - 1:0] m_axi_physMemPtr_V_AWID;
output  [7:0] m_axi_physMemPtr_V_AWLEN;
output  [2:0] m_axi_physMemPtr_V_AWSIZE;
output  [1:0] m_axi_physMemPtr_V_AWBURST;
output  [1:0] m_axi_physMemPtr_V_AWLOCK;
output  [3:0] m_axi_physMemPtr_V_AWCACHE;
output  [2:0] m_axi_physMemPtr_V_AWPROT;
output  [3:0] m_axi_physMemPtr_V_AWQOS;
output  [3:0] m_axi_physMemPtr_V_AWREGION;
output  [C_M_AXI_PHYSMEMPTR_V_AWUSER_WIDTH - 1:0] m_axi_physMemPtr_V_AWUSER;
output   m_axi_physMemPtr_V_WVALID;
input   m_axi_physMemPtr_V_WREADY;
output  [C_M_AXI_PHYSMEMPTR_V_DATA_WIDTH - 1:0] m_axi_physMemPtr_V_WDATA;
output  [C_M_AXI_PHYSMEMPTR_V_WSTRB_WIDTH - 1:0] m_axi_physMemPtr_V_WSTRB;
output   m_axi_physMemPtr_V_WLAST;
output  [C_M_AXI_PHYSMEMPTR_V_ID_WIDTH - 1:0] m_axi_physMemPtr_V_WID;
output  [C_M_AXI_PHYSMEMPTR_V_WUSER_WIDTH - 1:0] m_axi_physMemPtr_V_WUSER;
output   m_axi_physMemPtr_V_ARVALID;
input   m_axi_physMemPtr_V_ARREADY;
output  [C_M_AXI_PHYSMEMPTR_V_ADDR_WIDTH - 1:0] m_axi_physMemPtr_V_ARADDR;
output  [C_M_AXI_PHYSMEMPTR_V_ID_WIDTH - 1:0] m_axi_physMemPtr_V_ARID;
output  [7:0] m_axi_physMemPtr_V_ARLEN;
output  [2:0] m_axi_physMemPtr_V_ARSIZE;
output  [1:0] m_axi_physMemPtr_V_ARBURST;
output  [1:0] m_axi_physMemPtr_V_ARLOCK;
output  [3:0] m_axi_physMemPtr_V_ARCACHE;
output  [2:0] m_axi_physMemPtr_V_ARPROT;
output  [3:0] m_axi_physMemPtr_V_ARQOS;
output  [3:0] m_axi_physMemPtr_V_ARREGION;
output  [C_M_AXI_PHYSMEMPTR_V_ARUSER_WIDTH - 1:0] m_axi_physMemPtr_V_ARUSER;
input   m_axi_physMemPtr_V_RVALID;
output   m_axi_physMemPtr_V_RREADY;
input  [C_M_AXI_PHYSMEMPTR_V_DATA_WIDTH - 1:0] m_axi_physMemPtr_V_RDATA;
input   m_axi_physMemPtr_V_RLAST;
input  [C_M_AXI_PHYSMEMPTR_V_ID_WIDTH - 1:0] m_axi_physMemPtr_V_RID;
input  [C_M_AXI_PHYSMEMPTR_V_RUSER_WIDTH - 1:0] m_axi_physMemPtr_V_RUSER;
input  [1:0] m_axi_physMemPtr_V_RRESP;
input   m_axi_physMemPtr_V_BVALID;
output   m_axi_physMemPtr_V_BREADY;
input  [1:0] m_axi_physMemPtr_V_BRESP;
input  [C_M_AXI_PHYSMEMPTR_V_ID_WIDTH - 1:0] m_axi_physMemPtr_V_BID;
input  [C_M_AXI_PHYSMEMPTR_V_BUSER_WIDTH - 1:0] m_axi_physMemPtr_V_BUSER;
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1:0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;
output   interrupt;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [23:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [31:0] basePhysAddr_V;
reg    physMemPtr_V_blk_n_AR;
wire    ap_CS_fsm_state2;
reg    physMemPtr_V_blk_n_R;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire   [0:0] icmp_ln23_fu_142_p2;
wire    ap_CS_fsm_state17;
wire    ap_CS_fsm_state18;
reg    physMemPtr_V_blk_n_AW;
reg    physMemPtr_V_blk_n_W;
wire    ap_CS_fsm_state19;
reg    physMemPtr_V_blk_n_B;
wire    ap_CS_fsm_state24;
reg   [0:0] icmp_ln23_reg_198;
reg    physMemPtr_V_AWVALID;
wire    physMemPtr_V_AWREADY;
wire   [31:0] physMemPtr_V_AWADDR;
reg    physMemPtr_V_WVALID;
wire    physMemPtr_V_WREADY;
reg    physMemPtr_V_ARVALID;
wire    physMemPtr_V_ARREADY;
reg   [31:0] physMemPtr_V_ARADDR;
reg   [31:0] physMemPtr_V_ARLEN;
wire    physMemPtr_V_RVALID;
reg    physMemPtr_V_RREADY;
wire   [31:0] physMemPtr_V_RDATA;
wire    physMemPtr_V_RLAST;
wire   [0:0] physMemPtr_V_RID;
wire   [0:0] physMemPtr_V_RUSER;
wire   [1:0] physMemPtr_V_RRESP;
wire    physMemPtr_V_BVALID;
reg    physMemPtr_V_BREADY;
wire   [1:0] physMemPtr_V_BRESP;
wire   [0:0] physMemPtr_V_BID;
wire   [0:0] physMemPtr_V_BUSER;
reg   [31:0] reg_106;
wire   [29:0] r_V_fu_112_p4;
reg   [29:0] r_V_reg_172;
wire   [30:0] zext_ln215_fu_122_p1;
reg   [30:0] zext_ln215_reg_177;
wire   [30:0] ret_V_fu_126_p2;
reg   [30:0] ret_V_reg_182;
reg   [31:0] status_V_reg_193;
reg    ap_block_state10_io;
wire   [30:0] ret_V_1_fu_157_p2;
reg   [30:0] ret_V_1_reg_208;
wire    ap_CS_fsm_state16;
wire   [63:0] zext_ln544_fu_132_p1;
wire   [63:0] zext_ln544_1_fu_147_p1;
wire   [63:0] zext_ln544_2_fu_162_p1;
reg    ap_block_state24;
reg   [23:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 24'd1;
end

bypass_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
bypass_AXILiteS_s_axi_U(
    .AWVALID(s_axi_AXILiteS_AWVALID),
    .AWREADY(s_axi_AXILiteS_AWREADY),
    .AWADDR(s_axi_AXILiteS_AWADDR),
    .WVALID(s_axi_AXILiteS_WVALID),
    .WREADY(s_axi_AXILiteS_WREADY),
    .WDATA(s_axi_AXILiteS_WDATA),
    .WSTRB(s_axi_AXILiteS_WSTRB),
    .ARVALID(s_axi_AXILiteS_ARVALID),
    .ARREADY(s_axi_AXILiteS_ARREADY),
    .ARADDR(s_axi_AXILiteS_ARADDR),
    .RVALID(s_axi_AXILiteS_RVALID),
    .RREADY(s_axi_AXILiteS_RREADY),
    .RDATA(s_axi_AXILiteS_RDATA),
    .RRESP(s_axi_AXILiteS_RRESP),
    .BVALID(s_axi_AXILiteS_BVALID),
    .BREADY(s_axi_AXILiteS_BREADY),
    .BRESP(s_axi_AXILiteS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .basePhysAddr_V(basePhysAddr_V)
);

bypass_physMemPtr_V_m_axi #(
    .CONSERVATIVE( 0 ),
    .USER_DW( 32 ),
    .USER_AW( 32 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_PHYSMEMPTR_V_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_PHYSMEMPTR_V_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_PHYSMEMPTR_V_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_PHYSMEMPTR_V_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_PHYSMEMPTR_V_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_PHYSMEMPTR_V_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_PHYSMEMPTR_V_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_PHYSMEMPTR_V_BUSER_WIDTH ),
    .C_TARGET_ADDR( C_M_AXI_PHYSMEMPTR_V_TARGET_ADDR ),
    .C_USER_VALUE( C_M_AXI_PHYSMEMPTR_V_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_PHYSMEMPTR_V_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_PHYSMEMPTR_V_CACHE_VALUE ))
bypass_physMemPtr_V_m_axi_U(
    .AWVALID(m_axi_physMemPtr_V_AWVALID),
    .AWREADY(m_axi_physMemPtr_V_AWREADY),
    .AWADDR(m_axi_physMemPtr_V_AWADDR),
    .AWID(m_axi_physMemPtr_V_AWID),
    .AWLEN(m_axi_physMemPtr_V_AWLEN),
    .AWSIZE(m_axi_physMemPtr_V_AWSIZE),
    .AWBURST(m_axi_physMemPtr_V_AWBURST),
    .AWLOCK(m_axi_physMemPtr_V_AWLOCK),
    .AWCACHE(m_axi_physMemPtr_V_AWCACHE),
    .AWPROT(m_axi_physMemPtr_V_AWPROT),
    .AWQOS(m_axi_physMemPtr_V_AWQOS),
    .AWREGION(m_axi_physMemPtr_V_AWREGION),
    .AWUSER(m_axi_physMemPtr_V_AWUSER),
    .WVALID(m_axi_physMemPtr_V_WVALID),
    .WREADY(m_axi_physMemPtr_V_WREADY),
    .WDATA(m_axi_physMemPtr_V_WDATA),
    .WSTRB(m_axi_physMemPtr_V_WSTRB),
    .WLAST(m_axi_physMemPtr_V_WLAST),
    .WID(m_axi_physMemPtr_V_WID),
    .WUSER(m_axi_physMemPtr_V_WUSER),
    .ARVALID(m_axi_physMemPtr_V_ARVALID),
    .ARREADY(m_axi_physMemPtr_V_ARREADY),
    .ARADDR(m_axi_physMemPtr_V_ARADDR),
    .ARID(m_axi_physMemPtr_V_ARID),
    .ARLEN(m_axi_physMemPtr_V_ARLEN),
    .ARSIZE(m_axi_physMemPtr_V_ARSIZE),
    .ARBURST(m_axi_physMemPtr_V_ARBURST),
    .ARLOCK(m_axi_physMemPtr_V_ARLOCK),
    .ARCACHE(m_axi_physMemPtr_V_ARCACHE),
    .ARPROT(m_axi_physMemPtr_V_ARPROT),
    .ARQOS(m_axi_physMemPtr_V_ARQOS),
    .ARREGION(m_axi_physMemPtr_V_ARREGION),
    .ARUSER(m_axi_physMemPtr_V_ARUSER),
    .RVALID(m_axi_physMemPtr_V_RVALID),
    .RREADY(m_axi_physMemPtr_V_RREADY),
    .RDATA(m_axi_physMemPtr_V_RDATA),
    .RLAST(m_axi_physMemPtr_V_RLAST),
    .RID(m_axi_physMemPtr_V_RID),
    .RUSER(m_axi_physMemPtr_V_RUSER),
    .RRESP(m_axi_physMemPtr_V_RRESP),
    .BVALID(m_axi_physMemPtr_V_BVALID),
    .BREADY(m_axi_physMemPtr_V_BREADY),
    .BRESP(m_axi_physMemPtr_V_BRESP),
    .BID(m_axi_physMemPtr_V_BID),
    .BUSER(m_axi_physMemPtr_V_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(physMemPtr_V_ARVALID),
    .I_ARREADY(physMemPtr_V_ARREADY),
    .I_ARADDR(physMemPtr_V_ARADDR),
    .I_ARID(1'd0),
    .I_ARLEN(physMemPtr_V_ARLEN),
    .I_ARSIZE(3'd0),
    .I_ARLOCK(2'd0),
    .I_ARCACHE(4'd0),
    .I_ARQOS(4'd0),
    .I_ARPROT(3'd0),
    .I_ARUSER(1'd0),
    .I_ARBURST(2'd0),
    .I_ARREGION(4'd0),
    .I_RVALID(physMemPtr_V_RVALID),
    .I_RREADY(physMemPtr_V_RREADY),
    .I_RDATA(physMemPtr_V_RDATA),
    .I_RID(physMemPtr_V_RID),
    .I_RUSER(physMemPtr_V_RUSER),
    .I_RRESP(physMemPtr_V_RRESP),
    .I_RLAST(physMemPtr_V_RLAST),
    .I_AWVALID(physMemPtr_V_AWVALID),
    .I_AWREADY(physMemPtr_V_AWREADY),
    .I_AWADDR(physMemPtr_V_AWADDR),
    .I_AWID(1'd0),
    .I_AWLEN(32'd2),
    .I_AWSIZE(3'd0),
    .I_AWLOCK(2'd0),
    .I_AWCACHE(4'd0),
    .I_AWQOS(4'd0),
    .I_AWPROT(3'd0),
    .I_AWUSER(1'd0),
    .I_AWBURST(2'd0),
    .I_AWREGION(4'd0),
    .I_WVALID(physMemPtr_V_WVALID),
    .I_WREADY(physMemPtr_V_WREADY),
    .I_WDATA(reg_106),
    .I_WID(1'd0),
    .I_WUSER(1'd0),
    .I_WLAST(1'b0),
    .I_WSTRB(4'd15),
    .I_BVALID(physMemPtr_V_BVALID),
    .I_BREADY(physMemPtr_V_BREADY),
    .I_BRESP(physMemPtr_V_BRESP),
    .I_BID(physMemPtr_V_BID),
    .I_BUSER(physMemPtr_V_BUSER)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state10_io) & (1'b1 == ap_CS_fsm_state10))) begin
        icmp_ln23_reg_198 <= icmp_ln23_fu_142_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        r_V_reg_172 <= {{basePhysAddr_V[31:2]}};
        ret_V_reg_182 <= ret_V_fu_126_p2;
        zext_ln215_reg_177[29 : 0] <= zext_ln215_fu_122_p1[29 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_WREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state18)) | (~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_AWREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state17)))) begin
        reg_106 <= physMemPtr_V_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ret_V_1_reg_208 <= ret_V_1_fu_157_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((physMemPtr_V_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
        status_V_reg_193 <= physMemPtr_V_RDATA;
    end
end

always @ (*) begin
    if ((~((physMemPtr_V_BVALID == 1'b0) & (icmp_ln23_reg_198 == 1'd0)) & (1'b1 == ap_CS_fsm_state24))) begin
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
    if ((~((physMemPtr_V_BVALID == 1'b0) & (icmp_ln23_reg_198 == 1'd0)) & (1'b1 == ap_CS_fsm_state24))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state10_io) & (1'b1 == ap_CS_fsm_state10) & (icmp_ln23_fu_142_p2 == 1'd0))) begin
        physMemPtr_V_ARADDR = zext_ln544_1_fu_147_p1;
    end else if (((physMemPtr_V_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        physMemPtr_V_ARADDR = zext_ln544_fu_132_p1;
    end else begin
        physMemPtr_V_ARADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state10_io) & (1'b1 == ap_CS_fsm_state10) & (icmp_ln23_fu_142_p2 == 1'd0))) begin
        physMemPtr_V_ARLEN = 32'd2;
    end else if (((physMemPtr_V_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        physMemPtr_V_ARLEN = 32'd1;
    end else begin
        physMemPtr_V_ARLEN = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_state10_io) & (1'b1 == ap_CS_fsm_state10) & (icmp_ln23_fu_142_p2 == 1'd0)) | ((physMemPtr_V_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        physMemPtr_V_ARVALID = 1'b1;
    end else begin
        physMemPtr_V_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_AWREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state17))) begin
        physMemPtr_V_AWVALID = 1'b1;
    end else begin
        physMemPtr_V_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((physMemPtr_V_BVALID == 1'b0) & (icmp_ln23_reg_198 == 1'd0)) & (1'b1 == ap_CS_fsm_state24) & (icmp_ln23_reg_198 == 1'd0))) begin
        physMemPtr_V_BREADY = 1'b1;
    end else begin
        physMemPtr_V_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_WREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state18)) | (~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_AWREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state17)) | ((physMemPtr_V_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9)))) begin
        physMemPtr_V_RREADY = 1'b1;
    end else begin
        physMemPtr_V_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((((physMemPtr_V_WREADY == 1'b1) & (1'b1 == ap_CS_fsm_state19)) | (~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_WREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state18)))) begin
        physMemPtr_V_WVALID = 1'b1;
    end else begin
        physMemPtr_V_WVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state10) & (icmp_ln23_fu_142_p2 == 1'd0)))) begin
        physMemPtr_V_blk_n_AR = m_axi_physMemPtr_V_ARREADY;
    end else begin
        physMemPtr_V_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        physMemPtr_V_blk_n_AW = m_axi_physMemPtr_V_AWREADY;
    end else begin
        physMemPtr_V_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state24) & (icmp_ln23_reg_198 == 1'd0))) begin
        physMemPtr_V_blk_n_B = m_axi_physMemPtr_V_BVALID;
    end else begin
        physMemPtr_V_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state9))) begin
        physMemPtr_V_blk_n_R = m_axi_physMemPtr_V_RVALID;
    end else begin
        physMemPtr_V_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state18))) begin
        physMemPtr_V_blk_n_W = m_axi_physMemPtr_V_WREADY;
    end else begin
        physMemPtr_V_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((physMemPtr_V_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((physMemPtr_V_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b0 == ap_block_state10_io) & (1'b1 == ap_CS_fsm_state10) & (icmp_ln23_fu_142_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state24;
            end else if (((1'b0 == ap_block_state10_io) & (1'b1 == ap_CS_fsm_state10) & (icmp_ln23_fu_142_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            if ((~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_AWREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state17))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end
        end
        ap_ST_fsm_state18 : begin
            if ((~((physMemPtr_V_RVALID == 1'b0) | (physMemPtr_V_WREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state18))) begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end
        end
        ap_ST_fsm_state19 : begin
            if (((physMemPtr_V_WREADY == 1'b1) & (1'b1 == ap_CS_fsm_state19))) begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            if ((~((physMemPtr_V_BVALID == 1'b0) & (icmp_ln23_reg_198 == 1'd0)) & (1'b1 == ap_CS_fsm_state24))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state24;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state24 = ap_CS_fsm[32'd23];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state10_io = ((physMemPtr_V_ARREADY == 1'b0) & (icmp_ln23_fu_142_p2 == 1'd0));
end

always @ (*) begin
    ap_block_state24 = ((physMemPtr_V_BVALID == 1'b0) & (icmp_ln23_reg_198 == 1'd0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign icmp_ln23_fu_142_p2 = ((status_V_reg_193 == 32'd0) ? 1'b1 : 1'b0);

assign physMemPtr_V_AWADDR = zext_ln544_2_fu_162_p1;

assign r_V_fu_112_p4 = {{basePhysAddr_V[31:2]}};

assign ret_V_1_fu_157_p2 = (zext_ln215_reg_177 + 31'd2);

assign ret_V_fu_126_p2 = (zext_ln215_fu_122_p1 + 31'd4);

assign zext_ln215_fu_122_p1 = r_V_fu_112_p4;

assign zext_ln544_1_fu_147_p1 = r_V_reg_172;

assign zext_ln544_2_fu_162_p1 = ret_V_1_reg_208;

assign zext_ln544_fu_132_p1 = ret_V_reg_182;

always @ (posedge ap_clk) begin
    zext_ln215_reg_177[30] <= 1'b0;
end

endmodule //bypass
