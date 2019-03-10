----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/06/2019 09:21:32 AM
-- Design Name:
-- Module Name: CONTROLLER - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROLLER is
    port(
    clk                     :   in  std_logic;
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    mosi                    :   in  std_logic;
    miso                    :   out std_logic
    );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

type MODE   is (IDLE, REPLY, WAITING);

signal state                :   MODE   := IDLE;

signal data_controller_i    :   std_logic_vector(15 downto 0);
signal data_controller_o    :   std_logic_vector(15 downto 0);
signal w_control_answer     :   std_logic := '0';
signal b_spi_sleep          :   std_logic := '0';
signal b_miso               :   std_logic;
signal b_shift              :   std_logic_vector( 15 downto 0);

component SPI_topmodule is
port(
    clk                     :   in  std_logic;
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    mosi                    :   in  std_logic;
    control_answer          :   in  std_logic;
    data_controller_i       :   in  std_logic_vector(15 downto 0) := x"0000";
    miso                    :   out std_logic;
    data_controller_o       :   out std_logic_vector(15 downto 0) := x"0000";
    spi_sleep               :   out std_logic := '0'
    );
end component;
--------------------------------------------------------------------------------
    begin
--------------------------------------------------------------------------------

    miso <= b_miso;

    process(clk, b_spi_sleep)
    begin
         case( state ) is
                when IDLE =>
                    if (b_spi_sleep = '1') then
                        w_control_answer <= '0';
                        b_shift <= data_controller_o;
                        state <= REPLY;
                    else
                        state <= IDLE;
                    end if;

                when REPLY =>
                    if( b_shift(3 downto 0) = "0000" ) then
                        data_controller_i <= x"0000";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0001" ) then
                        data_controller_i <= x"00F0";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0010" ) then
                        data_controller_i <= x"0F00";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0011" ) then
                        data_controller_i<= x"0FF0";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0100" ) then
                        data_controller_i <= x"F000";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0101" ) then
                        data_controller_i <= x"F0F0";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0110" ) then
                        data_controller_i <= x"FF00";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "0111" ) then
                        data_controller_i <= x"FFF0";
                        state <= WAITING;
                    elsif( b_shift(3 downto 0) = "1001" ) then
                        data_controller_i <= x"AAA0";
                        state <= WAITING;
                    else
                        data_controller_i <= x"0FF0";
                        state <= WAITING;
                    end if;

                when WAITING =>
                    if ( w_control_answer = '0' ) then                        -- send this data
                        w_control_answer <= '1';
                        state <= WAITING;
                    else
                        state <= IDLE;
                    end if;
            end case;
    end process;
--------------------------------------------------------------------------------
    SPI: SPI_TOPMODULE
    port map(clk => clk,
             sck => sck,
             ss => ss,
             mosi => mosi,
             miso => b_miso,
             data_controller_i => data_controller_i,
             data_controller_o => data_controller_o,
             control_answer => w_control_answer,
             spi_sleep => b_spi_sleep
             );

end Behavioral;
