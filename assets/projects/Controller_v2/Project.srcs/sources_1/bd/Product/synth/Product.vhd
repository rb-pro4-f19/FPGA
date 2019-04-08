--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
--Date        : Mon Apr  8 10:09:23 2019
--Host        : daniel-XPS-15-9570 running 64-bit Ubuntu 18.04.2 LTS
--Command     : generate_target Product.bd
--Design      : Product
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Product is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Product : entity is "Product,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Product,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Product : entity is "Product.hwdef";
end Product;

architecture STRUCTURE of Product is
  component Product_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Product_xlconstant_0_0;
  component Product_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Product_xlconstant_0_2;
  component Product_CONTROLLER_0_0 is
  port (
    clk : in STD_LOGIC;
    sck : in STD_LOGIC;
    ss : in STD_LOGIC;
    mosi : in STD_LOGIC;
    miso : out STD_LOGIC;
    CE_MOT0 : out STD_LOGIC;
    CE_MOT1 : out STD_LOGIC;
    MOT0_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MOT1_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ENC0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ENC1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    hall_i_0 : in STD_LOGIC;
    hall_i_1 : in STD_LOGIC
  );
  end component Product_CONTROLLER_0_0;
  signal CONTROLLER_0_CE_M0T0 : STD_LOGIC;
  signal CONTROLLER_0_CE_M0T1 : STD_LOGIC;
  signal CONTROLLER_0_MOT0_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal CONTROLLER_0_MOT1_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal CONTROLLER_0_miso : STD_LOGIC;
  signal ENC0_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal mosi_0_1 : STD_LOGIC;
  signal sck_0_1 : STD_LOGIC;
  signal ss_0_1 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN Product_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
begin
  CE_MOT0 <= CONTROLLER_0_CE_M0T0;
  CE_MOT1 <= CONTROLLER_0_CE_M0T1;
  ENC0_0_1(1 downto 0) <= ENC0(1 downto 0);
  MOT0(1 downto 0) <= CONTROLLER_0_MOT0_out(1 downto 0);
  MOT1(1 downto 0) <= CONTROLLER_0_MOT1_out(1 downto 0);
  clk_0_1 <= clk;
  miso <= CONTROLLER_0_miso;
  mosi_0_1 <= mosi;
  sck_0_1 <= sck;
  ss_0_1 <= ss;
CONTROLLER_0: component Product_CONTROLLER_0_0
     port map (
      CE_MOT0 => CONTROLLER_0_CE_M0T0,
      CE_MOT1 => CONTROLLER_0_CE_M0T1,
      ENC0(1 downto 0) => ENC0_0_1(1 downto 0),
      ENC1(1 downto 0) => xlconstant_1_dout(1 downto 0),
      MOT0_out(1 downto 0) => CONTROLLER_0_MOT0_out(1 downto 0),
      MOT1_out(1 downto 0) => CONTROLLER_0_MOT1_out(1 downto 0),
      clk => clk_0_1,
      hall_i_0 => xlconstant_0_dout(0),
      hall_i_1 => xlconstant_0_dout(0),
      miso => CONTROLLER_0_miso,
      mosi => mosi_0_1,
      sck => sck_0_1,
      ss => ss_0_1
    );
xlconstant_0: component Product_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
xlconstant_1: component Product_xlconstant_0_2
     port map (
      dout(1 downto 0) => xlconstant_1_dout(1 downto 0)
    );
end STRUCTURE;
