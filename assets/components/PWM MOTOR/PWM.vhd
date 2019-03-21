----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/14/2019 12:07:31 PM
-- Design Name:
-- Module Name: PWM - Behavioral
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

entity PWM is
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
    chip_enable         : out std_logic := '1';
    emergency_stop      : in std_logic := '0'
    );
end PWM;

architecture Behavioral of PWM is

    component motor_stateFreq is
        generic (
            clk_freq    : integer := 10000
        );
        port (
            clk_in      : in  std_logic;
            clk_out     : out std_logic
        );
    end component;

    -- this pwm is inverted!!!!
    constant act_pwm     : std_logic := '0';
    constant deact_pwm   : std_logic := '1';

    constant forward     : std_logic := '1';
    constant backward    : std_logic := '0';

    type MOTOR_PAT       is (FORW, BACKW);
    type PWM_DIR         is (UP, DOWN);
    signal motor_state   : MOTOR_PAT := FORW;
    signal dir_state     : PWM_DIR   := UP;

    signal i_pwm_counter : integer range 0 to pwm_max_val-1 := 0;
    signal i_shift       : integer range 0 to pwm_max_val-1 := 0;

    signal w_pwm_clk     : std_logic := '0';

    begin

    ja(0) <= act_pwm when (i_pwm_counter < i_shift and motor_state = FORW and not emergency_stop) or (i_pwm_counter = pwm_max_val-1 and motor_state = FORW and i_shift = pwm_max_val-1 and not emergency_stop) else deact_pwm;
    ja(1) <= act_pwm when (i_pwm_counter < i_shift and motor_state = BACKW and not emergency_stop) or (i_pwm_counter = pwm_max_val-1 and motor_state = BACKW and i_shift = pwm_max_val-1 and not emergency_stop) else deact_pwm;
    chip_enable     <= '1';

    process(ready) begin
        if rising_edge(ready) then
            i_shift <= to_integer(unsigned(pwm_set));
            if direction = forward then
                motor_state <= FORW;
            else
                motor_state <= BACKW;
            end if;
        end if;
    end process;

    process(w_pwm_clk)
    variable v_i_pwm_counter : integer range 0 to pwm_max_val-1;
    begin
        if rising_edge(w_pwm_clk) then
                case( dir_state ) is
                    when UP =>
                        if ( i_pwm_counter = pwm_max_val-2 ) then
                                i_pwm_counter <= i_pwm_counter + 1;
                                dir_state <= DOWN;
                        elsif ( i_pwm_counter <= pwm_max_val-1 ) then
                                i_pwm_counter <= i_pwm_counter + 1;
                                dir_state <= UP;
                        end if;
                    when DOWN =>
                        if ( i_pwm_counter = 1 ) then
                                i_pwm_counter <= i_pwm_counter - 1;
                                dir_state <= UP;
                        elsif ( i_pwm_counter >= 0 ) then
                                i_pwm_counter <= i_pwm_counter - 1;
                                dir_state <= DOWN;
                        end if;
                    when others => dir_state <= DOWN;
                end case;
        end if;
    end process;


    UT : motor_stateFreq
    generic map(clk_freq => pwm_freq)
    port map (clk_in => clk, clk_out => w_pwm_clk);


end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity motor_stateFreq is
    generic (
        clk_freq    : integer := 10000
    );
    port (
        clk_in      : in  std_logic;
        clk_out     : out std_logic
    );
end motor_stateFreq;

architecture Behavioral of motor_stateFreq is

    constant clkmax : integer := (100000000 / clk_freq)-1;

    signal temporal : std_logic := '0';

    signal counter  : integer range 0 to clkmax := 0;

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
