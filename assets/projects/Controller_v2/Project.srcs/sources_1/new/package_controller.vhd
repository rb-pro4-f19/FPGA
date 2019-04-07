-- Package Declaration Section
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package package_controller is

    constant CTRL                : std_logic_vector(3 downto 0) := "0000";
    constant MOT_0               : std_logic_vector(3 downto 0) := "0001";
    constant MOT_1               : std_logic_vector(3 downto 0) := "0010";
    constant ENC_0               : std_logic_vector(3 downto 0) := "0011";
    constant ENC_1               : std_logic_vector(3 downto 0) := "0100";
    constant HALL_0              : std_logic_vector(3 downto 0) := "0101";
    constant HALL_1              : std_logic_vector(3 downto 0) := "0110";
    constant CUR_0               : std_logic_vector(3 downto 0) := "0111";
    constant CUR_1               : std_logic_vector(3 downto 0) := "1000";
    constant FREQ                : std_logic_vector(3 downto 0) := "1001";
    constant RETX                : std_logic_vector(3 downto 0) := "1111";
    constant TURNOFF             : std_logic_vector(7 downto 0) := x"0B";

    component MOTOR is
        port(

             freq                : in std_logic_vector(6 downto 0) := "0001010";
             stop                : in std_logic;
             ready               : in std_logic;
             clk                 : in std_logic;
             pwm                 : in std_logic_vector(6 downto 0);
             dir                 : in std_logic;
             mot_out             : out std_logic_vector(1 downto 0);
             CE                  : out std_logic := '0'

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


    component HALLSENSOR is
        port(

            clk                 : in  STD_LOGIC;
            hall_in             : in STD_LOGIC;
            hall_out            : out STD_LOGIC;
            hall_read           : in STD_LOGIC

            );
    end component;

    component RotENC is
        port(

            clk                : in STD_LOGIC;
            Ain                : in STD_LOGIC;
			Bin                : in STD_LOGIC;
            encoder_read       : in STD_LOGIC;
            encoder_out        : out STD_LOGIC_VECTOR(11 downto 0)

            );
    end component;

end package package_controller;

-- Package Body Section
package body package_controller is

end package body package_controller;
