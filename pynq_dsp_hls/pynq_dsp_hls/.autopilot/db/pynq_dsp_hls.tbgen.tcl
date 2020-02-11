set moduleName pynq_dsp_hls
set isTopModule 1
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
set C_modelName {pynq_dsp_hls}
set C_modelType { void 0 }
set C_modelArgList {
	{ lrclk uint 1 regular  }
	{ physMemPtr_V int 32 regular {axi_master 2}  }
	{ extMemPtr_V int 32 regular {axi_master 2}  }
	{ basePhysAddr_V int 32 regular {axi_slave 0}  }
	{ monitorSrcL float 32 regular {axi_slave 1}  }
	{ monitorSrcR float 32 regular {axi_slave 1}  }
	{ monitorDstL float 32 regular {axi_slave 1}  }
	{ monitorDstR float 32 regular {axi_slave 1}  }
	{ counter int 32 regular {axi_slave 2}  }
	{ numOfStage int 32 regular {axi_slave 1}  }
	{ configSizePerStage int 32 regular {axi_slave 1}  }
	{ configReg int 32 regular {axi_slave 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "lrclk", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lrclk","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "physMemPtr_V", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "physMemPtr.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "extMemPtr_V", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "extMemPtr.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "basePhysAddr_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "basePhysAddr.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "monitorSrcL", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "monitorSrcL","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":24}, "offset_end" : {"out":31}} , 
 	{ "Name" : "monitorSrcR", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "monitorSrcR","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "monitorDstL", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "monitorDstL","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":40}, "offset_end" : {"out":47}} , 
 	{ "Name" : "monitorDstR", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "monitorDstR","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":48}, "offset_end" : {"out":55}} , 
 	{ "Name" : "counter", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "counter","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":56, "out":64}, "offset_end" : {"in":63, "out":71}} , 
 	{ "Name" : "numOfStage", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "numOfStage","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":72}, "offset_end" : {"out":79}} , 
 	{ "Name" : "configSizePerStage", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "configSizePerStage","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":80}, "offset_end" : {"out":87}} , 
 	{ "Name" : "configReg", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_memory","bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "configReg","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 3,"step" : 1},{"low" : 0,"up" : 15,"step" : 1}]}]}], "offset" : {"in":256, "out":256}, "offset_end" : {"in":511, "out":511}} ]}
# RTL Port declarations: 
set portNum 111
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ lrclk sc_in sc_logic 1 signal 0 } 
	{ m_axi_physMemPtr_V_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_physMemPtr_V_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_physMemPtr_V_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_physMemPtr_V_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_physMemPtr_V_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_physMemPtr_V_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_physMemPtr_V_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_physMemPtr_V_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_physMemPtr_V_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_physMemPtr_V_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_physMemPtr_V_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_physMemPtr_V_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_physMemPtr_V_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_physMemPtr_V_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_physMemPtr_V_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_physMemPtr_V_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_physMemPtr_V_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_physMemPtr_V_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_physMemPtr_V_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_physMemPtr_V_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_extMemPtr_V_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_AWADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_extMemPtr_V_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_extMemPtr_V_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_extMemPtr_V_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_extMemPtr_V_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_extMemPtr_V_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_extMemPtr_V_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_extMemPtr_V_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_ARADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_extMemPtr_V_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_extMemPtr_V_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_extMemPtr_V_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_extMemPtr_V_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_extMemPtr_V_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_extMemPtr_V_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_extMemPtr_V_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_extMemPtr_V_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_extMemPtr_V_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_extMemPtr_V_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_extMemPtr_V_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_extMemPtr_V_BUSER sc_in sc_lv 1 signal 2 } 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"pynq_dsp_hls","role":"start","value":"0","valid_bit":"0"},{"name":"pynq_dsp_hls","role":"continue","value":"0","valid_bit":"4"},{"name":"pynq_dsp_hls","role":"auto_start","value":"0","valid_bit":"7"},{"name":"basePhysAddr_V","role":"data","value":"16"},{"name":"counter","role":"data","value":"56"},{"name":"configReg","role":"data","value":"256"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"pynq_dsp_hls","role":"start","value":"0","valid_bit":"0"},{"name":"pynq_dsp_hls","role":"done","value":"0","valid_bit":"1"},{"name":"pynq_dsp_hls","role":"idle","value":"0","valid_bit":"2"},{"name":"pynq_dsp_hls","role":"ready","value":"0","valid_bit":"3"},{"name":"pynq_dsp_hls","role":"auto_start","value":"0","valid_bit":"7"},{"name":"monitorSrcL","role":"data","value":"24"}, {"name":"monitorSrcL","role":"valid","value":"28","valid_bit":"0"},{"name":"monitorSrcR","role":"data","value":"32"}, {"name":"monitorSrcR","role":"valid","value":"36","valid_bit":"0"},{"name":"monitorDstL","role":"data","value":"40"}, {"name":"monitorDstL","role":"valid","value":"44","valid_bit":"0"},{"name":"monitorDstR","role":"data","value":"48"}, {"name":"monitorDstR","role":"valid","value":"52","valid_bit":"0"},{"name":"counter","role":"data","value":"64"}, {"name":"counter","role":"valid","value":"68","valid_bit":"0"},{"name":"numOfStage","role":"data","value":"72"}, {"name":"numOfStage","role":"valid","value":"76","valid_bit":"0"},{"name":"configSizePerStage","role":"data","value":"80"}, {"name":"configSizePerStage","role":"valid","value":"84","valid_bit":"0"},{"name":"configReg","role":"data","value":"256"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "lrclk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lrclk", "role": "default" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWID" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWLEN" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWBURST" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWPROT" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWQOS" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWREGION" }} , 
 	{ "name": "m_axi_physMemPtr_V_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "AWUSER" }} , 
 	{ "name": "m_axi_physMemPtr_V_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WVALID" }} , 
 	{ "name": "m_axi_physMemPtr_V_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WREADY" }} , 
 	{ "name": "m_axi_physMemPtr_V_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WDATA" }} , 
 	{ "name": "m_axi_physMemPtr_V_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WSTRB" }} , 
 	{ "name": "m_axi_physMemPtr_V_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WLAST" }} , 
 	{ "name": "m_axi_physMemPtr_V_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WID" }} , 
 	{ "name": "m_axi_physMemPtr_V_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "WUSER" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARVALID" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARREADY" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARADDR" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARID" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARLEN" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARBURST" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARPROT" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARQOS" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARREGION" }} , 
 	{ "name": "m_axi_physMemPtr_V_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "ARUSER" }} , 
 	{ "name": "m_axi_physMemPtr_V_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RVALID" }} , 
 	{ "name": "m_axi_physMemPtr_V_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RREADY" }} , 
 	{ "name": "m_axi_physMemPtr_V_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RDATA" }} , 
 	{ "name": "m_axi_physMemPtr_V_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RLAST" }} , 
 	{ "name": "m_axi_physMemPtr_V_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RID" }} , 
 	{ "name": "m_axi_physMemPtr_V_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RUSER" }} , 
 	{ "name": "m_axi_physMemPtr_V_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "RRESP" }} , 
 	{ "name": "m_axi_physMemPtr_V_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "BVALID" }} , 
 	{ "name": "m_axi_physMemPtr_V_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "BREADY" }} , 
 	{ "name": "m_axi_physMemPtr_V_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "BRESP" }} , 
 	{ "name": "m_axi_physMemPtr_V_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "BID" }} , 
 	{ "name": "m_axi_physMemPtr_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "physMemPtr_V", "role": "BUSER" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWID" }} , 
 	{ "name": "m_axi_extMemPtr_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_extMemPtr_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_extMemPtr_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "extMemPtr_V", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "pynq_dsp_hls",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "277",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state46", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_effect_delay_fu_398"}],
		"Port" : [
			{"Name" : "lrclk", "Type" : "None", "Direction" : "I"},
			{"Name" : "physMemPtr_V", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "physMemPtr_V_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "physMemPtr_V_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "physMemPtr_V_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "physMemPtr_V_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "physMemPtr_V_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "extMemPtr_V", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_effect_delay_fu_398", "Port" : "extMemPtr_V"}]},
			{"Name" : "basePhysAddr_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "monitorSrcL", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "monitorSrcR", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "monitorDstL", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "monitorDstR", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "counter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "numOfStage", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "configSizePerStage", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "configReg", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_effect_delay_fu_398", "Port" : "config_r"}]},
			{"Name" : "readyRch", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "readyLch", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_AXILiteS_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_physMemPtr_V_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_extMemPtr_V_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398", "Parent" : "0", "Child" : ["5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"],
		"CDFG" : "effect_delay",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "50",
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
					{"Name" : "extMemPtr_V_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "extMemPtr_V_blk_n_B", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_faddbkb_U1", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_faddbkb_U2", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_faddbkb_U3", "Parent" : "4"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fmulcud_U4", "Parent" : "4"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fmulcud_U5", "Parent" : "4"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fmulcud_U6", "Parent" : "4"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fmulcud_U7", "Parent" : "4"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fmulcud_U8", "Parent" : "4"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fmulcud_U9", "Parent" : "4"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_uitodEe_U10", "Parent" : "4"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_effect_delay_fu_398.pynq_dsp_hls_fcmpeOg_U11", "Parent" : "4"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_faddfYi_U21", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_faddfYi_U22", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fmulcud_U23", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fmulcud_U24", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fdivg8j_U25", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fdivg8j_U26", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_sitohbi_U27", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_sitohbi_U28", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fcmpeOg_U29", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fcmpeOg_U30", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fcmpeOg_U31", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pynq_dsp_hls_fcmpeOg_U32", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pynq_dsp_hls {
		lrclk {Type I LastRead 0 FirstWrite -1}
		physMemPtr_V {Type IO LastRead 52 FirstWrite 50}
		extMemPtr_V {Type IO LastRead 46 FirstWrite 44}
		basePhysAddr_V {Type I LastRead 0 FirstWrite -1}
		monitorSrcL {Type O LastRead -1 FirstWrite 50}
		monitorSrcR {Type O LastRead -1 FirstWrite 50}
		monitorDstL {Type O LastRead -1 FirstWrite 50}
		monitorDstR {Type O LastRead -1 FirstWrite 50}
		counter {Type IO LastRead 17 FirstWrite 18}
		numOfStage {Type O LastRead -1 FirstWrite 9}
		configSizePerStage {Type O LastRead -1 FirstWrite 9}
		configReg {Type IO LastRead 52 FirstWrite 9}
		readyRch {Type IO LastRead -1 FirstWrite -1}
		readyLch {Type IO LastRead -1 FirstWrite -1}}
	effect_delay {
		inData_l {Type I LastRead 7 FirstWrite -1}
		inData_r {Type I LastRead 7 FirstWrite -1}
		config_r {Type IO LastRead 8 FirstWrite 9}
		config_offset {Type I LastRead 0 FirstWrite -1}
		extMemPtr_V {Type IO LastRead 46 FirstWrite 44}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "277"}
	, {"Name" : "Interval", "Min" : "12", "Max" : "278"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	lrclk { ap_none {  { lrclk in_data 0 1 } } }
	physMemPtr_V { m_axi {  { m_axi_physMemPtr_V_AWVALID VALID 1 1 }  { m_axi_physMemPtr_V_AWREADY READY 0 1 }  { m_axi_physMemPtr_V_AWADDR ADDR 1 32 }  { m_axi_physMemPtr_V_AWID ID 1 1 }  { m_axi_physMemPtr_V_AWLEN LEN 1 8 }  { m_axi_physMemPtr_V_AWSIZE SIZE 1 3 }  { m_axi_physMemPtr_V_AWBURST BURST 1 2 }  { m_axi_physMemPtr_V_AWLOCK LOCK 1 2 }  { m_axi_physMemPtr_V_AWCACHE CACHE 1 4 }  { m_axi_physMemPtr_V_AWPROT PROT 1 3 }  { m_axi_physMemPtr_V_AWQOS QOS 1 4 }  { m_axi_physMemPtr_V_AWREGION REGION 1 4 }  { m_axi_physMemPtr_V_AWUSER USER 1 1 }  { m_axi_physMemPtr_V_WVALID VALID 1 1 }  { m_axi_physMemPtr_V_WREADY READY 0 1 }  { m_axi_physMemPtr_V_WDATA DATA 1 32 }  { m_axi_physMemPtr_V_WSTRB STRB 1 4 }  { m_axi_physMemPtr_V_WLAST LAST 1 1 }  { m_axi_physMemPtr_V_WID ID 1 1 }  { m_axi_physMemPtr_V_WUSER USER 1 1 }  { m_axi_physMemPtr_V_ARVALID VALID 1 1 }  { m_axi_physMemPtr_V_ARREADY READY 0 1 }  { m_axi_physMemPtr_V_ARADDR ADDR 1 32 }  { m_axi_physMemPtr_V_ARID ID 1 1 }  { m_axi_physMemPtr_V_ARLEN LEN 1 8 }  { m_axi_physMemPtr_V_ARSIZE SIZE 1 3 }  { m_axi_physMemPtr_V_ARBURST BURST 1 2 }  { m_axi_physMemPtr_V_ARLOCK LOCK 1 2 }  { m_axi_physMemPtr_V_ARCACHE CACHE 1 4 }  { m_axi_physMemPtr_V_ARPROT PROT 1 3 }  { m_axi_physMemPtr_V_ARQOS QOS 1 4 }  { m_axi_physMemPtr_V_ARREGION REGION 1 4 }  { m_axi_physMemPtr_V_ARUSER USER 1 1 }  { m_axi_physMemPtr_V_RVALID VALID 0 1 }  { m_axi_physMemPtr_V_RREADY READY 1 1 }  { m_axi_physMemPtr_V_RDATA DATA 0 32 }  { m_axi_physMemPtr_V_RLAST LAST 0 1 }  { m_axi_physMemPtr_V_RID ID 0 1 }  { m_axi_physMemPtr_V_RUSER USER 0 1 }  { m_axi_physMemPtr_V_RRESP RESP 0 2 }  { m_axi_physMemPtr_V_BVALID VALID 0 1 }  { m_axi_physMemPtr_V_BREADY READY 1 1 }  { m_axi_physMemPtr_V_BRESP RESP 0 2 }  { m_axi_physMemPtr_V_BID ID 0 1 }  { m_axi_physMemPtr_V_BUSER USER 0 1 } } }
	extMemPtr_V { m_axi {  { m_axi_extMemPtr_V_AWVALID VALID 1 1 }  { m_axi_extMemPtr_V_AWREADY READY 0 1 }  { m_axi_extMemPtr_V_AWADDR ADDR 1 32 }  { m_axi_extMemPtr_V_AWID ID 1 1 }  { m_axi_extMemPtr_V_AWLEN LEN 1 8 }  { m_axi_extMemPtr_V_AWSIZE SIZE 1 3 }  { m_axi_extMemPtr_V_AWBURST BURST 1 2 }  { m_axi_extMemPtr_V_AWLOCK LOCK 1 2 }  { m_axi_extMemPtr_V_AWCACHE CACHE 1 4 }  { m_axi_extMemPtr_V_AWPROT PROT 1 3 }  { m_axi_extMemPtr_V_AWQOS QOS 1 4 }  { m_axi_extMemPtr_V_AWREGION REGION 1 4 }  { m_axi_extMemPtr_V_AWUSER USER 1 1 }  { m_axi_extMemPtr_V_WVALID VALID 1 1 }  { m_axi_extMemPtr_V_WREADY READY 0 1 }  { m_axi_extMemPtr_V_WDATA DATA 1 32 }  { m_axi_extMemPtr_V_WSTRB STRB 1 4 }  { m_axi_extMemPtr_V_WLAST LAST 1 1 }  { m_axi_extMemPtr_V_WID ID 1 1 }  { m_axi_extMemPtr_V_WUSER USER 1 1 }  { m_axi_extMemPtr_V_ARVALID VALID 1 1 }  { m_axi_extMemPtr_V_ARREADY READY 0 1 }  { m_axi_extMemPtr_V_ARADDR ADDR 1 32 }  { m_axi_extMemPtr_V_ARID ID 1 1 }  { m_axi_extMemPtr_V_ARLEN LEN 1 8 }  { m_axi_extMemPtr_V_ARSIZE SIZE 1 3 }  { m_axi_extMemPtr_V_ARBURST BURST 1 2 }  { m_axi_extMemPtr_V_ARLOCK LOCK 1 2 }  { m_axi_extMemPtr_V_ARCACHE CACHE 1 4 }  { m_axi_extMemPtr_V_ARPROT PROT 1 3 }  { m_axi_extMemPtr_V_ARQOS QOS 1 4 }  { m_axi_extMemPtr_V_ARREGION REGION 1 4 }  { m_axi_extMemPtr_V_ARUSER USER 1 1 }  { m_axi_extMemPtr_V_RVALID VALID 0 1 }  { m_axi_extMemPtr_V_RREADY READY 1 1 }  { m_axi_extMemPtr_V_RDATA DATA 0 32 }  { m_axi_extMemPtr_V_RLAST LAST 0 1 }  { m_axi_extMemPtr_V_RID ID 0 1 }  { m_axi_extMemPtr_V_RUSER USER 0 1 }  { m_axi_extMemPtr_V_RRESP RESP 0 2 }  { m_axi_extMemPtr_V_BVALID VALID 0 1 }  { m_axi_extMemPtr_V_BREADY READY 1 1 }  { m_axi_extMemPtr_V_BRESP RESP 0 2 }  { m_axi_extMemPtr_V_BID ID 0 1 }  { m_axi_extMemPtr_V_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ physMemPtr_V { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ extMemPtr_V { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ physMemPtr_V 1 }
	{ extMemPtr_V 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ physMemPtr_V 1 }
	{ extMemPtr_V 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
