----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/07/2019 02:28:50 PM
-- Design Name:
-- Module Name: SPI_tb_topactual - Behavioral
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

entity Controller_TB is
end Controller_TB;

architecture Behavioral of Controller_TB is
----------------------------------------------------------------------------------
component CONTROLLER is
port(
    clk                     :   in  std_logic;
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    mosi                    :   in  std_logic;
    miso                    :   out std_logic
);
end component;
--------------------------------------------------------------------------------
    signal s_clk         :  std_logic := '0';
--------------------------------------------------------------------------------
    signal b_sck         :  std_logic := '0';
    signal b_ss          :  std_logic := '1';
    signal b_mosi        :  std_logic := '0';
    signal b_miso        :  std_logic;
-------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
clk : process
constant period: time := 1 ns;
begin
    wait for period;
    s_clk <= '1';
    s_clk <= not(s_clk);
end process;

sim : process
constant period: time := 2 ns;
begin
    b_sck <= '0';
    b_ss <= '1';
    b_mosi <= '0';

    wait for 200 ns;

    b_ss <= '0';

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    -- 1000

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    -- 1110

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    -- 1000

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_ss <= '1';

    b_mosi <= '0';
    wait for 600 ns;

    ------------------------------------------

    b_ss <= '0';

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    -- 1000

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    -- 1110

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    -- 1000

    b_mosi <= '1';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_mosi <= '0';
    wait for 300 ns;
    b_sck <= not(b_sck); -- rising edge
    wait for 300 ns;
    b_sck <= not(b_sck); -- falling edge

    b_ss <= '1';
    wait;
end process;

TB_TOP : controller
port map(clk => s_clk, sck => b_sck, ss => b_ss, mosi => b_mosi, miso => b_miso);

end Behavioral;
