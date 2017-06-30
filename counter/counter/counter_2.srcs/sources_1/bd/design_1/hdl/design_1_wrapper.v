//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Thu Jun  8 10:31:17 2017
//Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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

  wire A0;
  wire A1;
  wire A2;
  wire A3;
  wire CLK;
  wire N;
  wire clr;

  design_1 design_1_i
       (.A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .CLK(CLK),
        .N(N),
        .clr(clr));
endmodule
