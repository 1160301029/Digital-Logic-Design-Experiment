-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Wed May 31 19:13:43 2017
-- Host        : DESKTOP-E9M1FAE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/vivado/All_adder/All_adder.srcs/sources_1/bd/all_adder/ip/all_adder_half_adder_1_0/all_adder_half_adder_1_0_sim_netlist.vhdl
-- Design      : all_adder_half_adder_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity all_adder_half_adder_1_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Ci : out STD_LOGIC;
    S : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of all_adder_half_adder_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of all_adder_half_adder_1_0 : entity is "all_adder_half_adder_1_0,half_adder,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of all_adder_half_adder_1_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of all_adder_half_adder_1_0 : entity is "half_adder,Vivado 2017.1";
end all_adder_half_adder_1_0;

architecture STRUCTURE of all_adder_half_adder_1_0 is
begin
Ci_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A,
      I1 => B,
      O => Ci
    );
S_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B,
      I1 => A,
      O => S
    );
end STRUCTURE;
