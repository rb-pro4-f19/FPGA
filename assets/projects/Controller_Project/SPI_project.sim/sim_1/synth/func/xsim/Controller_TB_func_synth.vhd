-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Wed Mar 13 21:16:29 2019
-- Host        : daniel-XPS-15-9570 running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/daniel/SPI_project/SPI_project.sim/sim_1/synth/func/xsim/Controller_TB_func_synth.vhd
-- Design      : CONTROLLER
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SPI_checksum is
  port (
    b_check_ready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    b_spi_sleep_reg_i_5 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    b_ready_reg_0 : out STD_LOGIC;
    \b_segment_reg[3]_i_1_0\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    b_start : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \b_shift_reg[15]_i_5\ : in STD_LOGIC
  );
end SPI_checksum;

architecture STRUCTURE of SPI_checksum is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^b_check_ready\ : STD_LOGIC;
  signal b_checksum : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \b_checksum_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \b_checksum_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal b_data : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal \b_data_controller_o_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \b_data_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal b_ready_reg_i_1_n_0 : STD_LOGIC;
  signal b_ready_reg_i_2_n_0 : STD_LOGIC;
  signal b_ready_reg_i_3_n_0 : STD_LOGIC;
  signal b_ready_reg_i_6_n_0 : STD_LOGIC;
  signal b_ready_reg_i_7_n_0 : STD_LOGIC;
  signal b_ready_reg_i_8_n_0 : STD_LOGIC;
  signal b_ready_reg_i_9_n_0 : STD_LOGIC;
  signal b_segment : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \b_segment_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \b_segment_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \b_segment_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \b_segment_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \b_segment_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \b_segment_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \b_segment_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \b_segment_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \checksum_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \checksum_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \checksum_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \checksum_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \checksum_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \checksum_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \state__6\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal state_begin : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state_begin_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \state_begin_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \state_begin_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \state_begin_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \state_begin_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \state_begin_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \state_begin_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal state_it : STD_LOGIC;
  signal state_it_reg_i_1_n_0 : STD_LOGIC;
  signal state_it_reg_i_2_n_0 : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \b_checksum_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_checksum_reg[1]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \b_checksum_reg[1]_i_2\ : label is "soft_lutpair8";
  attribute XILINX_LEGACY_PRIM of \b_checksum_reg[2]\ : label is "LD";
  attribute SOFT_HLUTNM of \b_checksum_reg[2]_i_2\ : label is "soft_lutpair8";
  attribute XILINX_LEGACY_PRIM of \b_checksum_reg[3]\ : label is "LD";
  attribute SOFT_HLUTNM of \b_checksum_reg[3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[3]_i_1\ : label is "soft_lutpair6";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[15]\ : label is "LD";
  attribute SOFT_HLUTNM of \b_data_reg[15]_i_1\ : label is "soft_lutpair4";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_reg[9]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of b_ready_reg : label is "LD";
  attribute SOFT_HLUTNM of b_ready_reg_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of b_ready_reg_i_3 : label is "soft_lutpair3";
  attribute XILINX_LEGACY_PRIM of \b_segment_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_segment_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_segment_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_segment_reg[3]\ : label is "LD";
  attribute SOFT_HLUTNM of \b_segment_reg[3]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \b_segment_reg[3]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \b_shift_reg[15]_i_10\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \b_shift_reg[15]_i_4\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of \checksum_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \checksum_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \checksum_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \checksum_reg[3]\ : label is "LD";
  attribute SOFT_HLUTNM of \checksum_reg[3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \checksum_reg[3]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \checksum_reg[3]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \checksum_reg[3]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \checksum_reg[3]_i_6\ : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM of \state_begin_reg[0]\ : label is "LD";
  attribute SOFT_HLUTNM of \state_begin_reg[0]_i_2\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of \state_begin_reg[1]\ : label is "LD";
  attribute SOFT_HLUTNM of \state_begin_reg[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \state_begin_reg[1]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \state_begin_reg[1]_i_4\ : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM of state_it_reg : label is "LD";
  attribute SOFT_HLUTNM of state_it_reg_i_2 : label is "soft_lutpair10";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
  b_check_ready <= \^b_check_ready\;
\b_checksum_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_checksum_reg[0]_i_1_n_0\,
      G => \b_checksum_reg[3]_i_2_n_0\,
      GE => '1',
      Q => b_checksum(0)
    );
\b_checksum_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0066000000F00000"
    )
        port map (
      I0 => b_checksum(0),
      I1 => b_segment(0),
      I2 => b_checksum(1),
      I3 => state_begin(1),
      I4 => state_begin(0),
      I5 => state_it,
      O => \b_checksum_reg[0]_i_1_n_0\
    );
\b_checksum_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_checksum_reg[1]_i_1_n_0\,
      G => \b_checksum_reg[3]_i_2_n_0\,
      GE => '1',
      Q => b_checksum(1)
    );
\b_checksum_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96960000FF000000"
    )
        port map (
      I0 => \b_checksum_reg[1]_i_2_n_0\,
      I1 => b_segment(1),
      I2 => b_checksum(1),
      I3 => b_checksum(2),
      I4 => state_it_reg_i_2_n_0,
      I5 => state_it,
      O => \b_checksum_reg[1]_i_1_n_0\
    );
\b_checksum_reg[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => b_segment(0),
      I1 => b_checksum(0),
      O => \b_checksum_reg[1]_i_2_n_0\
    );
\b_checksum_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_checksum_reg[2]_i_1_n_0\,
      G => \b_checksum_reg[3]_i_2_n_0\,
      GE => '1',
      Q => b_checksum(2)
    );
\b_checksum_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96960000FF000000"
    )
        port map (
      I0 => \b_checksum_reg[2]_i_2_n_0\,
      I1 => b_segment(2),
      I2 => b_checksum(2),
      I3 => b_checksum(3),
      I4 => state_it_reg_i_2_n_0,
      I5 => state_it,
      O => \b_checksum_reg[2]_i_1_n_0\
    );
\b_checksum_reg[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => b_segment(0),
      I1 => b_checksum(0),
      I2 => b_checksum(1),
      I3 => b_segment(1),
      O => \b_checksum_reg[2]_i_2_n_0\
    );
\b_checksum_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_checksum_reg[3]_i_1_n_0\,
      G => \b_checksum_reg[3]_i_2_n_0\,
      GE => '1',
      Q => b_checksum(3)
    );
\b_checksum_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96960000FF000000"
    )
        port map (
      I0 => \b_checksum_reg[3]_i_3_n_0\,
      I1 => b_segment(3),
      I2 => b_checksum(3),
      I3 => b_checksum(0),
      I4 => state_it_reg_i_2_n_0,
      I5 => state_it,
      O => \b_checksum_reg[3]_i_1_n_0\
    );
\b_checksum_reg[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \b_data_reg[15]_i_1_n_0\,
      I1 => state_begin(1),
      I2 => state_begin(0),
      O => \b_checksum_reg[3]_i_2_n_0\
    );
\b_checksum_reg[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEE888E8888888"
    )
        port map (
      I0 => b_segment(2),
      I1 => b_checksum(2),
      I2 => b_segment(0),
      I3 => b_checksum(0),
      I4 => b_checksum(1),
      I5 => b_segment(1),
      O => \b_checksum_reg[3]_i_3_n_0\
    );
\b_data_controller_o_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \b_segment_reg[3]_i_1_0\(3),
      I2 => \b_data_controller_o_reg[3]_i_3_n_0\,
      I3 => \b_segment_reg[3]_i_1_0\(0),
      O => D(0)
    );
\b_data_controller_o_reg[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF6F"
    )
        port map (
      I0 => \^q\(3),
      I1 => \b_segment_reg[3]_i_1_0\(3),
      I2 => \b_data_controller_o_reg[3]_i_3_n_0\,
      I3 => \b_segment_reg[3]_i_1_0\(1),
      O => D(1)
    );
\b_data_controller_o_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \b_segment_reg[3]_i_1_0\(3),
      I2 => \b_data_controller_o_reg[3]_i_3_n_0\,
      I3 => \b_segment_reg[3]_i_1_0\(2),
      O => D(2)
    );
\b_data_controller_o_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \b_segment_reg[3]_i_1_0\(3),
      I2 => \b_data_controller_o_reg[3]_i_3_n_0\,
      O => D(3)
    );
\b_data_controller_o_reg[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \b_segment_reg[3]_i_1_0\(0),
      I2 => \b_segment_reg[3]_i_1_0\(2),
      I3 => \^q\(2),
      I4 => \b_segment_reg[3]_i_1_0\(1),
      I5 => \^q\(1),
      O => \b_data_controller_o_reg[3]_i_3_n_0\
    );
\b_data_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(10),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(10)
    );
\b_data_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(11),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(11)
    );
\b_data_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(12),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(12)
    );
\b_data_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(13),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(13)
    );
\b_data_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(14),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(14)
    );
\b_data_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(15),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(15)
    );
\b_data_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000F4F"
    )
        port map (
      I0 => \checksum_reg[3]_i_5_n_0\,
      I1 => \state__6\(0),
      I2 => b_ready_reg_i_6_n_0,
      I3 => \state__6\(1),
      I4 => b_ready_reg_i_1_n_0,
      O => \b_data_reg[15]_i_1_n_0\
    );
\b_data_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(4),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(4)
    );
\b_data_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(5),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(5)
    );
\b_data_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(6),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(6)
    );
\b_data_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(7),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(7)
    );
\b_data_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(8),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(8)
    );
\b_data_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_0\(9),
      G => \b_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => b_data(9)
    );
b_ready_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '1'
    )
        port map (
      CLR => '0',
      D => b_ready_reg_i_1_n_0,
      G => b_ready_reg_i_2_n_0,
      GE => '1',
      Q => \^b_check_ready\
    );
b_ready_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^b_check_ready\,
      I1 => b_start,
      O => b_ready_reg_i_1_n_0
    );
b_ready_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AABFFFFFFFFF"
    )
        port map (
      I0 => b_ready_reg_i_3_n_0,
      I1 => \^b_check_ready\,
      I2 => b_start,
      I3 => \state__6\(0),
      I4 => \state__6\(1),
      I5 => b_ready_reg_i_6_n_0,
      O => b_ready_reg_i_2_n_0
    );
b_ready_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF4040"
    )
        port map (
      I0 => state_begin(0),
      I1 => state_begin(1),
      I2 => \state__6\(0),
      I3 => b_ready_reg_i_7_n_0,
      I4 => \state__6\(1),
      O => b_ready_reg_i_3_n_0
    );
b_ready_reg_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEFAAAA00000000"
    )
        port map (
      I0 => b_ready_reg_i_8_n_0,
      I1 => state_begin(0),
      I2 => state_begin(1),
      I3 => \state__6\(1),
      I4 => \state__6\(0),
      I5 => b_ready_reg_i_6_n_0,
      O => \state__6\(0)
    );
b_ready_reg_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAF88888"
    )
        port map (
      I0 => \state__6\(1),
      I1 => b_ready_reg_i_9_n_0,
      I2 => \checksum_reg[3]_i_6_n_0\,
      I3 => b_ready_reg_i_7_n_0,
      I4 => \checksum_reg[3]_i_2_n_0\,
      O => \state__6\(1)
    );
b_ready_reg_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFEFEF"
    )
        port map (
      I0 => \state__6\(1),
      I1 => b_ready_reg_i_9_n_0,
      I2 => b_ready_reg_i_6_n_0,
      I3 => \checksum_reg[3]_i_1_n_0\,
      I4 => \state__6\(0),
      O => b_ready_reg_i_6_n_0
    );
b_ready_reg_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF993C3333"
    )
        port map (
      I0 => b_ready_reg_i_7_n_0,
      I1 => \checksum_reg[3]_i_5_n_0\,
      I2 => b_ready_reg_i_1_n_0,
      I3 => \state__6\(1),
      I4 => b_ready_reg_i_6_n_0,
      I5 => \checksum_reg[3]_i_3_n_0\,
      O => b_ready_reg_i_7_n_0
    );
