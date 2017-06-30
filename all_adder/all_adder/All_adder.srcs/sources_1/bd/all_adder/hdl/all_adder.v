//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Thu Jun  1 10:31:36 2017
//Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
//Command     : generate_target all_adder.bd
//Design      : all_adder
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "all_adder,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=all_adder,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "all_adder.hwdef" *) 
module all_adder
   (A,
    B,
    C,
    Ci,
    S);
  input A;
  input B;
  output C;
  input Ci;
  output S;

  wire A_1;
  wire B_1;
  wire Ci_1;
  wire OR1_0_F;
  wire half_adder_0_Ci;
  wire half_adder_0_S;
  wire half_adder_1_Ci;
  wire half_adder_1_S;

  assign A_1 = A;
  assign B_1 = B;
  assign C = OR1_0_F;
  assign Ci_1 = Ci;
  assign S = half_adder_0_S;
  all_adder_OR1_0_1 OR1_0
       (.A(half_adder_1_Ci),
        .B(half_adder_0_Ci),
        .F(OR1_0_F));
  all_adder_half_adder_0_0 half_adder_0
       (.A(Ci_1),
        .B(half_adder_1_S),
        .Ci(half_adder_0_Ci),
        .S(half_adder_0_S));
  all_adder_half_adder_1_0 half_adder_1
       (.A(A_1),
        .B(B_1),
        .Ci(half_adder_1_Ci),
        .S(half_adder_1_S));
endmodule
