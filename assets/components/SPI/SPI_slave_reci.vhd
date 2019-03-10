----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/04/2019 07:28:51 PM
-- Design Name:
-- Module Name: SPL_slave - Behavioral
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

entity SPI_slave_reci is
port(
sck     :   in  std_logic;
ss      :   in  std_logic;
mosi    :   in  std_logic;
data    :   out std_logic_vector(15 downto 0) := x"0000";
busy    :   out std_logic := '0';
ready   :   out std_logic := '1'
);
end SPI_slave_reci;

architecture Behavioral of SPI_slave_reci is

type enable_spi     is (ENB, DIS, WAITING);

signal state        :   enable_spi := ENB;

signal index        :   integer := 15;
signal b_data       :   std_logic_vector (15 downto 0) := x"0000";
signal b_shift      :   std_logic_vector (15 downto 0) := x"0000";
signal b_ready      :   std_logic := '1';
signal b_busy       :   std_logic := '0';

begin
--------------------------------------------------------------------------------
data <= b_data;
busy <= b_busy;
ready <= b_ready;
--------------------------------------------------------------------------------
process(sck, ss)
begin
case( state ) is
    when ENB =>
        if (ss = '0') then
            b_busy <= '1';
            b_ready <= '0';
            index <= 15;
            b_shift <= x"0000";
            state <= DIS;
        else
            state <= ENB;
    end if;

    when DIS =>
        if (ss = '0') then
            if(rising_edge(sck)) then
                if (index >= 1) then
                    b_shift(index) <= mosi;
                    index <= index - 1;
                    state <= DIS;
                elsif (index = 0) then
                    b_shift(index) <= mosi;
                    state <= WAITING;
                end if;
            end if;
        else
            b_shift <= x"0000";
            state <= WAITING;
        end if;

    when WAITING =>
        if(ss = '1') then
            b_data <= b_shift;
            b_busy <= '0';
            b_ready <= '1';
            state <= ENB;
        end if;

end case;

end process;
end Behavioral;