b_ready_reg_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEAEAAEAEE"
    )
        port map (
      I0 => \checksum_reg[3]_i_6_n_0\,
      I1 => \state__6\(1),
      I2 => state_begin(0),
      I3 => state_begin(1),
      I4 => \checksum_reg[3]_i_4_n_0\,
      I5 => \checksum_reg[3]_i_3_n_0\,
      O => b_ready_reg_i_8_n_0
    );
b_ready_reg_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF737F7F7F"
    )
        port map (
      I0 => b_ready_reg_i_7_n_0,
      I1 => b_ready_reg_i_6_n_0,
      I2 => \state__6\(1),
      I3 => \^b_check_ready\,
      I4 => b_start,
      I5 => \checksum_reg[3]_i_5_n_0\,
      O => b_ready_reg_i_9_n_0
    );
\b_segment_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[0]_i_1_n_0\,
      G => \state_begin_reg[0]_i_1_n_0\,
      GE => '1',
      Q => b_segment(0)
    );
\b_segment_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \b_segment_reg[3]_i_2_n_0\,
      I1 => b_data(12),
      I2 => \b_segment_reg[3]_i_3_n_0\,
      I3 => b_data(8),
      I4 => b_data(4),
      I5 => \b_segment_reg[3]_i_4_n_0\,
      O => \b_segment_reg[0]_i_1_n_0\
    );
\b_segment_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[1]_i_1_n_0\,
      G => \state_begin_reg[0]_i_1_n_0\,
      GE => '1',
      Q => b_segment(1)
    );
\b_segment_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \b_segment_reg[3]_i_2_n_0\,
      I1 => b_data(13),
      I2 => \b_segment_reg[3]_i_3_n_0\,
      I3 => b_data(9),
      I4 => b_data(5),
      I5 => \b_segment_reg[3]_i_4_n_0\,
      O => \b_segment_reg[1]_i_1_n_0\
    );
\b_segment_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[2]_i_1_n_0\,
      G => \state_begin_reg[0]_i_1_n_0\,
      GE => '1',
      Q => b_segment(2)
    );
\b_segment_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \b_segment_reg[3]_i_2_n_0\,
      I1 => b_data(14),
      I2 => \b_segment_reg[3]_i_3_n_0\,
      I3 => b_data(10),
      I4 => b_data(6),
      I5 => \b_segment_reg[3]_i_4_n_0\,
      O => \b_segment_reg[2]_i_1_n_0\
    );
\b_segment_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \b_segment_reg[3]_i_1_n_0\,
      G => \state_begin_reg[0]_i_1_n_0\,
      GE => '1',
      Q => b_segment(3)
    );
\b_segment_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \b_segment_reg[3]_i_2_n_0\,
      I1 => b_data(15),
      I2 => \b_segment_reg[3]_i_3_n_0\,
      I3 => b_data(11),
      I4 => b_data(7),
      I5 => \b_segment_reg[3]_i_4_n_0\,
      O => \b_segment_reg[3]_i_1_n_0\
    );
\b_segment_reg[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFEFFFF0F0EFFFF"
    )
        port map (
      I0 => \checksum_reg[3]_i_4_n_0\,
      I1 => \state__6\(0),
      I2 => \state__6\(1),
      I3 => \checksum_reg[3]_i_5_n_0\,
      I4 => b_ready_reg_i_6_n_0,
      I5 => b_ready_reg_i_8_n_0,
      O => \b_segment_reg[3]_i_2_n_0\
    );
\b_segment_reg[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => b_ready_reg_i_3_n_0,
      I1 => \state__6\(1),
      I2 => b_ready_reg_i_6_n_0,
      O => \b_segment_reg[3]_i_3_n_0\
    );
\b_segment_reg[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A108A0000000000"
    )
        port map (
      I0 => \state__6\(1),
      I1 => state_begin(0),
      I2 => state_begin(1),
      I3 => \b_segment_reg[3]_i_5_n_0\,
      I4 => b_ready_reg_i_8_n_0,
      I5 => b_ready_reg_i_6_n_0,
      O => \b_segment_reg[3]_i_4_n_0\
    );
\b_segment_reg[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBB8B8B8"
    )
        port map (
      I0 => b_ready_reg_i_7_n_0,
      I1 => \state__6\(1),
      I2 => \state__6\(0),
      I3 => b_start,
      I4 => \^b_check_ready\,
      O => \b_segment_reg[3]_i_5_n_0\
    );
\b_shift_reg[15]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000B0"
    )
        port map (
      I0 => b_start,
      I1 => \^b_check_ready\,
      I2 => state(0),
      I3 => state(1),
      I4 => \b_shift_reg[15]_i_5\,
      O => b_spi_sleep_reg_i_5
    );
\b_shift_reg[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => b_start,
      I1 => \^b_check_ready\,
      O => b_ready_reg_0
    );
\checksum_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(0),
      G => \checksum_reg[3]_i_1_n_0\,
      GE => '1',
      Q => \^q\(0)
    );
\checksum_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(1),
      G => \checksum_reg[3]_i_1_n_0\,
      GE => '1',
      Q => \^q\(1)
    );
\checksum_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(2),
      G => \checksum_reg[3]_i_1_n_0\,
      GE => '1',
      Q => \^q\(2)
    );
\checksum_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(3),
      G => \checksum_reg[3]_i_1_n_0\,
      GE => '1',
      Q => \^q\(3)
    );
\checksum_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8AA80000"
    )
        port map (
      I0 => \checksum_reg[3]_i_2_n_0\,
      I1 => \checksum_reg[3]_i_3_n_0\,
      I2 => \checksum_reg[3]_i_4_n_0\,
      I3 => \checksum_reg[3]_i_5_n_0\,
      I4 => \state__6\(1),
      I5 => \checksum_reg[3]_i_6_n_0\,
      O => \checksum_reg[3]_i_1_n_0\
    );
\checksum_reg[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => state_begin(0),
      I1 => state_begin(1),
      I2 => b_ready_reg_i_6_n_0,
      I3 => \state__6\(1),
      O => \checksum_reg[3]_i_2_n_0\
    );
\checksum_reg[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \state__6\(1),
      I1 => \state__6\(0),
      I2 => b_ready_reg_i_6_n_0,
      O => \checksum_reg[3]_i_3_n_0\
    );
\checksum_reg[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"553FFFFF"
    )
        port map (
      I0 => b_ready_reg_i_7_n_0,
      I1 => b_start,
      I2 => \^b_check_ready\,
      I3 => \state__6\(1),
      I4 => b_ready_reg_i_6_n_0,
      O => \checksum_reg[3]_i_4_n_0\
    );
\checksum_reg[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => state_begin(0),
      I1 => state_begin(1),
      O => \checksum_reg[3]_i_5_n_0\
    );
\checksum_reg[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \state__6\(0),
      I1 => \state__6\(1),
      I2 => b_start,
      I3 => \^b_check_ready\,
      O => \checksum_reg[3]_i_6_n_0\
    );
\state_begin_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \state_begin_reg[0]_i_1_n_0\,
      G => \state_begin_reg[1]_i_2_n_0\,
      GE => '1',
      Q => state_begin(0)
    );
\state_begin_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010101010001010"
    )
        port map (
      I0 => state_begin(1),
      I1 => state_begin(0),
      I2 => b_ready_reg_i_6_n_0,
      I3 => \state__6\(1),
      I4 => \state_begin_reg[0]_i_2_n_0\,
      I5 => \state__6\(0),
      O => \state_begin_reg[0]_i_1_n_0\
    );
\state_begin_reg[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4777"
    )
        port map (
      I0 => b_ready_reg_i_7_n_0,
      I1 => \state__6\(1),
      I2 => \^b_check_ready\,
      I3 => b_start,
      O => \state_begin_reg[0]_i_2_n_0\
    );
\state_begin_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \state_begin_reg[1]_i_1_n_0\,
      G => \state_begin_reg[1]_i_2_n_0\,
      GE => '1',
      Q => state_begin(1)
    );
\state_begin_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => state_begin(1),
      I1 => state_begin(0),
      I2 => state_it,
      O => \state_begin_reg[1]_i_1_n_0\
    );
\state_begin_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAAFB"
    )
        port map (
      I0 => \state_begin_reg[1]_i_1_n_0\,
      I1 => \state_begin_reg[1]_i_3_n_0\,
      I2 => b_ready_reg_i_1_n_0,
      I3 => state_begin(0),
      I4 => \state_begin_reg[1]_i_4_n_0\,
      I5 => \state_begin_reg[1]_i_5_n_0\,
      O => \state_begin_reg[1]_i_2_n_0\
    );
\state_begin_reg[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => b_ready_reg_i_6_n_0,
      I1 => \state__6\(1),
      O => \state_begin_reg[1]_i_3_n_0\
    );
\state_begin_reg[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07070777"
    )
        port map (
      I0 => \^b_check_ready\,
      I1 => b_start,
      I2 => b_ready_reg_i_6_n_0,
      I3 => \state__6\(1),
      I4 => \state__6\(0),
      O => \state_begin_reg[1]_i_4_n_0\
    );
\state_begin_reg[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444044400000444"
    )
        port map (
      I0 => state_begin(0),
      I1 => b_ready_reg_i_6_n_0,
      I2 => \state__6\(0),
      I3 => state_begin(1),
      I4 => \state__6\(1),
      I5 => b_ready_reg_i_7_n_0,
      O => \state_begin_reg[1]_i_5_n_0\
    );
state_it_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => state_it_reg_i_1_n_0,
      G => state_it_reg_i_2_n_0,
      GE => '1',
      Q => state_it
    );
state_it_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state_it,
      O => state_it_reg_i_1_n_0
    );
