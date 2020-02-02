// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.3 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#define AP_INT_MAX_W 32678

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "physMemPtr_V"
#define AUTOTB_TVIN_physMemPtr_V  "../tv/cdatafile/c.bypass.autotvin_physMemPtr_V.dat"
#define AUTOTB_TVOUT_physMemPtr_V  "../tv/cdatafile/c.bypass.autotvout_physMemPtr_V.dat"
// wrapc file define: "basePhysAddr_V"
#define AUTOTB_TVIN_basePhysAddr_V  "../tv/cdatafile/c.bypass.autotvin_basePhysAddr_V.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "physMemPtr_V"
#define AUTOTB_TVOUT_PC_physMemPtr_V  "../tv/rtldatafile/rtl.bypass.autotvout_physMemPtr_V.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			physMemPtr_V_depth = 0;
			basePhysAddr_V_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{physMemPtr_V " << physMemPtr_V_depth << "}\n";
			total_list << "{basePhysAddr_V " << basePhysAddr_V_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int physMemPtr_V_depth;
		int basePhysAddr_V_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void bypass (
volatile ap_uint<32>* physMemPtr,
ap_uint<32> basePhysAddr);

void AESL_WRAP_bypass (
volatile ap_uint<32>* physMemPtr,
ap_uint<32> basePhysAddr)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "physMemPtr_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_physMemPtr_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_physMemPtr_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_physMemPtr_V, AESL_token); // data

			sc_bv<32> *physMemPtr_V_pc_buffer = new sc_bv<32>[32];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'physMemPtr_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'physMemPtr_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					physMemPtr_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_physMemPtr_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_physMemPtr_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: physMemPtr_V
				{
					// bitslice(31, 0)
					// {
						// celement: physMemPtr.V(31, 0)
						// {
							sc_lv<32>* physMemPtr_V_lv0_0_31_1 = new sc_lv<32>[32];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: physMemPtr.V(31, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								if (&(physMemPtr[0]) != NULL) // check the null address if the c port is array or others
								{
									physMemPtr_V_lv0_0_31_1[hls_map_index].range(31, 0) = sc_bv<32>(physMemPtr_V_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: physMemPtr.V(31, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : physMemPtr[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : physMemPtr[0]
								// output_left_conversion : physMemPtr[i_0]
								// output_type_conversion : (physMemPtr_V_lv0_0_31_1[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(physMemPtr[0]) != NULL) // check the null address if the c port is array or others
								{
									physMemPtr[i_0] = (physMemPtr_V_lv0_0_31_1[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] physMemPtr_V_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "physMemPtr_V"
		char* tvin_physMemPtr_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_physMemPtr_V);
		char* tvout_physMemPtr_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_physMemPtr_V);

		// "basePhysAddr_V"
		char* tvin_basePhysAddr_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_basePhysAddr_V);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_physMemPtr_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_physMemPtr_V, tvin_physMemPtr_V);

		sc_bv<32>* physMemPtr_V_tvin_wrapc_buffer = new sc_bv<32>[32];

		// RTL Name: physMemPtr_V
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: physMemPtr.V(31, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : physMemPtr[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : physMemPtr[0]
						// regulate_c_name       : physMemPtr_V
						// input_type_conversion : (physMemPtr[i_0]).to_string(2).c_str()
						if (&(physMemPtr[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> physMemPtr_V_tmp_mem;
							physMemPtr_V_tmp_mem = (physMemPtr[i_0]).to_string(2).c_str();
							physMemPtr_V_tvin_wrapc_buffer[hls_map_index].range(31, 0) = physMemPtr_V_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 32; i++)
		{
			sprintf(tvin_physMemPtr_V, "%s\n", (physMemPtr_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_physMemPtr_V, tvin_physMemPtr_V);
		}

		tcl_file.set_num(32, &tcl_file.physMemPtr_V_depth);
		sprintf(tvin_physMemPtr_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_physMemPtr_V, tvin_physMemPtr_V);

		// release memory allocation
		delete [] physMemPtr_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_basePhysAddr_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_basePhysAddr_V, tvin_basePhysAddr_V);

		sc_bv<32> basePhysAddr_V_tvin_wrapc_buffer;

		// RTL Name: basePhysAddr_V
		{
			// bitslice(31, 0)
			{
				// celement: basePhysAddr.V(31, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : basePhysAddr
						// sub_1st_elem          : 
						// ori_name_1st_elem     : basePhysAddr
						// regulate_c_name       : basePhysAddr_V
						// input_type_conversion : (basePhysAddr).to_string(2).c_str()
						if (&(basePhysAddr) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> basePhysAddr_V_tmp_mem;
							basePhysAddr_V_tmp_mem = (basePhysAddr).to_string(2).c_str();
							basePhysAddr_V_tvin_wrapc_buffer.range(31, 0) = basePhysAddr_V_tmp_mem.range(31, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_basePhysAddr_V, "%s\n", (basePhysAddr_V_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_basePhysAddr_V, tvin_basePhysAddr_V);
		}

		tcl_file.set_num(1, &tcl_file.basePhysAddr_V_depth);
		sprintf(tvin_basePhysAddr_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_basePhysAddr_V, tvin_basePhysAddr_V);

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		bypass(physMemPtr, basePhysAddr);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_physMemPtr_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_physMemPtr_V, tvout_physMemPtr_V);

		sc_bv<32>* physMemPtr_V_tvout_wrapc_buffer = new sc_bv<32>[32];

		// RTL Name: physMemPtr_V
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: physMemPtr.V(31, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : physMemPtr[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : physMemPtr[0]
						// regulate_c_name       : physMemPtr_V
						// input_type_conversion : (physMemPtr[i_0]).to_string(2).c_str()
						if (&(physMemPtr[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> physMemPtr_V_tmp_mem;
							physMemPtr_V_tmp_mem = (physMemPtr[i_0]).to_string(2).c_str();
							physMemPtr_V_tvout_wrapc_buffer[hls_map_index].range(31, 0) = physMemPtr_V_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 32; i++)
		{
			sprintf(tvout_physMemPtr_V, "%s\n", (physMemPtr_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_physMemPtr_V, tvout_physMemPtr_V);
		}

		tcl_file.set_num(32, &tcl_file.physMemPtr_V_depth);
		sprintf(tvout_physMemPtr_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_physMemPtr_V, tvout_physMemPtr_V);

		// release memory allocation
		delete [] physMemPtr_V_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "physMemPtr_V"
		delete [] tvin_physMemPtr_V;
		delete [] tvout_physMemPtr_V;
		// release memory allocation: "basePhysAddr_V"
		delete [] tvin_basePhysAddr_V;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

