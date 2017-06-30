-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Wed May 31 23:12:53 2017
-- Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/vivado/All_adder/All_adder.srcs/sources_1/bd/all_adder/ip/all_adder_OR1_0_1/all_adder_OR1_0_1_stub.vhdl
-- Design      : all_adder_OR1_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity all_adder_OR1_0_1 is
  Port ( 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    F : out STD_LOGIC
  );

end all_adder_OR1_0_1;

architecture stub of all_adder_OR1_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A,B,F";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "OR1,Vivado 2017.1";
begin
end;
