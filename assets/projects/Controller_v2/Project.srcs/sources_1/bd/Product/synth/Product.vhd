--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
--Date        : Fri Apr 12 16:42:10 2019
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
    SS : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Product : entity is "Product,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Product,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Product : entity is "Product.hwdef";
end Product;

architecture STRUCTURE of Product is
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
    hall_i_1 : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Product_CONTROLLER_0_0;
  signal CONTROLLER_0_CE_M0T0 : STD_LOGIC;
  signal CONTROLLER_0_CE_M0T1 : STD_LOGIC;
  signal CONTROLLER_0_MOT0_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal CONTROLLER_0_MOT1_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal CONTROLLER_0_led : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal CONTROLLER_0_miso : STD_LOGIC;
  signal ENC0_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ENC1_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal hall_i_0_0_1 : STD_LOGIC;
  signal hall_i_1_0_1 : STD_LOGIC;
  signal mosi_0_1 : STD_LOGIC;
  signal sck_0_1 : STD_LOGIC;
  signal ss_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK_100MHZ : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK_100MHZ : signal is "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN Product_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
begin
  CE_MOT0 <= CONTROLLER_0_CE_M0T0;
  CE_MOT1 <= CONTROLLER_0_CE_M0T1;
  ENC0_0_1(1 downto 0) <= ENC0(1 downto 0);
  ENC1_0_1(1 downto 0) <= ENC1(1 downto 0);
  MISO <= CONTROLLER_0_miso;
  MOT0(1 downto 0) <= CONTROLLER_0_MOT0_out(1 downto 0);
  MOT1(1 downto 0) <= CONTROLLER_0_MOT1_out(1 downto 0);
  clk_0_1 <= CLK_100MHZ;
  hall_i_0_0_1 <= HALL0;
  hall_i_1_0_1 <= HALL1;
  led(7 downto 0) <= CONTROLLER_0_led(7 downto 0);
  mosi_0_1 <= MOSI;
  sck_0_1 <= SCK;
  ss_0_1 <= SS;
CONTROLLER_0: component Product_CONTROLLER_0_0
     port map (
      CE_MOT0 => CONTROLLER_0_CE_M0T0,
      CE_MOT1 => CONTROLLER_0_CE_M0T1,
      ENC0(1 downto 0) => ENC0_0_1(1 downto 0),
      ENC1(1 downto 0) => ENC1_0_1(1 downto 0),
      MOT0_out(1 downto 0) => CONTROLLER_0_MOT0_out(1 downto 0),
      MOT1_out(1 downto 0) => CONTROLLER_0_MOT1_out(1 downto 0),
      clk => clk_0_1,
      hall_i_0 => hall_i_0_0_1,
      hall_i_1 => hall_i_1_0_1,
      led(7 downto 0) => CONTROLLER_0_led(7 downto 0),
      miso => CONTROLLER_0_miso,
      mosi => mosi_0_1,
      sck => sck_0_1,
      ss => ss_0_1
    );
end STRUCTURE;
