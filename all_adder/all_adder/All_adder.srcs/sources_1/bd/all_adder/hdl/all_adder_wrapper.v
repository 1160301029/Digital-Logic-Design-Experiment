//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Thu Jun  1 10:31:36 2017
//Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
//Command     : generate_target all_adder_wrapper.bd
//Design      : all_adder_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module all_adder_wrapper
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

  wire A;
  wire B;
  wire C;
  wire Ci;
  wire S;

  all_adder all_adder_i
       (.A(A),
        .B(B),
        .C(C),
        .Ci(Ci),
        .S(S));
endmodule