state_it_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state_begin(0),
      I1 => state_begin(1),
      O => state_it_reg_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SPI_slave_reci is
  port (
    state : out STD_LOGIC_VECTOR ( 2 downto 0 );
    b_spi_sleep_reg_i_5_0 : out STD_LOGIC;
    ss : out STD_LOGIC;
    b_spi_sleep3_out : out STD_LOGIC;
    ss_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \b_data_controller_o_reg[3]_i_10_0\ : out STD_LOGIC;
    b_start0_out : out STD_LOGIC;
    b_start_reg_i_13_0 : out STD_LOGIC;
    \b_data_controller_o_reg[3]_i_7_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ss_1 : out STD_LOGIC;
    ss_2 : out STD_LOGIC;
    \b_shift_reg[15]_i_8_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    ss_IBUF : in STD_LOGIC;
    busy : in STD_LOGIC;
    b_start : in STD_LOGIC;
    b_check_ready : in STD_LOGIC;
    b_spi_sleep_reg : in STD_LOGIC;
    b_spi_sleep_reg_i_2_0 : in STD_LOGIC;
    b_start_reg_i_9_0 : in STD_LOGIC;
    b_spi_sleep_reg_i_7 : in STD_LOGIC;
    b_start_reg_i_9_1 : in STD_LOGIC;
    w_control_answer : in STD_LOGIC;
    spi_sleep : in STD_LOGIC;
    \b_shift_reg[13]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \b_shift_reg[15]_i_2_0\ : in STD_LOGIC;
    CLK : in STD_LOGIC;
    \w_shift_reg[15]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end SPI_slave_reci;

architecture STRUCTURE of SPI_slave_reci is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal b_busy_reci : STD_LOGIC;
  signal \^b_data_controller_o_reg[3]_i_10_0\ : STD_LOGIC;
  signal \b_data_controller_o_reg[3]_i_10_n_0\ : STD_LOGIC;
  signal \b_data_controller_o_reg[3]_i_11_n_0\ : STD_LOGIC;
  signal \^b_data_controller_o_reg[3]_i_7_0\ : STD_LOGIC;
  signal \b_data_controller_o_reg[3]_i_8_n_0\ : STD_LOGIC;
  signal \b_data_controller_o_reg[3]_i_9_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_11_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_12_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_5_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_7_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_8_n_0\ : STD_LOGIC;
  signal \b_shift_reg[15]_i_9_n_0\ : STD_LOGIC;
  signal b_spi_sleep_reg_i_13_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_14_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_3_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_4_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_6_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_8_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_9_n_0 : STD_LOGIC;
  signal b_start_reg_i_10_n_0 : STD_LOGIC;
  signal b_start_reg_i_11_n_0 : STD_LOGIC;
  signal b_start_reg_i_12_n_0 : STD_LOGIC;
  signal \^b_start_reg_i_13_0\ : STD_LOGIC;
  signal b_start_reg_i_13_n_0 : STD_LOGIC;
  signal b_start_reg_i_3_n_0 : STD_LOGIC;
  signal b_start_reg_i_4_n_0 : STD_LOGIC;
  signal b_start_reg_i_5_n_0 : STD_LOGIC;
  signal b_start_reg_i_6_n_0 : STD_LOGIC;
  signal b_start_reg_i_7_n_0 : STD_LOGIC;
  signal b_start_reg_i_8_n_0 : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal i_index : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i_index0 : STD_LOGIC;
  signal i_index02_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \i_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \i_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \i_index[3]_i_2_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ready : STD_LOGIC;
  signal \^ss\ : STD_LOGIC;
  signal \^ss_0\ : STD_LOGIC;
  signal \^ss_1\ : STD_LOGIC;
  signal \^state\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  signal w_busy_reg_i_1_n_0 : STD_LOGIC;
  signal w_busy_reg_i_2_n_0 : STD_LOGIC;
  signal \w_data_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal w_shift : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \w_shift[15]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[3]_i_11\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[3]_i_4\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \b_data_controller_o_reg[3]_i_8\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \b_shift_reg[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \b_shift_reg[10]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \b_shift_reg[11]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \b_shift_reg[12]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \b_shift_reg[13]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \b_shift_reg[14]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \b_shift_reg[15]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \b_shift_reg[15]_i_12\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \b_shift_reg[15]_i_9\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \b_shift_reg[1]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \b_shift_reg[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \b_shift_reg[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \b_shift_reg[4]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \b_shift_reg[5]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \b_shift_reg[6]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \b_shift_reg[7]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \b_shift_reg[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \b_shift_reg[9]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of b_spi_sleep_reg_i_13 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of b_spi_sleep_reg_i_3 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of b_spi_sleep_reg_i_5 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of b_start_reg_i_12 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of b_start_reg_i_5 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \i_index[0]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \i_index[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \i_index[2]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \i_index[3]_i_2\ : label is "soft_lutpair21";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of w_busy_reg : label is "LD";
  attribute SOFT_HLUTNM of w_busy_reg_i_1 : label is "soft_lutpair24";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[15]\ : label is "LD";
  attribute SOFT_HLUTNM of \w_data_reg[15]_i_1\ : label is "soft_lutpair24";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \w_data_reg[9]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of w_ready_reg : label is "LD";
begin
  E(0) <= \^e\(0);
  \b_data_controller_o_reg[3]_i_10_0\ <= \^b_data_controller_o_reg[3]_i_10_0\;
  \b_data_controller_o_reg[3]_i_7_0\ <= \^b_data_controller_o_reg[3]_i_7_0\;
  b_start_reg_i_13_0 <= \^b_start_reg_i_13_0\;
  ss <= \^ss\;
  ss_0 <= \^ss_0\;
  ss_1 <= \^ss_1\;
  state(2 downto 0) <= \^state\(2 downto 0);
\b_data_controller_o_reg[3]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \^ss_1\,
      I1 => \b_data_controller_o_reg[3]_i_10_n_0\,
      I2 => ss_IBUF,
      O => \b_data_controller_o_reg[3]_i_10_n_0\
    );
\b_data_controller_o_reg[3]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \^state\(1),
      I1 => \^ss_0\,
      I2 => b_check_ready,
      I3 => b_start,
      O => \b_data_controller_o_reg[3]_i_11_n_0\
    );
\b_data_controller_o_reg[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB0B000000000000"
    )
        port map (
      I0 => \^b_data_controller_o_reg[3]_i_10_0\,
      I1 => \^state\(2),
      I2 => \^ss_0\,
      I3 => \^state\(1),
      I4 => ss_IBUF,
      I5 => \b_data_controller_o_reg[3]_i_8_n_0\,
      O => \^e\(0)
    );
\b_data_controller_o_reg[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \b_data_controller_o_reg[3]_i_9_n_0\,
      I1 => \^ss_1\,
      I2 => \b_data_controller_o_reg[3]_i_10_n_0\,
      O => \^b_data_controller_o_reg[3]_i_10_0\
    );
\b_data_controller_o_reg[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \b_data_controller_o_reg[3]_i_10_n_0\,
      I1 => \^ss_1\,
      O => \^state\(2)
    );
\b_data_controller_o_reg[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF55DF"
    )
        port map (
      I0 => ss_IBUF,
      I1 => \^state\(1),
      I2 => \^ss_0\,
      I3 => \^state\(2),
      I4 => \^b_data_controller_o_reg[3]_i_10_0\,
      O => \^ss_0\
    );
\b_data_controller_o_reg[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F8F8C888"
    )
        port map (
      I0 => \b_data_controller_o_reg[3]_i_9_n_0\,
      I1 => \^state\(1),
      I2 => \b_data_controller_o_reg[3]_i_11_n_0\,
      I3 => b_spi_sleep_reg_i_4_n_0,
      I4 => b_spi_sleep_reg_i_3_n_0,
      I5 => \^ss\,
      O => \^state\(1)
    );
\b_data_controller_o_reg[3]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F800"
    )
        port map (
      I0 => b_spi_sleep_reg_i_4_n_0,
      I1 => \^state\(1),
      I2 => b_spi_sleep_reg_i_3_n_0,
      I3 => b_check_ready,
      I4 => b_start,
      O => \b_data_controller_o_reg[3]_i_8_n_0\
    );
\b_data_controller_o_reg[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF5F4FFFF"
    )
        port map (
      I0 => \^state\(1),
      I1 => \^state\(0),
      I2 => b_spi_sleep_reg_i_7,
      I3 => b_start_reg_i_5_n_0,
      I4 => b_check_ready,
      I5 => b_start,
      O => \b_data_controller_o_reg[3]_i_9_n_0\
    );
\b_shift_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \b_shift_reg[15]_i_3_n_0\,
      I1 => data(0),
      O => D(0)
    );
\b_shift_reg[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(10),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(2),
      I3 => \^state\(1),
      O => D(10)
    );
\b_shift_reg[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(11),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(3),
      I3 => \^state\(1),
      O => D(11)
    );
\b_shift_reg[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(12),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(4),
      I3 => \^state\(1),
      O => D(12)
    );
\b_shift_reg[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(13),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(5),
      I3 => \^state\(1),
      O => D(13)
    );
\b_shift_reg[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(14),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(4),
      I3 => \^state\(1),
      O => D(14)
    );
\b_shift_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(15),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(5),
      I3 => \^state\(1),
      O => D(15)
    );
\b_shift_reg[15]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABAAA8AAA8AAA8AA"
    )
        port map (
      I0 => b_spi_sleep_reg_i_13_n_0,
      I1 => busy,
      I2 => b_busy_reci,
      I3 => ready,
      I4 => \^state\(0),
      I5 => ss_IBUF,
      O => \b_shift_reg[15]_i_11_n_0\
    );
\b_shift_reg[15]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => spi_sleep,
      I1 => w_control_answer,
      I2 => \^ss_1\,
      I3 => \b_data_controller_o_reg[3]_i_10_n_0\,
      O => \b_shift_reg[15]_i_12_n_0\
    );
\b_shift_reg[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000F400"
    )
        port map (
      I0 => b_spi_sleep_reg_i_2_0,
      I1 => \b_shift_reg[15]_i_5_n_0\,
      I2 => b_spi_sleep_reg_i_7,
      I3 => b_spi_sleep_reg_i_8_n_0,
      I4 => \b_shift_reg[15]_i_7_n_0\,
      I5 => \b_shift_reg[15]_i_8_n_0\,
      O => \b_shift_reg[15]_i_8_0\(0)
    );
\b_shift_reg[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5DFDFFFF5D5DFFFF"
    )
        port map (
      I0 => ss_IBUF,
      I1 => \b_data_controller_o_reg[3]_i_9_n_0\,
      I2 => \^state\(1),
      I3 => b_spi_sleep_reg_i_2_0,
      I4 => \^ss_0\,
      I5 => \b_shift_reg[15]_i_9_n_0\,
      O => \b_shift_reg[15]_i_3_n_0\
    );
\b_shift_reg[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAFFEA"
    )
        port map (
      I0 => \b_shift_reg[15]_i_2_0\,
      I1 => b_spi_sleep_reg_i_4_n_0,
      I2 => \^state\(1),
      I3 => b_spi_sleep_reg_i_3_n_0,
      I4 => \^ss\,
      I5 => \^state\(1),
      O => \b_shift_reg[15]_i_5_n_0\
    );
\b_shift_reg[15]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B0F0"
    )
        port map (
      I0 => \^b_data_controller_o_reg[3]_i_10_0\,
      I1 => \^state\(2),
      I2 => \^state\(1),
      I3 => ss_IBUF,
      O => \b_shift_reg[15]_i_7_n_0\
    );
\b_shift_reg[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"220022F000000000"
    )
        port map (
      I0 => b_spi_sleep_reg_i_14_n_0,
      I1 => \^ss\,
      I2 => \b_shift_reg[15]_i_11_n_0\,
      I3 => \^state\(1),
      I4 => b_spi_sleep_reg_i_2_0,
      I5 => \b_shift_reg[15]_i_12_n_0\,
      O => \b_shift_reg[15]_i_8_n_0\
    );
\b_shift_reg[15]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => b_spi_sleep_reg_i_3_n_0,
      I1 => \^state\(1),
      I2 => b_spi_sleep_reg_i_4_n_0,
      O => \b_shift_reg[15]_i_9_n_0\
    );
\b_shift_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \b_shift_reg[15]_i_3_n_0\,
      I1 => data(1),
      O => D(1)
    );
\b_shift_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \b_shift_reg[15]_i_3_n_0\,
      I1 => data(2),
      O => D(2)
    );
\b_shift_reg[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \b_shift_reg[15]_i_3_n_0\,
      I1 => data(3),
      O => D(3)
    );
\b_shift_reg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(4),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(0),
      I3 => \^state\(1),
      O => D(4)
    );
\b_shift_reg[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(5),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(1),
      I3 => \^state\(1),
      O => D(5)
    );
\b_shift_reg[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(6),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(0),
      I3 => \^state\(1),
      O => D(6)
    );
\b_shift_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(7),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(1),
      I3 => \^state\(1),
      O => D(7)
    );
\b_shift_reg[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(8),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(2),
      I3 => \^state\(1),
      O => D(8)
    );
\b_shift_reg[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data(9),
      I1 => \b_shift_reg[15]_i_3_n_0\,
      I2 => \b_shift_reg[13]\(3),
      I3 => \^state\(1),
      O => D(9)
    );
b_spi_sleep_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000044404040"
    )
        port map (
      I0 => b_start,
      I1 => b_check_ready,
      I2 => b_spi_sleep_reg_i_3_n_0,
      I3 => \^state\(1),
      I4 => b_spi_sleep_reg_i_4_n_0,
      I5 => \^ss\,
      O => b_spi_sleep_reg_i_5_0
    );
b_spi_sleep_reg_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5444"
    )
        port map (
      I0 => \^ss\,
      I1 => b_spi_sleep_reg_i_3_n_0,
      I2 => \^state\(1),
      I3 => b_spi_sleep_reg_i_4_n_0,
      I4 => \b_shift_reg[15]_i_2_0\,
      O => \^state\(0)
    );
b_spi_sleep_reg_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00FFFFFFEF"
    )
        port map (
      I0 => busy,
      I1 => b_busy_reci,
      I2 => ready,
      I3 => b_spi_sleep_reg_i_7,
      I4 => \^state\(0),
      I5 => \^state\(1),
      O => \^b_data_controller_o_reg[3]_i_7_0\
    );
b_spi_sleep_reg_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => ss_IBUF,
      I1 => \^state\(1),
      I2 => \^state\(2),
      I3 => \^b_data_controller_o_reg[3]_i_10_0\,
      O => b_spi_sleep_reg_i_13_n_0
    );
