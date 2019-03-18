-- Package Declaration Section
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package package_controller is

    constant CTRL           :   std_logic_vector(3 downto 0) := "0000";
    constant PWM_1          :   std_logic_vector(3 downto 0) := "0001";
    constant PWM_2          :   std_logic_vector(3 downto 0) := "0010";

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
    
    component PMOD_enc is
        port(
        signal clk          : in std_logic;
        signal a            : in std_logic;
        signal b            : in std_logic;
        signal reset        : in std_logic;
        signal data         : out std_logic_vector(11 downto 0)
        );
    end component;

end package package_controller;

-- Package Body Section
package body package_controller is

end package body package_controller;
