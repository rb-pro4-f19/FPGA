--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
--Date        : Mon Apr  8 10:09:23 2019
--Host        : daniel-XPS-15-9570 running 64-bit Ubuntu 18.04.2 LTS
--Command     : generate_target Product_wrapper.bd
--Design      : Product_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Product_wrapper is
  port (
    CE_MOT0 : out STD_LOGIC;
    CE_MOT1 : out STD_LOGIC;
    ENC0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MOT0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MOT1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    miso : out STD_LOGIC;
    mosi : in STD_LOGIC;
    sck : in STD_LOGIC;
    ss : in STD_LOGIC
  );
end Product_wrapper;

architecture STRUCTURE of Product_wrapper is
  component Product is
  port (
    clk : in STD_LOGIC;
    sck : in STD_LOGIC;
    CE_MOT0 : out STD_LOGIC;
    CE_MOT1 : out STD_LOGIC;
    MOT0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MOT1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    miso : out STD_LOGIC;
    mosi : in STD_LOGIC;
    ss : in STD_LOGIC;
    ENC0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Product;
begin
Product_i: component Product
     port map (
      CE_MOT0 => CE_MOT0,
      CE_MOT1 => CE_MOT1,
      ENC0(1 downto 0) => ENC0(1 downto 0),
      MOT0(1 downto 0) => MOT0(1 downto 0),
      MOT1(1 downto 0) => MOT1(1 downto 0),
      clk => clk,
      miso => miso,
      mosi => mosi,
      sck => sck,
      ss => ss
    );
end STRUCTURE;
