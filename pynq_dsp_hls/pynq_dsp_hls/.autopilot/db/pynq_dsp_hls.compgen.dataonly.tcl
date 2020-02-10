# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_AXILiteS {
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
basePhysAddr_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
monitorSrcL { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 24
	offset_end 31
}
monitorSrcR { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 32
	offset_end 39
}
monitorDstL { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 40
	offset_end 47
}
monitorDstR { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
counter_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
counter_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
numOfStage { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 72
	offset_end 79
}
configSizePerStage { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 80
	offset_end 87
}
configReg { 
	dir IO
	width 32
	depth 64
	mode ap_memory
	offset 256
	offset_end 511
}
}
dict set axilite_register_dict AXILiteS $port_AXILiteS


