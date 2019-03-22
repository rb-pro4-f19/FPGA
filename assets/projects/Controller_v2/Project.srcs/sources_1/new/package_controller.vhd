-- Package Declaration Section
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package package_controller is

    constant CTRL                : std_logic_vector(3 downto 0) := "0000";
    constant PWM_1               : std_logic_vector(3 downto 0) := "0001";
    constant PWM_2               : std_logic_vector(3 downto 0) := "0010";
    constant ENC_1               : std_logic_vector(3 downto 0) := "0011";
    constant ENC_2               : std_logic_vector(3 downto 0) := "0100";
    constant HALL_1              : std_logic_vector(3 downto 0) := "0101";
    constant HALL_2              : std_logic_vector(3 downto 0) := "0110";
    constant CUR_1               : std_logic_vector(3 downto 0) := "0111";
    constant CUR_2               : std_logic_vector(3 downto 0) := "1000";

    constant TURNOFF             : std_logic_vector(7 downto 0) := x"0B";

    component MOTOR is
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
             motor_o             : out std_logic_vector(1 downto 0);
             chip_enable         : out std_logic := '0'

            );
    end component;

    component ENCODER is
        port(

            clk                  : in std_logic;
            enc_a                : in std_logic;
            enc_b                : in std_logic;
            reset                : in std_logic;
            data                 : out std_logic_vector(11 downto 0)

        );
    end component;



end package package_controller;

-- Package Body Section
package body package_controller is

end package body package_controller;
