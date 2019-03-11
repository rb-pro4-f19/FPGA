----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2019 02:19:09 PM
-- Design Name: 
-- Module Name: clk10MHz - Behavioral
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

entity clk10MHz is
    Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clk10MHz;

architecture Behavioral of clk10MHz is

    signal temporal: STD_LOGIC := '0';
    signal counter : integer range 0 to 9 := 0;
    
begin

process (clk_in) begin
        if rising_edge(clk_in) then
            if (counter = 9) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_out <= temporal;
end Behavioral;
