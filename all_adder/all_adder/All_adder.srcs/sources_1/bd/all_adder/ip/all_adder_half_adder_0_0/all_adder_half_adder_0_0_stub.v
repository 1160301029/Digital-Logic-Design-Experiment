// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Wed May 31 19:13:43 2017
// Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivado/All_adder/All_adder.srcs/sources_1/bd/all_adder/ip/all_adder_half_adder_0_0/all_adder_half_adder_0_0_stub.v
// Design      : all_adder_half_adder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "half_adder,Vivado 2017.1" *)
module all_adder_half_adder_0_0(A, B, Ci, S)
/* synthesis syn_black_box black_box_pad_pin="A,B,Ci,S" */;
  input A;
  input B;
  output Ci;
  output S;
endmodule
