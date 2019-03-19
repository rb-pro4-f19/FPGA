----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2019 08:09:28 PM
-- Design Name: 
-- Module Name: TOP_test - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_test is
port(
    clk                 :   in  std_logic;
    sck                 :   in  std_logic;
    ss                  :   in  std_logic;
    mosi                :   in std_logic;
    miso                :   out  std_logic;
    led                 :   out std_logic_vector(15 downto 0)
);
end TOP_test;

architecture Behavioral of TOP_test is

component SPI_topmodule is
port(
    clk                         :   in  std_logic;
    sck                         :   in  std_logic;
    ss                          :   in  std_logic;
    mosi                        :   in  std_logic;
    miso                        :   out std_logic                        := '0';
    ctrl_reply                  :   in  std_logic;
    spi_ready                   :   out std_logic                        := '0';
    data_controller_i           :   in  std_logic_vector(15 downto 0);
    data_controller_o           :   out std_logic_vector(15 downto 0)    := (others => '0')
    );
end component;

    
    signal data_controller_o : std_logic_vector(15 downto 0);
    signal data_controller_i : std_logic_vector(15 downto 0);
    signal ctrl_reply : std_logic;
    signal spi_ready : std_logic;
    

begin

    data_controller_i <= "1010101010101010";
    ctrl_reply <= '1';
    led(15) <= spi_ready;
    led(14 downto 0) <= data_controller_o(14 downto 0);

    SPI: SPI_TOPMODULE
    port map(
             clk => clk,
             sck => sck,
             ss => ss,
             mosi => mosi,
             miso => miso,
             data_controller_i => data_controller_i,
             data_controller_o => data_controller_o,
             ctrl_reply => ctrl_reply,
             spi_ready => spi_ready
             );

end Behavioral;
