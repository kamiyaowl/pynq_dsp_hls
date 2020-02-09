set moduleName effect_delay
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {effect_delay}
set C_modelType { int 64 }
set C_modelArgList {
	{ inData_l float 32 regular  }
	{ inData_r float 32 regular  }
	{ config_r int 32 regular {array 32 { 2 } 1 1 }  }
	{ config_offset int 3 regular  }
	{ extMemPtr_V int 32 regular {axi_master 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inData_l", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inData_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "config_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "config_offset", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "extMemPtr_V", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 64} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inData_l sc_in sc_lv 32 signal 0 } 
	{ inData_r sc_in sc_lv 32 signal 1 } 
	{ config_r_address0 sc_out sc_lv 5 signal 2 } 
	{ config_r_ce0 sc_out sc_logic 1 signal 2 } 
	{ config_r_we0 sc_out sc_logic 1 signal 2 } 
	{ config_r_d0 sc_out sc_lv 32 signal 2 } 
	{ config_r_q0 sc_in sc_lv 32 signal 2 } 
	{ config_offset sc_in sc_lv 3 signal 3 } 
	{ m_axi_extMemPtr_V_AWVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_AWREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_AWADDR sc_out sc_lv 32 signal 4 } 
	{ m_axi_extMemPtr_V_AWID sc_out sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_AWLEN sc_out sc_lv 32 signal 4 } 
	{ m_axi_extMemPtr_V_AWSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_extMemPtr_V_AWBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_extMemPtr_V_AWLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_extMemPtr_V_AWCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_AWPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_extMemPtr_V_AWQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_AWREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_AWUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_WVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_WREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_WDATA sc_out sc_lv 32 signal 4 } 
	{ m_axi_extMemPtr_V_WSTRB sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_WLAST sc_out sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_WID sc_out sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_WUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_ARVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_ARREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_ARADDR sc_out sc_lv 32 signal 4 } 
	{ m_axi_extMemPtr_V_ARID sc_out sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_ARLEN sc_out sc_lv 32 signal 4 } 
	{ m_axi_extMemPtr_V_ARSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_extMemPtr_V_ARBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_extMemPtr_V_ARLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_extMemPtr_V_ARCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_ARPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_extMemPtr_V_ARQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_ARREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_extMemPtr_V_ARUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_RVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_RREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_RDATA sc_in sc_lv 32 signal 4 } 
	{ m_axi_extMemPtr_V_RLAST sc_in sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_RID sc_in sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_RUSER sc_in sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_RRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_extMemPtr_V_BVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_BREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_extMemPtr_V_BRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_extMemPtr_V_BID sc_in sc_lv 1 signal 4 } 
	{ m_axi_extMemPtr_V_BUSER sc_in sc_lv 1 signal 4 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inData_l", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inData_l", "role": "default" }} , 
 	{ "name": "inData_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inData_r", "role": "default" }} , 
 	{ "name": "config_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "config_r", "role": "address0" }} , 
 	{ "name": "config_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "config_r", "role": "ce0" }} , 
 	{ "name": "config_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "config_r", "role": "we0" }} , 
 	{ "name": "config_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "config_r", "role": "d0" }} , 
 	{ "name": "config_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "config_r", "role": "q0" }} , 
 	{ "name": "config_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "config_offset", "role": "default" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWID" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWLEN" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWBURST" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWPROT" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWQOS" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWREGION" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWUSER" }} , 
 	{ "name": "m_axi_extMemPtr_V_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WVALID" }} , 
 	{ "name": "m_axi_extMemPtr_V_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WREADY" }} , 
 	{ "name": "m_axi_extMemPtr_V_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WDATA" }} , 
 	{ "name": "m_axi_extMemPtr_V_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WSTRB" }} , 
 	{ "name": "m_axi_extMemPtr_V_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WLAST" }} , 
 	{ "name": "m_axi_extMemPtr_V_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WID" }} , 
 	{ "name": "m_axi_extMemPtr_V_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "WUSER" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARVALID" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARREADY" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARADDR" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARID" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARLEN" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARBURST" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARPROT" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARQOS" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARREGION" }} , 
 	{ "name": "m_axi_extMemPtr_V_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARUSER" }} , 
 	{ "name": "m_axi_extMemPtr_V_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RVALID" }} , 
 	{ "name": "m_axi_extMemPtr_V_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RREADY" }} , 
 	{ "name": "m_axi_extMemPtr_V_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RDATA" }} , 
 	{ "name": "m_axi_extMemPtr_V_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RLAST" }} , 
 	{ "name": "m_axi_extMemPtr_V_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RID" }} , 
 	{ "name": "m_axi_extMemPtr_V_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RUSER" }} , 
 	{ "name": "m_axi_extMemPtr_V_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "RRESP" }} , 
 	{ "name": "m_axi_extMemPtr_V_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "BVALID" }} , 
 	{ "name": "m_axi_extMemPtr_V_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "BREADY" }} , 
 	{ "name": "m_axi_extMemPtr_V_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "BRESP" }} , 
 	{ "name": "m_axi_extMemPtr_V_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "BID" }} , 
 	{ "name": "m_axi_extMemPtr_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "BUSER" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "effect_delay",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "35",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "inData_l", "Type" : "None", "Direction" : "I"},
			{"Name" : "inData_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "config_r", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "config_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "extMemPtr_V", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "extMemPtr_V_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_R", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_faddbkb_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_faddbkb_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fmulcud_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_uitodEe_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	effect_delay {
		inData_l {Type I LastRead 4 FirstWrite -1}
		inData_r {Type I LastRead 4 FirstWrite -1}
		config_r {Type IO LastRead 5 FirstWrite 6}
		config_offset {Type I LastRead 0 FirstWrite -1}
		extMemPtr_V {Type IO LastRead 27 FirstWrite 12}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "35"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "35"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inData_l { ap_none {  { inData_l in_data 0 32 } } }
	inData_r { ap_none {  { inData_r in_data 0 32 } } }
	config_r { ap_memory {  { config_r_address0 mem_address 1 5 }  { config_r_ce0 mem_ce 1 1 }  { config_r_we0 mem_we 1 1 }  { config_r_d0 mem_din 1 32 }  { config_r_q0 mem_dout 0 32 } } }
	config_offset { ap_none {  { config_offset in_data 0 3 } } }
	extMemPtr_V { m_axi {  { m_axi_extMemPtr_V_AWVALID VALID 1 1 }  { m_axi_extMemPtr_V_AWREADY READY 0 1 }  { m_axi_extMemPtr_V_AWADDR ADDR 1 32 }  { m_axi_extMemPtr_V_AWID ID 1 1 }  { m_axi_extMemPtr_V_AWLEN LEN 1 32 }  { m_axi_extMemPtr_V_AWSIZE SIZE 1 3 }  { m_axi_extMemPtr_V_AWBURST BURST 1 2 }  { m_axi_extMemPtr_V_AWLOCK LOCK 1 2 }  { m_axi_extMemPtr_V_AWCACHE CACHE 1 4 }  { m_axi_extMemPtr_V_AWPROT PROT 1 3 }  { m_axi_extMemPtr_V_AWQOS QOS 1 4 }  { m_axi_extMemPtr_V_AWREGION REGION 1 4 }  { m_axi_extMemPtr_V_AWUSER USER 1 1 }  { m_axi_extMemPtr_V_WVALID VALID 1 1 }  { m_axi_extMemPtr_V_WREADY READY 0 1 }  { m_axi_extMemPtr_V_WDATA DATA 1 32 }  { m_axi_extMemPtr_V_WSTRB STRB 1 4 }  { m_axi_extMemPtr_V_WLAST LAST 1 1 }  { m_axi_extMemPtr_V_WID ID 1 1 }  { m_axi_extMemPtr_V_WUSER USER 1 1 }  { m_axi_extMemPtr_V_ARVALID VALID 1 1 }  { m_axi_extMemPtr_V_ARREADY READY 0 1 }  { m_axi_extMemPtr_V_ARADDR ADDR 1 32 }  { m_axi_extMemPtr_V_ARID ID 1 1 }  { m_axi_extMemPtr_V_ARLEN LEN 1 32 }  { m_axi_extMemPtr_V_ARSIZE SIZE 1 3 }  { m_axi_extMemPtr_V_ARBURST BURST 1 2 }  { m_axi_extMemPtr_V_ARLOCK LOCK 1 2 }  { m_axi_extMemPtr_V_ARCACHE CACHE 1 4 }  { m_axi_extMemPtr_V_ARPROT PROT 1 3 }  { m_axi_extMemPtr_V_ARQOS QOS 1 4 }  { m_axi_extMemPtr_V_ARREGION REGION 1 4 }  { m_axi_extMemPtr_V_ARUSER USER 1 1 }  { m_axi_extMemPtr_V_RVALID VALID 0 1 }  { m_axi_extMemPtr_V_RREADY READY 1 1 }  { m_axi_extMemPtr_V_RDATA DATA 0 32 }  { m_axi_extMemPtr_V_RLAST LAST 0 1 }  { m_axi_extMemPtr_V_RID ID 0 1 }  { m_axi_extMemPtr_V_RUSER USER 0 1 }  { m_axi_extMemPtr_V_RRESP RESP 0 2 }  { m_axi_extMemPtr_V_BVALID VALID 0 1 }  { m_axi_extMemPtr_V_BREADY READY 1 1 }  { m_axi_extMemPtr_V_BRESP RESP 0 2 }  { m_axi_extMemPtr_V_BID ID 0 1 }  { m_axi_extMemPtr_V_BUSER USER 0 1 } } }
}
