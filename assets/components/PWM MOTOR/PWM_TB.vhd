----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 03:11:29 PM
-- Design Name: 
-- Module Name: PWM_TB - Behavioral
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

entity PWM_TB is
end PWM_TB;

architecture Behavioral of PWM_TB is

component PWM is
    generic(
        pwm_max_val         : integer := 128;
        pwm_freq            : integer := 10000
    );
    port(
        ready               : in std_logic;
        clk                 : in std_logic;
        pwm_set             : in std_logic_vector(6 downto 0);
        direction           : in std_logic;
        ja                  : out std_logic_vector(1 downto 0);
        chip_enable         : out std_logic := '1'
    );
end component;

    signal w_ready               : std_logic := '0';
    signal w_clk                 : std_logic := '0';
    signal w_pwm_set             : std_logic_vector(6 downto 0);
    signal w_direction           : std_logic;
    signal w_ja                  : std_logic_vector(1 downto 0);
    signal w_chip_enable         : std_logic := '1';

begin

   clk_process :process
   constant clk_period : time := 2 ns; 
   begin
        w_clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        w_clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
   
   UU: process 
   constant clk_period : time := 5ns;
   begin
   
   w_pwm_set <= "0000000";
   w_direction <= '1';
   w_ready <= '0';
   wait for clk_period;
   w_ready <= '1';
   wait for clk_period;
   w_ready <= '0';
   wait;
   end process;
   
    
    
DUT : PWM 
    
    generic map(pwm_freq => 100000000)
    port map( ready => w_ready, clk => w_clk, pwm_set => w_pwm_set, direction => w_direction, ja => w_ja, chip_enable => w_chip_enable );


end Behavioral;
