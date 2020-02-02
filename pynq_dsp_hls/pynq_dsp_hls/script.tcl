############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pynq_dsp_hls
set_top pynq_dsp_hls
add_files pynq_dsp_hls.cpp -cflags "-std=c++11" -csimflags "-std=c++11"
add_files -tb pynq_dsp_hls_tb.cpp
open_solution "pynq_dsp_hls"
set_part {xc7z020-clg400-1} -tool vivado
create_clock -period 8 -name default
config_sdx -optimization_level none -target none
config_export -description {Audio DSP Bypass Sample} -display_name Bypass -format ip_catalog -rtl verilog -vendor kamiyaowl -version 0.1 -vivado_optimization_level 2
set_clock_uncertainty 12.5%
#source "./pynq_dsp_hls/pynq_dsp_hls/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level port -tool xsim
export_design -rtl verilog -format ip_catalog -description "Audio DSP Bypass Sample" -vendor "kamiyaowl" -version "0.1" -display_name "Bypass"
