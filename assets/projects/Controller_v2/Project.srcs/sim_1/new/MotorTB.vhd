----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2019 08:18:20 PM
-- Design Name: 
-- Module Name: MotorTB - Behavioral
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

entity MotorTB is
--  Port ( );
end MotorTB;

architecture Behavioral of MotorTB is

component PWM is
    generic(

        pwm_max_val         : integer := 128;
        pwm_freq            : integer := 10000

    );
    port(

        stop_btn            : in std_logic;
        ready               : in std_logic;
        clk                 : in std_logic;
        pwm_set             : in std_logic_vector(6 downto 0);
        direction           : in std_logic;
        ja                  : out std_logic_vector(1 downto 0);
        chip_enable         : out std_logic := '1'

    );
end component;
        
        signal stop_btn     : std_logic;
        signal ready        : std_logic := '1';
        signal clk          : std_logic := '1';
        signal pwm_set      : std_logic_vector(6 downto 0);
        signal direction    : std_logic;
        signal ja           : std_logic_vector(1 downto 0);
        signal chip_enable  : std_logic := '1';


begin

process
constant period: time := 1 ns;
begin
    wait for period;
    clk <= not(clk);
end process;

process
constant period: time := 1000 ns;
begin
    wait for period;
    ready <= not(ready);
end process;

    pwm_set <= "0000000";
    --stop_btn <= '1';
    stop_btn <= '0';
    direction <= '1';

DUT: PWM 
    generic map(pwm_freq => 100000000)
    port map(stop_btn => stop_btn, ready => ready, clk => clk, pwm_set => pwm_set, direction => direction, ja => ja, chip_enable => chip_enable);


end Behavioral;
