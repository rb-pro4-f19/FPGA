--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
--Date        : Wed Apr 10 17:18:46 2019
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
    CLK_100MHZ : in STD_LOGIC;
    ENC0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ENC1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HALL0 : in STD_LOGIC;
    HALL1 : in STD_LOGIC;
    MISO : out STD_LOGIC;
    MOSI : in STD_LOGIC;
    MOT0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MOT1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SCK : in STD_LOGIC;
    SS : in STD_LOGIC
  );
end Product_wrapper;

architecture STRUCTURE of Product_wrapper is
  component Product is
  port (
    CE_MOT0 : out STD_LOGIC;
    CE_MOT1 : out STD_LOGIC;
    MOT0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MOT1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ENC0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HALL0 : in STD_LOGIC;
    ENC1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HALL1 : in STD_LOGIC;
    SCK : in STD_LOGIC;
    MISO : out STD_LOGIC;
    SS : in STD_LOGIC;
    MOSI : in STD_LOGIC;
    CLK_100MHZ : in STD_LOGIC
  );
  end component Product;
begin
Product_i: component Product
     port map (
      CE_MOT0 => CE_MOT0,
      CE_MOT1 => CE_MOT1,
      CLK_100MHZ => CLK_100MHZ,
      ENC0(1 downto 0) => ENC0(1 downto 0),
      ENC1(1 downto 0) => ENC1(1 downto 0),
      HALL0 => HALL0,
      HALL1 => HALL1,
      MISO => MISO,
      MOSI => MOSI,
      MOT0(1 downto 0) => MOT0(1 downto 0),
      MOT1(1 downto 0) => MOT1(1 downto 0),
      SCK => SCK,
      SS => SS
    );
end STRUCTURE;
