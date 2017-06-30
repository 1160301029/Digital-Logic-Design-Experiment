//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Thu Jun  8 10:31:17 2017
//Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (A0,
    A1,
    A2,
    A3,
    CLK,
    N,
    clr);
  output A0;
  output A1;
  output A2;
  output A3;
  input CLK;
  input N;
  input clr;

  wire AND_0_F;
  wire AND_1_F;
  wire AND_2_F;
  wire AND_3_F;
  wire AND_4_F;
  wire CLK_1;
  wire JK_f_f_0_Q;
  wire JK_f_f_0_Qb;
  wire JK_f_f_1_Q;
  wire JK_f_f_2_Q;
  wire JK_f_f_3_Q;
  wire N_1;
  wire clr_1;

  assign A0 = JK_f_f_0_Q;
  assign A1 = JK_f_f_1_Q;
  assign A2 = JK_f_f_2_Q;
  assign A3 = JK_f_f_3_Q;
  assign CLK_1 = CLK;
  assign N_1 = N;
  assign clr_1 = clr;
  design_1_AND_0_0 AND_0
       (.A(JK_f_f_3_Q),
        .B(JK_f_f_2_Q),
        .F(AND_0_F));
  design_1_AND_1_0 AND_1
       (.A(JK_f_f_3_Q),
        .B(JK_f_f_2_Q),
        .F(AND_1_F));
  design_1_AND_2_0 AND_2
       (.A(AND_1_F),
        .B(JK_f_f_1_Q),
        .F(AND_2_F));
  design_1_AND_3_0 AND_3
       (.A(AND_4_F),
        .B(JK_f_f_0_Qb),
        .F(AND_3_F));
  design_1_AND_4_0 AND_4
       (.A(JK_f_f_3_Q),
        .B(JK_f_f_2_Q),
        .F(AND_4_F));
  design_1_JK_f_f_0_0 JK_f_f_0
       (.J(AND_2_F),
        .K(AND_0_F),
        .Q(JK_f_f_0_Q),
        .Qb(JK_f_f_0_Qb),
        .clk(CLK_1),
        .clr(clr_1));
  design_1_JK_f_f_1_0 JK_f_f_1
       (.J(AND_3_F),
        .K(AND_0_F),
        .Q(JK_f_f_1_Q),
        .clk(CLK_1),
        .clr(clr_1));
  design_1_JK_f_f_2_0 JK_f_f_2
       (.J(JK_f_f_3_Q),
        .K(JK_f_f_3_Q),
        .Q(JK_f_f_2_Q),
        .clk(CLK_1),
        .clr(clr_1));
  design_1_JK_f_f_3_0 JK_f_f_3
       (.J(N_1),
        .K(N_1),
        .Q(JK_f_f_3_Q),
        .clk(CLK_1),
        .clr(clr_1));
endmodule