b_spi_sleep_reg_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000000EF"
    )
        port map (
      I0 => busy,
      I1 => b_busy_reci,
      I2 => ready,
      I3 => \^state\(0),
      I4 => \^state\(1),
      I5 => b_spi_sleep_reg_i_7,
      O => b_spi_sleep_reg_i_14_n_0
    );
b_spi_sleep_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBFAFAAAA"
    )
        port map (
      I0 => b_spi_sleep_reg_i_6_n_0,
      I1 => \^state\(1),
      I2 => \^ss_0\,
      I3 => b_spi_sleep_reg,
      I4 => b_spi_sleep_reg_i_8_n_0,
      I5 => b_spi_sleep_reg_i_9_n_0,
      O => b_spi_sleep3_out
    );
b_spi_sleep_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \^state\(1),
      I1 => ready,
      I2 => \^state\(0),
      I3 => busy,
      I4 => b_busy_reci,
      O => b_spi_sleep_reg_i_3_n_0
    );
b_spi_sleep_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAEA"
    )
        port map (
      I0 => b_start_reg_i_9_1,
      I1 => \^b_data_controller_o_reg[3]_i_7_0\,
      I2 => w_control_answer,
      I3 => spi_sleep,
      O => b_spi_sleep_reg_i_4_n_0
    );
b_spi_sleep_reg_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4454FFFF"
    )
        port map (
      I0 => \^b_data_controller_o_reg[3]_i_10_0\,
      I1 => \^state\(2),
      I2 => \^ss_0\,
      I3 => \^state\(1),
      I4 => ss_IBUF,
      O => \^ss\
    );
b_spi_sleep_reg_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A800A8000000A8"
    )
        port map (
      I0 => b_spi_sleep_reg_i_13_n_0,
      I1 => spi_sleep,
      I2 => w_control_answer,
      I3 => \^state\(2),
      I4 => b_spi_sleep_reg_i_2_0,
      I5 => b_spi_sleep_reg_i_14_n_0,
      O => b_spi_sleep_reg_i_6_n_0
    );
b_spi_sleep_reg_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => \b_data_controller_o_reg[3]_i_10_n_0\,
      I1 => \^ss_1\,
      I2 => ss_IBUF,
      I3 => ready,
      I4 => b_busy_reci,
      I5 => busy,
      O => b_spi_sleep_reg_i_8_n_0
    );
b_spi_sleep_reg_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00004F00"
    )
        port map (
      I0 => \^state\(1),
      I1 => \^state\(0),
      I2 => \^ss_0\,
      I3 => b_spi_sleep_reg_i_8_n_0,
      I4 => b_spi_sleep_reg_i_2_0,
      I5 => \^e\(0),
      O => b_spi_sleep_reg_i_9_n_0
    );
b_start_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFAAAAAAFFFF"
    )
        port map (
      I0 => b_start_reg_i_3_n_0,
      I1 => \^state\(1),
      I2 => \^ss_0\,
      I3 => b_start_reg_i_4_n_0,
      I4 => b_start_reg_i_5_n_0,
      I5 => ss_IBUF,
      O => ss_2
    );
b_start_reg_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55150000FFFFFFFF"
    )
        port map (
      I0 => b_start_reg_i_9_1,
      I1 => \^b_data_controller_o_reg[3]_i_7_0\,
      I2 => w_control_answer,
      I3 => spi_sleep,
      I4 => b_start_reg_i_5_n_0,
      I5 => \^ss_0\,
      O => b_start_reg_i_10_n_0
    );
b_start_reg_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \b_data_controller_o_reg[3]_i_10_n_0\,
      I1 => \^ss_1\,
      I2 => w_control_answer,
      I3 => spi_sleep,
      I4 => \^ss\,
      I5 => \^state\(1),
      O => b_start_reg_i_11_n_0
    );
b_start_reg_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \^state\(1),
      I1 => w_control_answer,
      I2 => b_check_ready,
      I3 => b_start,
      O => b_start_reg_i_12_n_0
    );
b_start_reg_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFFFFE222F333"
    )
        port map (
      I0 => \^state\(0),
      I1 => \^state\(1),
      I2 => b_start_reg_i_9_0,
      I3 => b_spi_sleep_reg_i_7,
      I4 => b_start_reg_i_5_n_0,
      I5 => b_start_reg_i_9_1,
      O => b_start_reg_i_13_n_0
    );
b_start_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFFFE"
    )
        port map (
      I0 => b_start_reg_i_6_n_0,
      I1 => b_start_reg_i_7_n_0,
      I2 => b_start_reg_i_8_n_0,
      I3 => \^b_start_reg_i_13_0\,
      I4 => b_start_reg_i_10_n_0,
      I5 => b_start_reg_i_11_n_0,
      O => b_start0_out
    );
b_start_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFF08080808080"
    )
        port map (
      I0 => b_spi_sleep_reg_i_14_n_0,
      I1 => w_control_answer,
      I2 => b_spi_sleep_reg_i_13_n_0,
      I3 => b_start_reg_i_5_n_0,
      I4 => \^state\(0),
      I5 => b_start_reg_i_12_n_0,
      O => b_start_reg_i_3_n_0
    );
b_start_reg_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0040FFFF"
    )
        port map (
      I0 => b_start,
      I1 => b_check_ready,
      I2 => \^state\(0),
      I3 => \^state\(1),
      I4 => \^ss_0\,
      I5 => b_spi_sleep_reg,
      O => b_start_reg_i_4_n_0
    );
b_start_reg_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => busy,
      I1 => b_busy_reci,
      I2 => ready,
      O => b_start_reg_i_5_n_0
    );
b_start_reg_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \b_shift_reg[15]_i_12_n_0\,
      I1 => ss_IBUF,
      I2 => \^state\(0),
      I3 => b_start_reg_i_5_n_0,
      I4 => \^state\(1),
      O => b_start_reg_i_6_n_0
    );
b_start_reg_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => w_control_answer,
      I1 => spi_sleep,
      I2 => \^state\(1),
      I3 => \^b_data_controller_o_reg[3]_i_7_0\,
      I4 => b_start_reg_i_9_1,
      I5 => b_spi_sleep_reg_i_8_n_0,
      O => b_start_reg_i_7_n_0
    );
b_start_reg_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0AAA8A"
    )
        port map (
      I0 => b_spi_sleep_reg_i_8_n_0,
      I1 => b_spi_sleep_reg,
      I2 => \^ss_0\,
      I3 => \^state\(0),
      I4 => \^state\(1),
      O => b_start_reg_i_8_n_0
    );
b_start_reg_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4500"
    )
        port map (
      I0 => \^ss\,
      I1 => b_start,
      I2 => b_check_ready,
      I3 => b_start_reg_i_13_n_0,
      O => \^b_start_reg_i_13_0\
    );
\b_transmit_buf_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => \^b_data_controller_o_reg[3]_i_10_0\,
      I1 => \^ss_0\,
      I2 => \^state\(1),
      I3 => ss_IBUF,
      I4 => \b_data_controller_o_reg[3]_i_8_n_0\,
      O => \^ss_1\
    );
\i_index[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_index(0),
      O => i_index02_in(0)
    );
\i_index[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => i_index(0),
      I1 => i_index(1),
      O => \i_index[1]_i_1_n_0\
    );
\i_index[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => i_index(1),
      I1 => i_index(0),
      I2 => i_index(2),
      O => \i_index[2]_i_1_n_0\
    );
\i_index[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888888880"
    )
        port map (
      I0 => ss_IBUF,
      I1 => \state_reg_n_0_[0]\,
      I2 => i_index(0),
      I3 => i_index(1),
      I4 => i_index(2),
      I5 => i_index(3),
      O => i_index0
    );
\i_index[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => i_index(2),
      I1 => i_index(0),
      I2 => i_index(1),
      I3 => i_index(3),
      O => \i_index[3]_i_2_n_0\
    );
\i_index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => i_index0,
      D => i_index02_in(0),
      Q => i_index(0),
      R => '0'
    );
\i_index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => i_index0,
      D => \i_index[1]_i_1_n_0\,
      Q => i_index(1),
      R => '0'
    );
\i_index_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => i_index0,
      D => \i_index[2]_i_1_n_0\,
      Q => i_index(2),
      R => '0'
    );
\i_index_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => i_index0,
      D => \i_index[3]_i_2_n_0\,
      Q => i_index(3),
      R => '0'
    );
\state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => i_index(3),
      I1 => i_index(2),
      I2 => i_index(1),
      I3 => i_index(0),
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => i_index(0),
      I1 => i_index(1),
      I2 => i_index(2),
      I3 => i_index(3),
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => ss_IBUF,
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      O => \state[1]_i_2__0_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \state[1]_i_2__0_n_0\,
      D => \state[0]_i_1_n_0\,
      Q => \state_reg_n_0_[0]\
    );
\state_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      PRE => \state[1]_i_2__0_n_0\,
      Q => \state_reg_n_0_[1]\
    );
w_busy_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_busy_reg_i_1_n_0,
      G => w_busy_reg_i_2_n_0,
      GE => '1',
      Q => b_busy_reci
    );
w_busy_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      I2 => ss_IBUF,
      O => w_busy_reg_i_1_n_0
    );
w_busy_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      O => w_busy_reg_i_2_n_0
    );
\w_data_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(0),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(0)
    );
\w_data_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(10),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(10)
    );
\w_data_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(11),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(11)
    );
\w_data_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(12),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(12)
    );
\w_data_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(13),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(13)
    );
\w_data_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(14),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(14)
    );
\w_data_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(15),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(15)
    );
\w_data_reg[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      I2 => ss_IBUF,
      O => \w_data_reg[15]_i_1_n_0\
    );
\w_data_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(1),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(1)
    );
\w_data_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(2),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(2)
    );
\w_data_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(3),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(3)
    );
\w_data_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(4),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(4)
    );
\w_data_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(5),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(5)
    );
\w_data_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(6),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(6)
    );
\w_data_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(7),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(7)
    );
\w_data_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(8),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(8)
    );
\w_data_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => w_shift(9),
      G => \w_data_reg[15]_i_1_n_0\,
      GE => '1',
      Q => data(9)
    );
w_ready_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '1'
    )
        port map (
      CLR => '0',
      D => \w_data_reg[15]_i_1_n_0\,
      G => w_busy_reg_i_2_n_0,
      GE => '1',
      Q => ready
    );
\w_shift[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000D"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      I2 => i_index(0),
      I3 => i_index(1),
      I4 => i_index(2),
      I5 => i_index(3),
      O => p_1_in(0)
    );
\w_shift[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000B000000000"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => i_index(1),
      I3 => i_index(0),
      I4 => i_index(2),
      I5 => i_index(3),
      O => p_1_in(10)
    );
\w_shift[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A20000000000"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(2),
      I5 => i_index(3),
      O => p_1_in(11)
    );
\w_shift[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1011000000000000"
    )
        port map (
      I0 => i_index(0),
      I1 => i_index(1),
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(12)
    );
\w_shift[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5100000000000000"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(13)
    );
\w_shift[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00B0000000000000"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => i_index(1),
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(14)
    );
\w_shift[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A200000000000000"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(15)
    );
\w_shift[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => ss_IBUF,
      I2 => \state_reg_n_0_[0]\,
      O => \w_shift[15]_i_2_n_0\
    );
\w_shift[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005100"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(1)
    );
\w_shift[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000B0"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => i_index(1),
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(2)
    );
\w_shift[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000A200"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(3)
    );
\w_shift[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000101100000000"
    )
        port map (
      I0 => i_index(0),
      I1 => i_index(1),
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(4)
    );
\w_shift[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000510000000000"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(5)
    );
\w_shift[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000B000000000"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => i_index(1),
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(6)
    );
\w_shift[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A20000000000"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(3),
      I5 => i_index(2),
      O => p_1_in(7)
    );
\w_shift[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000101100000000"
    )
        port map (
      I0 => i_index(0),
      I1 => i_index(1),
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => i_index(2),
      I5 => i_index(3),
      O => p_1_in(8)
    );
