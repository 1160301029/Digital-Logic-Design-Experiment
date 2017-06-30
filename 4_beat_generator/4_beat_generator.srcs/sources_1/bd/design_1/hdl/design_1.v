//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
//Date        : Wed Jun 07 18:58:27 2017
//Host        : LAPTOP-LN6PBA3E running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1
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

  wire CLK_1;
  wire CLRN_1;
  wire D_trigger_0_Q;
  wire D_trigger_1_Q;
  wire D_trigger_2_Q;
  wire D_trigger_3_Q;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_1_Res;
  wire [0:0]util_vector_logic_2_Res;

  assign CLK_1 = CLK;
  assign CLRN_1 = CLRN;
  assign Q0 = D_trigger_0_Q;
  assign Q1 = D_trigger_1_Q;
  assign Q2 = D_trigger_2_Q;
  assign Q3 = D_trigger_3_Q;
design_1_D_trigger_0_0 D_trigger_0
       (.CLK(CLK_1),
        .CLRN(CLRN_1),
        .D(D_trigger_1_Q),
        .Q(D_trigger_0_Q));
design_1_D_trigger_1_0 D_trigger_1
       (.CLK(CLK_1),
        .CLRN(CLRN_1),
        .D(D_trigger_2_Q),
        .Q(D_trigger_1_Q));
design_1_D_trigger_2_0 D_trigger_2
       (.CLK(CLK_1),
        .CLRN(CLRN_1),
        .D(D_trigger_3_Q),
        .Q(D_trigger_2_Q));
design_1_D_trigger_3_0 D_trigger_3
       (.CLK(CLK_1),
        .CLRN(CLRN_1),
        .D(util_vector_logic_1_Res),
        .Q(D_trigger_3_Q));
design_1_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(D_trigger_3_Q),
        .Op2(util_vector_logic_2_Res),
        .Res(util_vector_logic_0_Res));
design_1_util_vector_logic_1_0 util_vector_logic_1
       (.Op1(util_vector_logic_0_Res),
        .Res(util_vector_logic_1_Res));
design_1_util_vector_logic_2_0 util_vector_logic_2
       (.Op1(D_trigger_2_Q),
        .Op2(D_trigger_1_Q),
        .Res(util_vector_logic_2_Res));
endmodule
