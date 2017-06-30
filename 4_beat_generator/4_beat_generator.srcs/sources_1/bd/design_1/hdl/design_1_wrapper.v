//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
//Date        : Wed Jun 07 18:58:27 2017
//Host        : LAPTOP-LN6PBA3E running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK,
    CLRN,
    Q0,
    Q1,
    Q2,
    Q3);
  input CLK;
  input CLRN;
  output Q0;
  output Q1;
  output Q2;
  output Q3;

  wire CLK;
  wire CLRN;
  wire Q0;
  wire Q1;
  wire Q2;
  wire Q3;

design_1 design_1_i
       (.CLK(CLK),
        .CLRN(CLRN),
        .Q0(Q0),
        .Q1(Q1),
        .Q2(Q2),
        .Q3(Q3));
endmodule