\w_shift[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000510000000000"
    )
        port map (
      I0 => i_index(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[0]\,
      I3 => i_index(0),
      I4 => i_index(2),
      I5 => i_index(3),
      O => p_1_in(9)
    );
\w_shift_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(0),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(0)
    );
\w_shift_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(10),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(10)
    );
\w_shift_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(11),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(11)
    );
\w_shift_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(12),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(12)
    );
\w_shift_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(13),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(13)
    );
\w_shift_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(14),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(14)
    );
\w_shift_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(15),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(15)
    );
\w_shift_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(1),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(1)
    );
\w_shift_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(2),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(2)
    );
\w_shift_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(3),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(3)
    );
\w_shift_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(4),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(4)
    );
\w_shift_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(5),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(5)
    );
\w_shift_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(6),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(6)
    );
\w_shift_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(7),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(7)
    );
\w_shift_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(8),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(8)
    );
\w_shift_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_1_in(9),
      CLR => \w_shift[15]_i_2_n_0\,
      D => \w_shift_reg[15]_0\(0),
      Q => w_shift(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SPI_slave_trns is
  port (
    busy : out STD_LOGIC;
    miso_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    ss_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end SPI_slave_trns;

architecture STRUCTURE of SPI_slave_trns is
  signal b_busy_reg_i_1_n_0 : STD_LOGIC;
  signal \b_miso1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__0_n_1\ : STD_LOGIC;
  signal \b_miso1_carry__0_n_2\ : STD_LOGIC;
  signal \b_miso1_carry__0_n_3\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__1_n_1\ : STD_LOGIC;
  signal \b_miso1_carry__1_n_2\ : STD_LOGIC;
  signal \b_miso1_carry__1_n_3\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_n_0\ : STD_LOGIC;
  signal \b_miso1_carry__2_n_1\ : STD_LOGIC;
  signal \b_miso1_carry__2_n_2\ : STD_LOGIC;
  signal \b_miso1_carry__2_n_3\ : STD_LOGIC;
  signal b_miso1_carry_i_1_n_0 : STD_LOGIC;
  signal b_miso1_carry_i_2_n_0 : STD_LOGIC;
  signal b_miso1_carry_i_3_n_0 : STD_LOGIC;
  signal b_miso1_carry_i_4_n_0 : STD_LOGIC;
  signal b_miso1_carry_i_5_n_0 : STD_LOGIC;
  signal b_miso1_carry_i_6_n_0 : STD_LOGIC;
  signal b_miso1_carry_i_7_n_0 : STD_LOGIC;
  signal b_miso1_carry_n_0 : STD_LOGIC;
  signal b_miso1_carry_n_1 : STD_LOGIC;
  signal b_miso1_carry_n_2 : STD_LOGIC;
  signal b_miso1_carry_n_3 : STD_LOGIC;
  signal b_miso_i_10_n_0 : STD_LOGIC;
  signal b_miso_i_2_n_0 : STD_LOGIC;
  signal b_miso_i_3_n_0 : STD_LOGIC;
  signal b_miso_i_4_n_0 : STD_LOGIC;
  signal b_miso_i_5_n_0 : STD_LOGIC;
  signal b_miso_i_6_n_0 : STD_LOGIC;
  signal b_miso_i_7_n_0 : STD_LOGIC;
  signal b_miso_i_8_n_0 : STD_LOGIC;
  signal b_miso_i_9_n_0 : STD_LOGIC;
  signal index : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal index0 : STD_LOGIC;
  signal index02_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \index0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \index0_carry__0_n_0\ : STD_LOGIC;
  signal \index0_carry__0_n_1\ : STD_LOGIC;
  signal \index0_carry__0_n_2\ : STD_LOGIC;
  signal \index0_carry__0_n_3\ : STD_LOGIC;
  signal \index0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \index0_carry__1_n_0\ : STD_LOGIC;
  signal \index0_carry__1_n_1\ : STD_LOGIC;
  signal \index0_carry__1_n_2\ : STD_LOGIC;
  signal \index0_carry__1_n_3\ : STD_LOGIC;
  signal \index0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \index0_carry__2_n_0\ : STD_LOGIC;
  signal \index0_carry__2_n_1\ : STD_LOGIC;
  signal \index0_carry__2_n_2\ : STD_LOGIC;
  signal \index0_carry__2_n_3\ : STD_LOGIC;
  signal \index0_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \index0_carry__3_n_0\ : STD_LOGIC;
  signal \index0_carry__3_n_1\ : STD_LOGIC;
  signal \index0_carry__3_n_2\ : STD_LOGIC;
  signal \index0_carry__3_n_3\ : STD_LOGIC;
  signal \index0_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \index0_carry__4_n_0\ : STD_LOGIC;
  signal \index0_carry__4_n_1\ : STD_LOGIC;
  signal \index0_carry__4_n_2\ : STD_LOGIC;
  signal \index0_carry__4_n_3\ : STD_LOGIC;
  signal \index0_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \index0_carry__5_n_0\ : STD_LOGIC;
  signal \index0_carry__5_n_1\ : STD_LOGIC;
  signal \index0_carry__5_n_2\ : STD_LOGIC;
  signal \index0_carry__5_n_3\ : STD_LOGIC;
  signal \index0_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \index0_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \index0_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \index0_carry__6_n_2\ : STD_LOGIC;
  signal \index0_carry__6_n_3\ : STD_LOGIC;
  signal index0_carry_i_1_n_0 : STD_LOGIC;
  signal index0_carry_i_2_n_0 : STD_LOGIC;
  signal index0_carry_i_3_n_0 : STD_LOGIC;
  signal index0_carry_i_4_n_0 : STD_LOGIC;
  signal index0_carry_n_0 : STD_LOGIC;
  signal index0_carry_n_1 : STD_LOGIC;
  signal index0_carry_n_2 : STD_LOGIC;
  signal index0_carry_n_3 : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal shift_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \shift_reg_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_10_n_0\ : STD_LOGIC;
  signal \state[1]_i_11_n_0\ : STD_LOGIC;
  signal \state[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_3_n_0\ : STD_LOGIC;
  signal \state[1]_i_4_n_0\ : STD_LOGIC;
  signal \state[1]_i_5_n_0\ : STD_LOGIC;
  signal \state[1]_i_6_n_0\ : STD_LOGIC;
  signal \state[1]_i_7_n_0\ : STD_LOGIC;
  signal \state[1]_i_8_n_0\ : STD_LOGIC;
  signal \state[1]_i_9_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  signal NLW_b_miso1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_b_miso1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_b_miso1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_b_miso1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_index0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_index0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of b_busy_reg : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of b_busy_reg_i_1 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of b_miso_i_3 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of b_miso_i_6 : label is "soft_lutpair29";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[15]\ : label is "LD";
  attribute SOFT_HLUTNM of \shift_reg_reg[15]_i_1\ : label is "soft_lutpair28";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \shift_reg_reg[9]\ : label is "LD";
begin
b_busy_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \shift_reg_reg[15]_i_1_n_0\,
      G => b_busy_reg_i_1_n_0,
      GE => '1',
      Q => busy
    );
b_busy_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      O => b_busy_reg_i_1_n_0
    );
b_miso1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => b_miso1_carry_n_0,
      CO(2) => b_miso1_carry_n_1,
      CO(1) => b_miso1_carry_n_2,
      CO(0) => b_miso1_carry_n_3,
      CYINIT => '1',
      DI(3) => b_miso1_carry_i_1_n_0,
      DI(2) => b_miso1_carry_i_2_n_0,
      DI(1) => b_miso1_carry_i_3_n_0,
      DI(0) => index(1),
      O(3 downto 0) => NLW_b_miso1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => b_miso1_carry_i_4_n_0,
      S(2) => b_miso1_carry_i_5_n_0,
      S(1) => b_miso1_carry_i_6_n_0,
      S(0) => b_miso1_carry_i_7_n_0
    );
\b_miso1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => b_miso1_carry_n_0,
      CO(3) => \b_miso1_carry__0_n_0\,
      CO(2) => \b_miso1_carry__0_n_1\,
      CO(1) => \b_miso1_carry__0_n_2\,
      CO(0) => \b_miso1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \b_miso1_carry__0_i_1_n_0\,
      DI(2) => \b_miso1_carry__0_i_2_n_0\,
      DI(1) => \b_miso1_carry__0_i_3_n_0\,
      DI(0) => \b_miso1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_b_miso1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \b_miso1_carry__0_i_5_n_0\,
      S(2) => \b_miso1_carry__0_i_6_n_0\,
      S(1) => \b_miso1_carry__0_i_7_n_0\,
      S(0) => \b_miso1_carry__0_i_8_n_0\
    );
\b_miso1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(14),
      I1 => index(15),
      O => \b_miso1_carry__0_i_1_n_0\
    );
\b_miso1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(12),
      I1 => index(13),
      O => \b_miso1_carry__0_i_2_n_0\
    );
\b_miso1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(10),
      I1 => index(11),
      O => \b_miso1_carry__0_i_3_n_0\
    );
\b_miso1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(8),
      I1 => index(9),
      O => \b_miso1_carry__0_i_4_n_0\
    );
\b_miso1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(15),
      I1 => index(14),
      O => \b_miso1_carry__0_i_5_n_0\
    );
\b_miso1_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(13),
      I1 => index(12),
      O => \b_miso1_carry__0_i_6_n_0\
    );
\b_miso1_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(11),
      I1 => index(10),
      O => \b_miso1_carry__0_i_7_n_0\
    );
\b_miso1_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(9),
      I1 => index(8),
      O => \b_miso1_carry__0_i_8_n_0\
    );
\b_miso1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \b_miso1_carry__0_n_0\,
      CO(3) => \b_miso1_carry__1_n_0\,
      CO(2) => \b_miso1_carry__1_n_1\,
      CO(1) => \b_miso1_carry__1_n_2\,
      CO(0) => \b_miso1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \b_miso1_carry__1_i_1_n_0\,
      DI(2) => \b_miso1_carry__1_i_2_n_0\,
      DI(1) => \b_miso1_carry__1_i_3_n_0\,
      DI(0) => \b_miso1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_b_miso1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \b_miso1_carry__1_i_5_n_0\,
      S(2) => \b_miso1_carry__1_i_6_n_0\,
      S(1) => \b_miso1_carry__1_i_7_n_0\,
      S(0) => \b_miso1_carry__1_i_8_n_0\
    );
\b_miso1_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(22),
      I1 => index(23),
      O => \b_miso1_carry__1_i_1_n_0\
    );
\b_miso1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(20),
      I1 => index(21),
      O => \b_miso1_carry__1_i_2_n_0\
    );
\b_miso1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(18),
      I1 => index(19),
      O => \b_miso1_carry__1_i_3_n_0\
    );
\b_miso1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(16),
      I1 => index(17),
      O => \b_miso1_carry__1_i_4_n_0\
    );
\b_miso1_carry__1_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(23),
      I1 => index(22),
      O => \b_miso1_carry__1_i_5_n_0\
    );
\b_miso1_carry__1_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(21),
      I1 => index(20),
      O => \b_miso1_carry__1_i_6_n_0\
    );
\b_miso1_carry__1_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(19),
      I1 => index(18),
      O => \b_miso1_carry__1_i_7_n_0\
    );
\b_miso1_carry__1_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(17),
      I1 => index(16),
      O => \b_miso1_carry__1_i_8_n_0\
    );
\b_miso1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \b_miso1_carry__1_n_0\,
      CO(3) => \b_miso1_carry__2_n_0\,
      CO(2) => \b_miso1_carry__2_n_1\,
      CO(1) => \b_miso1_carry__2_n_2\,
      CO(0) => \b_miso1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \b_miso1_carry__2_i_1_n_0\,
      DI(2) => \b_miso1_carry__2_i_2_n_0\,
      DI(1) => \b_miso1_carry__2_i_3_n_0\,
      DI(0) => \b_miso1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_b_miso1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \b_miso1_carry__2_i_5_n_0\,
      S(2) => \b_miso1_carry__2_i_6_n_0\,
      S(1) => \b_miso1_carry__2_i_7_n_0\,
      S(0) => \b_miso1_carry__2_i_8_n_0\
    );
