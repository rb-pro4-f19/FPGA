----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/14/2019 12:07:31 PM
-- Design Name:
-- Module Name: MOTOR - Behavioral
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
use IEEE.numeric_std.all;

entity MOTOR is
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
end MOTOR;

architecture Behavioral of MOTOR is

component MOTOR_FREQ is
    port(

        freq                 : in  std_logic_vector(6 downto 0) := "0001010";
        clk_in               : in  std_logic;
        clk_out              : out std_logic

        );
end component;

constant ten_ms              : integer                          := (100000000 / 100) - 1;

type MOTOR_PAT               is (FORW, BACKW);
signal motor_state           : MOTOR_PAT := FORW;

type COUNT_DIRECTION         is (UP, DOWN);
signal dir_state             : COUNT_DIRECTION                  := UP;

signal i_counter             : integer range 0 to 127           := 0;
signal i_pwm                 : integer range 0 to 127           := 0;

signal w_CE                  : std_logic                        := '1';
signal w_motor_clk           : std_logic                        := '0';

signal watchdog              : std_logic                        := '1';
signal w_freq                : std_logic_vector(6 downto 0);

begin

mot_out(0) <= '0' when ( ( ( i_counter < i_pwm and motor_state = FORW ) or
 ( i_counter = 127 and motor_state = FORW and i_pwm = 127 ) ) and watchdog = '1') else '1';

mot_out(1) <= '0' when ( ( ( i_counter < i_pwm and motor_state = BACKW ) or
 ( i_counter = 127 and motor_state = BACKW and i_pwm = 127 ) ) and watchdog = '1' ) else '1';

CE <= w_CE when (watchdog = '1') else '0';

w_freq <= freq;

-- watchdog

WD: process(clk)

    variable watchdog_counter : integer := ten_ms;

begin

    if rising_edge(clk) then

        if ready = '1' then

            watchdog_counter := ten_ms;

        else

            if ( 0 >= watchdog_counter ) then

                watchdog <= '0';

            else

                watchdog <= '1';
                watchdog_counter := watchdog_counter - 1;

            end if;

        end if;

    end if;

end process;

-- upper FSM --

process(ready) begin

    if rising_edge(ready) then

        if ( stop = '1' ) then

            w_CE <= '0';
            i_pwm <= 0;

        else

            w_CE <= '1';
            i_pwm <= to_integer(unsigned(pwm));

        end if;

        if ( dir = '0' ) then

            motor_state <= FORW;

        else

            motor_state <= BACKW;

        end if;

    end if;

end process;

-- lower FSM --

process(w_motor_clk)

begin

    if rising_edge(w_motor_clk) then

            case( dir_state ) is

                when UP =>

                    if ( i_counter = 126 ) then

                            i_counter <= i_counter + 1;

                            dir_state <= DOWN;

                    elsif ( i_counter <= 125 ) then

                            i_counter <= i_counter + 1;

                            dir_state <= UP;
                    end if;

                when DOWN =>

                    if ( i_counter = 1 ) then

                            i_counter <= i_counter - 1;

                            dir_state <= UP;

                    elsif ( i_counter >= 2 ) then

                            i_counter <= i_counter - 1;

                            dir_state <= DOWN;
                    end if;

                when others =>

                    dir_state <= DOWN;

            end case;

    end if;

end process;


UT : MOTOR_FREQ
port map (clk_in => clk, clk_out => w_motor_clk, freq => w_freq);

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library SPI;
use SPI.package_motor.all;

entity MOTOR_FREQ is
    port(

        freq        : in  std_logic_vector(6 downto 0) := "0001010";
        clk_in      : in  std_logic;
        clk_out     : out std_logic

        );
end MOTOR_FREQ;

architecture Behavioral of MOTOR_FREQ is

    signal temp     : std_logic := '0';
    signal counter  : integer := 0;

    begin

    clk_out <= temp;

    process (clk_in) begin

        if rising_edge(clk_in) then

            if ( counter >= (RAM_M(to_integer(unsigned(freq(6 downto 0))))) ) then

                temp <= NOT( temp );
                counter <= 0;

            else

                counter <= counter + 1;

            end if;

        end if;

    end process;

end Behavioral;
