-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Wed May 31 23:12:53 2017
-- Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/vivado/All_adder/All_adder.srcs/sources_1/bd/all_adder/ip/all_adder_OR1_0_1/all_adder_OR1_0_1_sim_netlist.vhdl
-- Design      : all_adder_OR1_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity all_adder_OR1_0_1 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    F : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of all_adder_OR1_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of all_adder_OR1_0_1 : entity is "all_adder_OR1_0_1,OR1,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of all_adder_OR1_0_1 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of all_adder_OR1_0_1 : entity is "OR1,Vivado 2017.1";
end all_adder_OR1_0_1;

architecture STRUCTURE of all_adder_OR1_0_1 is
begin
F_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => A,
      I1 => B,
      O => F
    );
end STRUCTURE;