\b_miso1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => index(30),
      I1 => index(31),
      O => \b_miso1_carry__2_i_1_n_0\
    );
\b_miso1_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(28),
      I1 => index(29),
      O => \b_miso1_carry__2_i_2_n_0\
    );
\b_miso1_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(26),
      I1 => index(27),
      O => \b_miso1_carry__2_i_3_n_0\
    );
\b_miso1_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(24),
      I1 => index(25),
      O => \b_miso1_carry__2_i_4_n_0\
    );
\b_miso1_carry__2_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(31),
      I1 => index(30),
      O => \b_miso1_carry__2_i_5_n_0\
    );
\b_miso1_carry__2_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(29),
      I1 => index(28),
      O => \b_miso1_carry__2_i_6_n_0\
    );
\b_miso1_carry__2_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(27),
      I1 => index(26),
      O => \b_miso1_carry__2_i_7_n_0\
    );
\b_miso1_carry__2_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(25),
      I1 => index(24),
      O => \b_miso1_carry__2_i_8_n_0\
    );
b_miso1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(6),
      I1 => index(7),
      O => b_miso1_carry_i_1_n_0
    );
b_miso1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(4),
      I1 => index(5),
      O => b_miso1_carry_i_2_n_0
    );
b_miso1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(2),
      I1 => index(3),
      O => b_miso1_carry_i_3_n_0
    );
b_miso1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(7),
      I1 => index(6),
      O => b_miso1_carry_i_4_n_0
    );
b_miso1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(5),
      I1 => index(4),
      O => b_miso1_carry_i_5_n_0
    );
b_miso1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(3),
      I1 => index(2),
      O => b_miso1_carry_i_6_n_0
    );
b_miso1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => index(0),
      I1 => index(1),
      O => b_miso1_carry_i_7_n_0
    );
b_miso_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFB8000000"
    )
        port map (
      I0 => shift_reg(13),
      I1 => index(3),
      I2 => shift_reg(5),
      I3 => b_miso_i_3_n_0,
      I4 => index(2),
      I5 => b_miso_i_4_n_0,
      O => p_2_in
    );
b_miso_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000300020000"
    )
        port map (
      I0 => shift_reg(1),
      I1 => index(2),
      I2 => index(3),
      I3 => index(1),
      I4 => index(0),
      I5 => shift_reg(0),
      O => b_miso_i_10_n_0
    );
b_miso_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3C31"
    )
        port map (
      I0 => Q(15),
      I1 => ss_IBUF,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      O => b_miso_i_2_n_0
    );
b_miso_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => index(0),
      I1 => index(1),
      O => b_miso_i_3_n_0
    );
b_miso_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEAAAAAAAAAAAAA"
    )
        port map (
      I0 => b_miso_i_5_n_0,
      I1 => shift_reg(12),
      I2 => index(3),
      I3 => shift_reg(4),
      I4 => b_miso_i_6_n_0,
      I5 => index(2),
      O => b_miso_i_4_n_0
    );
b_miso_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF8080808"
    )
        port map (
      I0 => b_miso_i_7_n_0,
      I1 => index(3),
      I2 => index(2),
      I3 => index(1),
      I4 => b_miso_i_8_n_0,
      I5 => b_miso_i_9_n_0,
      O => b_miso_i_5_n_0
    );
b_miso_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(0),
      I1 => index(1),
      O => b_miso_i_6_n_0
    );
b_miso_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFCFA0CFAFC0A0C0"
    )
        port map (
      I0 => shift_reg(11),
      I1 => shift_reg(10),
      I2 => index(1),
      I3 => index(0),
      I4 => shift_reg(9),
      I5 => shift_reg(8),
      O => b_miso_i_7_n_0
    );
b_miso_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => shift_reg(15),
      I1 => shift_reg(7),
      I2 => index(0),
      I3 => shift_reg(14),
      I4 => index(3),
      I5 => shift_reg(6),
      O => b_miso_i_8_n_0
    );
b_miso_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000B800"
    )
        port map (
      I0 => shift_reg(3),
      I1 => index(0),
      I2 => shift_reg(2),
      I3 => index(1),
      I4 => \state[1]_i_5_n_0\,
      I5 => b_miso_i_10_n_0,
      O => b_miso_i_9_n_0
    );
b_miso_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \state[1]_i_1__0_n_0\,
      CLR => b_miso_i_2_n_0,
      D => p_2_in,
      Q => miso_OBUF
    );
index0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => index0_carry_n_0,
      CO(2) => index0_carry_n_1,
      CO(1) => index0_carry_n_2,
      CO(0) => index0_carry_n_3,
      CYINIT => index(0),
      DI(3 downto 0) => index(4 downto 1),
      O(3 downto 0) => index02_in(4 downto 1),
      S(3) => index0_carry_i_1_n_0,
      S(2) => index0_carry_i_2_n_0,
      S(1) => index0_carry_i_3_n_0,
      S(0) => index0_carry_i_4_n_0
    );
\index0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => index0_carry_n_0,
      CO(3) => \index0_carry__0_n_0\,
      CO(2) => \index0_carry__0_n_1\,
      CO(1) => \index0_carry__0_n_2\,
      CO(0) => \index0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => index(8 downto 5),
      O(3 downto 0) => index02_in(8 downto 5),
      S(3) => \index0_carry__0_i_1_n_0\,
      S(2) => \index0_carry__0_i_2_n_0\,
      S(1) => \index0_carry__0_i_3_n_0\,
      S(0) => \index0_carry__0_i_4_n_0\
    );
\index0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(8),
      O => \index0_carry__0_i_1_n_0\
    );
\index0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(7),
      O => \index0_carry__0_i_2_n_0\
    );
\index0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(6),
      O => \index0_carry__0_i_3_n_0\
    );
\index0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(5),
      O => \index0_carry__0_i_4_n_0\
    );
\index0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \index0_carry__0_n_0\,
      CO(3) => \index0_carry__1_n_0\,
      CO(2) => \index0_carry__1_n_1\,
      CO(1) => \index0_carry__1_n_2\,
      CO(0) => \index0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => index(12 downto 9),
      O(3 downto 0) => index02_in(12 downto 9),
      S(3) => \index0_carry__1_i_1_n_0\,
      S(2) => \index0_carry__1_i_2_n_0\,
      S(1) => \index0_carry__1_i_3_n_0\,
      S(0) => \index0_carry__1_i_4_n_0\
    );
\index0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(12),
      O => \index0_carry__1_i_1_n_0\
    );
\index0_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(11),
      O => \index0_carry__1_i_2_n_0\
    );
\index0_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(10),
      O => \index0_carry__1_i_3_n_0\
    );
\index0_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(9),
      O => \index0_carry__1_i_4_n_0\
    );
\index0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \index0_carry__1_n_0\,
      CO(3) => \index0_carry__2_n_0\,
      CO(2) => \index0_carry__2_n_1\,
      CO(1) => \index0_carry__2_n_2\,
      CO(0) => \index0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => index(16 downto 13),
      O(3 downto 0) => index02_in(16 downto 13),
      S(3) => \index0_carry__2_i_1_n_0\,
      S(2) => \index0_carry__2_i_2_n_0\,
      S(1) => \index0_carry__2_i_3_n_0\,
      S(0) => \index0_carry__2_i_4_n_0\
    );
\index0_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(16),
      O => \index0_carry__2_i_1_n_0\
    );
\index0_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(15),
      O => \index0_carry__2_i_2_n_0\
    );
\index0_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(14),
      O => \index0_carry__2_i_3_n_0\
    );
\index0_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(13),
      O => \index0_carry__2_i_4_n_0\
    );
\index0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \index0_carry__2_n_0\,
      CO(3) => \index0_carry__3_n_0\,
      CO(2) => \index0_carry__3_n_1\,
      CO(1) => \index0_carry__3_n_2\,
      CO(0) => \index0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => index(20 downto 17),
      O(3 downto 0) => index02_in(20 downto 17),
      S(3) => \index0_carry__3_i_1_n_0\,
      S(2) => \index0_carry__3_i_2_n_0\,
      S(1) => \index0_carry__3_i_3_n_0\,
      S(0) => \index0_carry__3_i_4_n_0\
    );
\index0_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(20),
      O => \index0_carry__3_i_1_n_0\
    );
\index0_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(19),
      O => \index0_carry__3_i_2_n_0\
    );
\index0_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(18),
      O => \index0_carry__3_i_3_n_0\
    );
\index0_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(17),
      O => \index0_carry__3_i_4_n_0\
    );
\index0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \index0_carry__3_n_0\,
      CO(3) => \index0_carry__4_n_0\,
      CO(2) => \index0_carry__4_n_1\,
      CO(1) => \index0_carry__4_n_2\,
      CO(0) => \index0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => index(24 downto 21),
      O(3 downto 0) => index02_in(24 downto 21),
      S(3) => \index0_carry__4_i_1_n_0\,
      S(2) => \index0_carry__4_i_2_n_0\,
      S(1) => \index0_carry__4_i_3_n_0\,
      S(0) => \index0_carry__4_i_4_n_0\
    );
\index0_carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(24),
      O => \index0_carry__4_i_1_n_0\
    );
\index0_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(23),
      O => \index0_carry__4_i_2_n_0\
    );
\index0_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(22),
      O => \index0_carry__4_i_3_n_0\
    );
\index0_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(21),
      O => \index0_carry__4_i_4_n_0\
    );
\index0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \index0_carry__4_n_0\,
      CO(3) => \index0_carry__5_n_0\,
      CO(2) => \index0_carry__5_n_1\,
      CO(1) => \index0_carry__5_n_2\,
      CO(0) => \index0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => index(28 downto 25),
      O(3 downto 0) => index02_in(28 downto 25),
      S(3) => \index0_carry__5_i_1_n_0\,
      S(2) => \index0_carry__5_i_2_n_0\,
      S(1) => \index0_carry__5_i_3_n_0\,
      S(0) => \index0_carry__5_i_4_n_0\
    );
\index0_carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(28),
      O => \index0_carry__5_i_1_n_0\
    );
\index0_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(27),
      O => \index0_carry__5_i_2_n_0\
    );
\index0_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(26),
      O => \index0_carry__5_i_3_n_0\
    );
\index0_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(25),
      O => \index0_carry__5_i_4_n_0\
    );
\index0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \index0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_index0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \index0_carry__6_n_2\,
      CO(0) => \index0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => index(30 downto 29),
      O(3) => \NLW_index0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => index02_in(31 downto 29),
      S(3) => '0',
      S(2) => \index0_carry__6_i_1_n_0\,
      S(1) => \index0_carry__6_i_2_n_0\,
      S(0) => \index0_carry__6_i_3_n_0\
    );
\index0_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(31),
      O => \index0_carry__6_i_1_n_0\
    );
\index0_carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(30),
      O => \index0_carry__6_i_2_n_0\
    );
\index0_carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(29),
      O => \index0_carry__6_i_3_n_0\
    );
index0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(4),
      O => index0_carry_i_1_n_0
    );
index0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(3),
      O => index0_carry_i_2_n_0
    );
index0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(2),
      O => index0_carry_i_3_n_0
    );
index0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(1),
      O => index0_carry_i_4_n_0
    );
\index[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => index(0),
      O => index02_in(0)
    );
\index[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => ss_IBUF,
      I1 => \b_miso1_carry__2_n_0\,
      I2 => \state_reg_n_0_[1]\,
      I3 => \state_reg_n_0_[0]\,
      O => index0
    );
\index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(0),
      Q => index(0),
      R => '0'
    );
\index_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(10),
      Q => index(10),
      R => '0'
    );
\index_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(11),
      Q => index(11),
      R => '0'
    );
\index_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(12),
      Q => index(12),
      R => '0'
    );
\index_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(13),
      Q => index(13),
      R => '0'
    );
\index_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(14),
      Q => index(14),
      R => '0'
    );
\index_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(15),
      Q => index(15),
      R => '0'
    );
\index_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(16),
      Q => index(16),
      R => '0'
    );
