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
end MOTOR;

architecture Behavioral of MOTOR is

    component MOTOR_FREQ is
        generic (

            clk_freq    : integer := 10000

        );
        port (

            clk_in      : in  std_logic;
            clk_out     : out std_logic

        );
    end component;

    --
    constant activate    : std_logic := '0';
    constant deactivate  : std_logic := '1';

    constant forward     : std_logic := '1';
    constant backward    : std_logic := '0';

    type MOTOR_PAT       is (FORW, BACKW);
    signal motor_state   : MOTOR_PAT := FORW;

    type COUNT_DIRECTION is (UP, DOWN);
    signal dir_state     : COUNT_DIRECTION   := UP;

    signal i_counter     : integer range 0 to pwm_max_val-1 := 0;
    signal i_shift       : integer range 0 to pwm_max_val-1 := 0;
    
    signal w_CE          : std_logic := '0';
    signal w_motor_clk   : std_logic := '0';

    begin

    motor_o(0) <= activate when (i_counter < i_shift and motor_state = FORW) or
     (i_counter = pwm_max_val-1 and motor_state = FORW and i_shift = pwm_max_val-1) else deactivate;

    motor_o(1) <= activate when (i_counter < i_shift and motor_state = BACKW) or
     (i_counter = pwm_max_val-1 and motor_state = BACKW and i_shift = pwm_max_val-1) else deactivate;

    -- upper FSM --
    
    chip_enable <= w_CE;

    process(ready) begin

        if rising_edge(ready) then

            if stop_btn = '1' then
            
                w_CE <= '0';
                i_shift <= 0;

            else

                w_CE <= '1';
                i_shift <= to_integer(unsigned(pwm_set));

            end if;

            if direction = forward then

                motor_state <= FORW;

            else

                motor_state <= BACKW;

            end if;

        end if;

    end process;

    -- lower FSM --

    process(w_motor_clk)

    variable v_i_pwm_counter : integer range 0 to pwm_max_val-1;

    begin

        if rising_edge(w_motor_clk) then

                case( dir_state ) is

                    when UP =>

                        if ( i_counter = pwm_max_val-2 ) then

                                i_counter <= i_counter + 1;
                                dir_state <= DOWN;

                        elsif ( i_counter <= pwm_max_val-1 ) then

                                i_counter <= i_counter + 1;
                                dir_state <= UP;

                        end if;

                    when DOWN =>

                        if ( i_counter = 1 ) then

                                i_counter <= i_counter - 1;
                                dir_state <= UP;

                        elsif ( i_counter >= 0 ) then

                                i_counter <= i_counter - 1;
                                dir_state <= DOWN;

                        end if;

                    when others => dir_state <= DOWN;

                end case;

        end if;

    end process;


    UT : MOTOR_FREQ
    generic map(clk_freq => pwm_freq)
    port map (clk_in => clk, clk_out => w_motor_clk);


end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOTOR_FREQ is
    generic (

        clk_freq    : integer := 10000

    );
    port (

        clk_in      : in  std_logic;
        clk_out     : out std_logic

    );
end MOTOR_FREQ;

architecture Behavioral of MOTOR_FREQ is

    constant clkmax : integer := (100000000 / clk_freq)-1;

    signal temporal : std_logic := '0';

    signal counter  : integer range 0 to clkmax := 0;

    begin

    clk_out <= temporal;

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

end Behavioral;
