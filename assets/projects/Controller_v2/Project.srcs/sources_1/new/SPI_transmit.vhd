----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2019 11:45:52 PM
-- Design Name: 
-- Module Name: SPI_transmit - Behavioral
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

library SPI;
use SPI.package_spi.ALL;

entity SPI_transmit is
port(
    clk         : in std_logic;
    ss          : out std_logic;
    sck         : out std_logic;
    mosi        : in std_logic;
    busy        : out std_logic;
    data        : in std_logic_vector(15 downto 0)
    );
end SPI_transmit;

architecture Behavioral of SPI_transmit is

    type transmit_spi is (IDLE, TRANSMIT, STOP);
    signal state : transmit_spi := IDLE;
    signal clk10KHz : std_logic := '0';

begin
    
    -- UPPER FSM --
    process(clk) 
    
    variable shift : std_logic_vector(15 downto 0);
    
    begin
    
    if clk'event and clk='1' then
    
    
    end if;
    
    
    end process;
    
    
u1: clkdivision
    generic map(clk_freq => 10000)
    port map(clk_in => clk, clk_out => clk10KHz);

end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkdivision is
    generic (
        clk_freq    : integer := 10000
    );
    port (
        clk_in      : in  std_logic;
        clk_out     : out std_logic
    );
end clkdivision;

architecture Behavioral of clkdivision is

    constant clkmax : natural := (100000000 / clk_freq)-1;
    signal temporal : std_logic := '0';
    signal counter  : natural range 0 to clkmax := 0;

begin

process (clk_in) begin
        if rising_edge(clk_in) then
            if (counter = clkmax) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_out <= temporal;
end Behavioral;