\index_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(17),
      Q => index(17),
      R => '0'
    );
\index_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(18),
      Q => index(18),
      R => '0'
    );
\index_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(19),
      Q => index(19),
      R => '0'
    );
\index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(1),
      Q => index(1),
      R => '0'
    );
\index_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(20),
      Q => index(20),
      R => '0'
    );
\index_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(21),
      Q => index(21),
      R => '0'
    );
\index_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(22),
      Q => index(22),
      R => '0'
    );
\index_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(23),
      Q => index(23),
      R => '0'
    );
\index_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(24),
      Q => index(24),
      R => '0'
    );
\index_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(25),
      Q => index(25),
      R => '0'
    );
\index_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(26),
      Q => index(26),
      R => '0'
    );
\index_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(27),
      Q => index(27),
      R => '0'
    );
\index_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(28),
      Q => index(28),
      R => '0'
    );
\index_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(29),
      Q => index(29),
      R => '0'
    );
\index_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(2),
      Q => index(2),
      R => '0'
    );
\index_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(30),
      Q => index(30),
      R => '0'
    );
\index_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(31),
      Q => index(31),
      R => '0'
    );
\index_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(3),
      Q => index(3),
      R => '0'
    );
\index_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(4),
      Q => index(4),
      R => '0'
    );
\index_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(5),
      Q => index(5),
      R => '0'
    );
\index_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(6),
      Q => index(6),
      R => '0'
    );
\index_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(7),
      Q => index(7),
      R => '0'
    );
\index_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(8),
      Q => index(8),
      R => '0'
    );
\index_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => index0,
      D => index02_in(9),
      Q => index(9),
      R => '0'
    );
\shift_reg_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(0),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(0)
    );
\shift_reg_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(10),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(10)
    );
\shift_reg_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(11),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(11)
    );
\shift_reg_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(12),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(12)
    );
\shift_reg_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(13),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(13)
    );
\shift_reg_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(14),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(14)
    );
\shift_reg_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(15),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(15)
    );
\shift_reg_reg[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      I2 => ss_IBUF,
      O => \shift_reg_reg[15]_i_1_n_0\
    );
\shift_reg_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(1),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(1)
    );
\shift_reg_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(2),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(2)
    );
\shift_reg_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(3),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(3)
    );
\shift_reg_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(4),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(4)
    );
\shift_reg_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(5),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(5)
    );
\shift_reg_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(6),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(6)
    );
\shift_reg_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(7),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(7)
    );
\shift_reg_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(8),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(8)
    );
\shift_reg_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => Q(9),
      G => \shift_reg_reg[15]_i_1_n_0\,
      GE => '1',
      Q => shift_reg(9)
    );
\state[1]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(20),
      I1 => index(21),
      O => \state[1]_i_10_n_0\
    );
\state[1]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(18),
      I1 => index(19),
      O => \state[1]_i_11_n_0\
    );
\state[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00020000"
    )
        port map (
      I0 => \state[1]_i_4_n_0\,
      I1 => \state[1]_i_5_n_0\,
      I2 => index(30),
      I3 => index(31),
      I4 => \state[1]_i_6_n_0\,
      I5 => \b_miso1_carry__2_n_0\,
      O => \state[1]_i_1__0_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \b_miso1_carry__2_n_0\,
      O => \state[1]_i_2_n_0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      I2 => ss_IBUF,
      O => \state[1]_i_3_n_0\
    );
\state[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => index(28),
      I1 => index(29),
      I2 => index(0),
      I3 => index(1),
      I4 => index(27),
      I5 => index(26),
      O => \state[1]_i_4_n_0\
    );
\state[1]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => index(2),
      I1 => index(3),
      O => \state[1]_i_5_n_0\
    );
\state[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \state[1]_i_7_n_0\,
      I1 => index(23),
      I2 => index(22),
      I3 => index(25),
      I4 => index(24),
      I5 => \state[1]_i_8_n_0\,
      O => \state[1]_i_6_n_0\
    );
\state[1]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \state[1]_i_9_n_0\,
      I1 => index(12),
      I2 => index(13),
      I3 => index(10),
      I4 => index(11),
      O => \state[1]_i_7_n_0\
    );
\state[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => index(16),
      I1 => index(17),
      I2 => index(14),
      I3 => index(15),
      I4 => \state[1]_i_10_n_0\,
      I5 => \state[1]_i_11_n_0\,
      O => \state[1]_i_8_n_0\
    );
\state[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => index(8),
      I1 => index(9),
      I2 => index(6),
      I3 => index(7),
      I4 => index(5),
      I5 => index(4),
      O => \state[1]_i_9_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \state[1]_i_1__0_n_0\,
      CLR => \state[1]_i_3_n_0\,
      D => \b_miso1_carry__2_n_0\,
      Q => \state_reg_n_0_[0]\
    );
\state_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \state[1]_i_1__0_n_0\,
      D => \state[1]_i_2_n_0\,
      PRE => \state[1]_i_3_n_0\,
      Q => \state_reg_n_0_[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SPI_topmodule is
  port (
    miso_OBUF : out STD_LOGIC;
    w_control_answer_reg_i_3_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    w_control_answer_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    ss_IBUF : in STD_LOGIC;
    w_control_answer : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \b_shift_reg[13]_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
end SPI_topmodule;

architecture STRUCTURE of SPI_topmodule is
  signal CHK_n_10 : STD_LOGIC;
  signal CHK_n_5 : STD_LOGIC;
  signal CHK_n_6 : STD_LOGIC;
  signal CHK_n_7 : STD_LOGIC;
  signal CHK_n_8 : STD_LOGIC;
  signal CHK_n_9 : STD_LOGIC;
  signal URECI_n_10 : STD_LOGIC;
  signal URECI_n_11 : STD_LOGIC;
  signal URECI_n_12 : STD_LOGIC;
  signal URECI_n_13 : STD_LOGIC;
  signal URECI_n_14 : STD_LOGIC;
  signal URECI_n_15 : STD_LOGIC;
  signal URECI_n_16 : STD_LOGIC;
  signal URECI_n_17 : STD_LOGIC;
  signal URECI_n_18 : STD_LOGIC;
  signal URECI_n_19 : STD_LOGIC;
  signal URECI_n_20 : STD_LOGIC;
  signal URECI_n_21 : STD_LOGIC;
  signal URECI_n_22 : STD_LOGIC;
  signal URECI_n_23 : STD_LOGIC;
  signal URECI_n_24 : STD_LOGIC;
  signal URECI_n_25 : STD_LOGIC;
  signal URECI_n_26 : STD_LOGIC;
  signal URECI_n_27 : STD_LOGIC;
  signal URECI_n_28 : STD_LOGIC;
  signal URECI_n_29 : STD_LOGIC;
  signal URECI_n_3 : STD_LOGIC;
  signal URECI_n_4 : STD_LOGIC;
  signal URECI_n_6 : STD_LOGIC;
  signal URECI_n_8 : STD_LOGIC;
  signal b_check_ready : STD_LOGIC;
  signal b_checksum : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b_data_controller_o : STD_LOGIC;
  signal b_shift : STD_LOGIC;
  signal \b_shift_reg[15]_i_6_n_0\ : STD_LOGIC;
  signal b_spi_sleep3_out : STD_LOGIC;
  signal b_spi_sleep_reg_i_11_n_0 : STD_LOGIC;
  signal b_spi_sleep_reg_i_7_n_0 : STD_LOGIC;
  signal b_start : STD_LOGIC;
  signal b_start0_out : STD_LOGIC;
  signal b_start_reg_i_14_n_0 : STD_LOGIC;
  signal b_to_checksum : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal b_transmit_buf : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal busy : STD_LOGIC;
  signal \data_controller_i_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal spi_sleep : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^w_control_answer_reg_i_3_0\ : STD_LOGIC;
  signal w_control_answer_reg_i_3_n_0 : STD_LOGIC;
  signal w_control_answer_reg_i_4_n_0 : STD_LOGIC;
  signal w_control_answer_reg_i_5_n_0 : STD_LOGIC;
  signal w_control_answer_reg_i_6_n_0 : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \b_data_controller_o_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_controller_o_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_controller_o_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_data_controller_o_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[9]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of b_spi_sleep_reg : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of b_spi_sleep_reg_i_7 : label is "soft_lutpair30";
  attribute XILINX_LEGACY_PRIM of b_start_reg : label is "LD";
  attribute SOFT_HLUTNM of b_start_reg_i_14 : label is "soft_lutpair30";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_transmit_buf_reg[9]\ : label is "LD";
begin
  w_control_answer_reg_i_3_0 <= \^w_control_answer_reg_i_3_0\;
CHK: entity work.SPI_checksum
     port map (
      D(3) => CHK_n_6,
      D(2) => CHK_n_7,
      D(1) => CHK_n_8,
      D(0) => CHK_n_9,
      Q(3 downto 0) => b_checksum(3 downto 0),
      b_check_ready => b_check_ready,
      b_ready_reg_0 => CHK_n_10,
      \b_segment_reg[3]_i_1_0\(15 downto 0) => b_to_checksum(15 downto 0),
      \b_shift_reg[15]_i_5\ => URECI_n_4,
      b_spi_sleep_reg_i_5 => CHK_n_5,
      b_start => b_start,
      state(1 downto 0) => state(1 downto 0)
    );
URECI: entity work.SPI_slave_reci
     port map (
      CLK => CLK,
      D(15) => URECI_n_12,
      D(14) => URECI_n_13,
      D(13) => URECI_n_14,
      D(12) => URECI_n_15,
      D(11) => URECI_n_16,
      D(10) => URECI_n_17,
      D(9) => URECI_n_18,
      D(8) => URECI_n_19,
      D(7) => URECI_n_20,
      D(6) => URECI_n_21,
      D(5) => URECI_n_22,
      D(4) => URECI_n_23,
      D(3) => URECI_n_24,
      D(2) => URECI_n_25,
      D(1) => URECI_n_26,
      D(0) => URECI_n_27,
      E(0) => b_data_controller_o,
      b_check_ready => b_check_ready,
      \b_data_controller_o_reg[3]_i_10_0\ => URECI_n_8,
      \b_data_controller_o_reg[3]_i_7_0\ => URECI_n_11,
      \b_shift_reg[13]\(5 downto 0) => \b_shift_reg[13]_0\(5 downto 0),
      \b_shift_reg[15]_i_2_0\ => CHK_n_5,
      \b_shift_reg[15]_i_8_0\(0) => b_shift,
      b_spi_sleep3_out => b_spi_sleep3_out,
      b_spi_sleep_reg => b_spi_sleep_reg_i_7_n_0,
      b_spi_sleep_reg_i_2_0 => CHK_n_10,
      b_spi_sleep_reg_i_5_0 => URECI_n_3,
      b_spi_sleep_reg_i_7 => \b_shift_reg[15]_i_6_n_0\,
      b_start => b_start,
      b_start0_out => b_start0_out,
      b_start_reg_i_13_0 => URECI_n_10,
      b_start_reg_i_9_0 => b_start_reg_i_14_n_0,
      b_start_reg_i_9_1 => b_spi_sleep_reg_i_11_n_0,
      busy => busy,
      spi_sleep => spi_sleep,
      ss => URECI_n_4,
      ss_0 => URECI_n_6,
      ss_1 => URECI_n_28,
      ss_2 => URECI_n_29,
      ss_IBUF => ss_IBUF,
      state(2 downto 0) => state(2 downto 0),
      w_control_answer => w_control_answer,
      \w_shift_reg[15]_0\(0) => D(0)
    );
UTRNS: entity work.SPI_slave_trns
     port map (
      CLK => CLK,
      Q(15 downto 0) => b_transmit_buf(15 downto 0),
      busy => busy,
      miso_OBUF => miso_OBUF,
      ss_IBUF => ss_IBUF
    );
\b_data_controller_o_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => CHK_n_9,
      G => b_data_controller_o,
      GE => '1',
      Q => Q(0)
    );
\b_data_controller_o_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => CHK_n_8,
      G => b_data_controller_o,
      GE => '1',
      Q => Q(1)
    );
\b_data_controller_o_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => CHK_n_7,
      G => b_data_controller_o,
      GE => '1',
      Q => Q(2)
    );
\b_data_controller_o_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => CHK_n_6,
      G => b_data_controller_o,
      GE => '1',
      Q => Q(3)
    );
\b_shift_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_27,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(0)
    );
\b_shift_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_17,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(10)
    );
\b_shift_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_16,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(11)
    );
\b_shift_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_15,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(12)
    );
\b_shift_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_14,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(13)
    );
\b_shift_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_13,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(14)
    );
\b_shift_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_12,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(15)
    );
\b_shift_reg[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABABBBAAAAAAAAA"
    )
        port map (
      I0 => b_spi_sleep_reg_i_7_n_0,
      I1 => URECI_n_8,
      I2 => state(2),
      I3 => URECI_n_6,
      I4 => state(1),
      I5 => ss_IBUF,
      O => \b_shift_reg[15]_i_6_n_0\
    );
\b_shift_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_26,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(1)
    );
\b_shift_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_25,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(2)
    );
\b_shift_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_24,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(3)
    );
\b_shift_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_23,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(4)
    );
\b_shift_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_22,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(5)
    );
\b_shift_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_21,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(6)
    );
\b_shift_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_20,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(7)
    );
\b_shift_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_19,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(8)
    );
\b_shift_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_18,
      G => b_shift,
      GE => '1',
      Q => b_to_checksum(9)
    );
b_spi_sleep_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_3,
      G => b_spi_sleep3_out,
      GE => '1',
      Q => spi_sleep
    );
b_spi_sleep_reg_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AABA"
    )
        port map (
      I0 => URECI_n_10,
      I1 => ss_IBUF,
      I2 => w_control_answer,
      I3 => spi_sleep,
      O => b_spi_sleep_reg_i_11_n_0
    );
b_spi_sleep_reg_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008AAA"
    )
        port map (
      I0 => state(1),
      I1 => spi_sleep,
      I2 => w_control_answer,
      I3 => URECI_n_11,
      I4 => b_spi_sleep_reg_i_11_n_0,
      O => b_spi_sleep_reg_i_7_n_0
    );
b_start_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => URECI_n_29,
      G => b_start0_out,
      GE => '1',
      Q => b_start
    );
b_start_reg_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => w_control_answer,
      I1 => spi_sleep,
      O => b_start_reg_i_14_n_0
    );
\b_transmit_buf_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(0),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(0)
    );
\b_transmit_buf_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(10),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(10)
    );
\b_transmit_buf_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(11),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(11)
    );
\b_transmit_buf_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(12),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(12)
    );
\b_transmit_buf_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(13),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(13)
    );
\b_transmit_buf_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(14),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(14)
    );
\b_transmit_buf_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(15),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(15)
    );
\b_transmit_buf_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(1),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(1)
    );
\b_transmit_buf_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(2),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(2)
    );
\b_transmit_buf_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_checksum(3),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(3)
    );
\b_transmit_buf_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(4),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(4)
    );
\b_transmit_buf_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(5),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(5)
    );
\b_transmit_buf_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(6),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(6)
    );
\b_transmit_buf_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(7),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(7)
    );
\b_transmit_buf_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(8),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(8)
    );
\b_transmit_buf_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => b_to_checksum(9),
      G => URECI_n_28,
      GE => '1',
      Q => b_transmit_buf(9)
    );
\data_controller_i_reg[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \data_controller_i_reg[15]_i_3_n_0\,
      I1 => \^w_control_answer_reg_i_3_0\,
      I2 => w_control_answer,
      I3 => w_control_answer_reg_i_3_n_0,
      O => E(0)
    );
\data_controller_i_reg[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5DFF0000"
    )
        port map (
      I0 => \data_controller_i_reg[15]_i_3_n_0\,
      I1 => \^w_control_answer_reg_i_3_0\,
      I2 => w_control_answer,
      I3 => w_control_answer_reg_i_3_n_0,
      I4 => spi_sleep,
      O => \data_controller_i_reg[15]_i_3_n_0\
    );
w_control_answer_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2F"
    )
        port map (
      I0 => \^w_control_answer_reg_i_3_0\,
      I1 => w_control_answer,
      I2 => w_control_answer_reg_i_3_n_0,
      O => \^w_control_answer_reg_i_3_0\
    );
w_control_answer_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0E0EFE0"
    )
        port map (
      I0 => w_control_answer_reg_i_4_n_0,
      I1 => w_control_answer_reg_i_5_n_0,
      I2 => spi_sleep,
      I3 => w_control_answer_reg_i_6_n_0,
      I4 => w_control_answer,
      O => w_control_answer_reg
    );
w_control_answer_reg_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"75FF"
    )
        port map (
      I0 => w_control_answer_reg_i_3_n_0,
      I1 => w_control_answer,
      I2 => \^w_control_answer_reg_i_3_0\,
      I3 => \data_controller_i_reg[15]_i_3_n_0\,
      O => w_control_answer_reg_i_3_n_0
    );
w_control_answer_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
        port map (
      I0 => w_control_answer_reg_i_4_n_0,
      I1 => w_control_answer_reg_i_5_n_0,
      I2 => spi_sleep,
      I3 => w_control_answer_reg_i_6_n_0,
      O => w_control_answer_reg_i_4_n_0
    );
w_control_answer_reg_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => spi_sleep,
      I1 => w_control_answer_reg_i_5_n_0,
      I2 => w_control_answer_reg_i_4_n_0,
      O => w_control_answer_reg_i_5_n_0
    );
w_control_answer_reg_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAAE"
    )
        port map (
      I0 => w_control_answer_reg_i_6_n_0,
      I1 => spi_sleep,
      I2 => w_control_answer_reg_i_5_n_0,
      I3 => w_control_answer_reg_i_4_n_0,
      I4 => w_control_answer,
      O => w_control_answer_reg_i_6_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CONTROLLER is
  port (
    clk : in STD_LOGIC;
    sck : in STD_LOGIC;
    ss : in STD_LOGIC;
    mosi : in STD_LOGIC;
    miso : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of CONTROLLER : entity is true;
end CONTROLLER;

architecture STRUCTURE of CONTROLLER is
  signal SPI_n_1 : STD_LOGIC;
  signal SPI_n_6 : STD_LOGIC;
  signal b_shift : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal data_controller_i : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal \data_controller_i_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \data_controller_i_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \data_controller_i_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \data_controller_i_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \data_controller_i_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \data_controller_i_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal data_controller_o : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal miso_OBUF : STD_LOGIC;
  signal mosi_IBUF : STD_LOGIC;
  signal sck_IBUF : STD_LOGIC;
  signal sck_IBUF_BUFG : STD_LOGIC;
  signal ss_IBUF : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal w_control_answer : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \b_shift_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \data_controller_i_reg[12]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_controller_i_reg[12]_i_1\ : label is "soft_lutpair33";
  attribute XILINX_LEGACY_PRIM of \data_controller_i_reg[15]\ : label is "LD";
  attribute SOFT_HLUTNM of \data_controller_i_reg[15]_i_1\ : label is "soft_lutpair32";
  attribute XILINX_LEGACY_PRIM of \data_controller_i_reg[4]\ : label is "LD";
  attribute SOFT_HLUTNM of \data_controller_i_reg[4]_i_1\ : label is "soft_lutpair31";
  attribute XILINX_LEGACY_PRIM of \data_controller_i_reg[5]\ : label is "LD";
  attribute SOFT_HLUTNM of \data_controller_i_reg[5]_i_1\ : label is "soft_lutpair32";
  attribute XILINX_LEGACY_PRIM of \data_controller_i_reg[8]\ : label is "LD";
  attribute SOFT_HLUTNM of \data_controller_i_reg[8]_i_1\ : label is "soft_lutpair31";
  attribute XILINX_LEGACY_PRIM of \data_controller_i_reg[9]\ : label is "LD";
  attribute SOFT_HLUTNM of \data_controller_i_reg[9]_i_1\ : label is "soft_lutpair33";
  attribute XILINX_LEGACY_PRIM of w_control_answer_reg : label is "LD";
begin
SPI: entity work.SPI_topmodule
     port map (
      CLK => sck_IBUF_BUFG,
      D(0) => mosi_IBUF,
      E(0) => state(0),
      Q(3 downto 0) => data_controller_o(3 downto 0),
      \b_shift_reg[13]_0\(5) => data_controller_i(15),
      \b_shift_reg[13]_0\(4) => data_controller_i(12),
      \b_shift_reg[13]_0\(3 downto 2) => data_controller_i(9 downto 8),
      \b_shift_reg[13]_0\(1 downto 0) => data_controller_i(5 downto 4),
      miso_OBUF => miso_OBUF,
      ss_IBUF => ss_IBUF,
      w_control_answer => w_control_answer,
      w_control_answer_reg => SPI_n_6,
      w_control_answer_reg_i_3_0 => SPI_n_1
    );
\b_shift_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => data_controller_o(0),
      G => state(0),
      GE => '1',
      Q => b_shift(0)
    );
\b_shift_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => data_controller_o(1),
      G => state(0),
      GE => '1',
      Q => b_shift(1)
    );
\b_shift_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => data_controller_o(2),
      G => state(0),
      GE => '1',
      Q => b_shift(2)
    );
\b_shift_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => data_controller_o(3),
      G => state(0),
      GE => '1',
      Q => b_shift(3)
    );
\data_controller_i_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \data_controller_i_reg[12]_i_1_n_0\,
      G => state(0),
      GE => '1',
      Q => data_controller_i(12)
    );
\data_controller_i_reg[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => b_shift(2),
      I1 => b_shift(3),
      O => \data_controller_i_reg[12]_i_1_n_0\
    );
\data_controller_i_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \data_controller_i_reg[15]_i_1_n_0\,
      G => state(0),
      GE => '1',
      Q => data_controller_i(15)
    );
\data_controller_i_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F20"
    )
        port map (
      I0 => b_shift(0),
      I1 => b_shift(1),
      I2 => b_shift(3),
      I3 => b_shift(2),
      O => \data_controller_i_reg[15]_i_1_n_0\
    );
\data_controller_i_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \data_controller_i_reg[4]_i_1_n_0\,
      G => state(0),
      GE => '1',
      Q => data_controller_i(4)
    );
\data_controller_i_reg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFF0"
    )
        port map (
      I0 => b_shift(1),
      I1 => b_shift(2),
      I2 => b_shift(3),
      I3 => b_shift(0),
      O => \data_controller_i_reg[4]_i_1_n_0\
    );
\data_controller_i_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \data_controller_i_reg[5]_i_1_n_0\,
      G => state(0),
      GE => '1',
      Q => data_controller_i(5)
    );
\data_controller_i_reg[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => b_shift(3),
      I1 => b_shift(0),
      O => \data_controller_i_reg[5]_i_1_n_0\
    );
\data_controller_i_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \data_controller_i_reg[8]_i_1_n_0\,
      G => state(0),
      GE => '1',
      Q => data_controller_i(8)
    );
\data_controller_i_reg[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFB0"
    )
        port map (
      I0 => b_shift(2),
      I1 => b_shift(0),
      I2 => b_shift(3),
      I3 => b_shift(1),
      O => \data_controller_i_reg[8]_i_1_n_0\
    );
\data_controller_i_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \data_controller_i_reg[9]_i_1_n_0\,
      G => state(0),
      GE => '1',
      Q => data_controller_i(9)
    );
\data_controller_i_reg[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => b_shift(3),
      I1 => b_shift(1),
      O => \data_controller_i_reg[9]_i_1_n_0\
    );
miso_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => miso_OBUF,
      O => miso
    );
mosi_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => mosi,
      O => mosi_IBUF
    );
sck_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => sck_IBUF,
      O => sck_IBUF_BUFG
    );
sck_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sck,
      O => sck_IBUF
    );
ss_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => ss,
      O => ss_IBUF
    );
w_control_answer_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => SPI_n_1,
      G => SPI_n_6,
      GE => '1',
      Q => w_control_answer
    );
end STRUCTURE;
