----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/06/2019 09:21:32 AM
-- Design Name:
-- Module Name: CONTROLLER - Behavioral
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
use work.controller_modules.all;

entity CONTROLLER is
    port(

        clk                         :   in  std_logic;

        sck                         :   in  std_logic;

        ss                          :   in  std_logic;

        mosi                        :   in  std_logic;

        miso                        :   out std_logic                      := '0';

        pwm1                        :   out std_logic_vector(2 downto 0);

        pwm2                        :   out std_logic_vector(2 downto 0)

    );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

    type MODE                       is (IDLE, REPLY, READING, WAITING);

    signal state                    :   MODE   := IDLE;

    signal w_data_too_spitop        :   std_logic_vector(15 downto 0);

    signal w_data_from_spitop       :   std_logic_vector(15 downto 0)     := (others => '0');

    signal w_control_answer         :   std_logic                         := '0';

    signal w_signa_spitop           :   std_logic                         := '0';

    signal w_shift                  :   std_logic_vector( 15 downto 0)    := (others => '0');

    -- this is for motor1
    signal w_ready_pwm1             :   std_logic                         := '0';
    signal w_set_pwm1               :   std_logic_vector(7 downto 0)      := (others => '0');

    -- this is for motor2
    signal w_ready_pwm2             :   std_logic                         := '0';
    signal w_set_pwm2               :   std_logic_vector(7 downto 0)      := (others => '0');

    begin

    process(clk) begin

         case( state ) is

                when IDLE =>

                    w_control_answer <= '0';

                    w_shift <= w_data_from_spitop;

                    if (w_signa_spitop = '1') then

                        state <= REPLY;

                    else

                        state <= IDLE;

                    end if;

                when REPLY =>

                    case( w_shift(15 downto 12) ) is

                        when "0000" =>

                            w_data_too_spitop <= (others => '0');

                        when "0001" =>
                            -- motor1

                            w_ready_pwm1 <= '1';

                            w_set_pwm1   <= w_shift( 11 downto 4);

                        when "0010" =>
                            -- motor2

                             w_ready_pwm2 <= '1';

                             w_set_pwm2   <= w_shift( 11 downto 4);

                        when "0011" =>
                            --ENC1



                        when "0100" =>
                            --ENC2



                        when "0101" =>



                        when "0110" =>



                        when "0111" =>



                        when "1000" =>



                        when "1001" =>



                        when others =>



                    end case;

                    state <= READING;

                when READING =>

                    case( w_shift(15 downto 12) ) is

                        when "0000" =>

                            w_data_too_spitop <= (others => '0');

                        when "0001" =>
                            -- motor1

                            w_ready_pwm1 <= '0';

                            w_data_too_spitop <= x"F0F0";

                        when "0010" =>
                            -- motor2

                             w_ready_pwm2 <= '0';

                             w_data_too_spitop <= x"F0F0";

                        when "0011" =>

                            w_data_too_spitop <= x"0FF0";

                        when "0100" =>

                            w_data_too_spitop <= x"F000";

                        when "0101" =>

                            w_data_too_spitop <= x"F0F0";

                        when "0110" =>

                            w_data_too_spitop <= x"FF00";

                        when "0111" =>

                            w_data_too_spitop <= x"FFF0";

                        when "1000" =>

                            w_data_too_spitop <= x"AAA0";

                        when "1001" =>

                            w_data_too_spitop <= x"BBB0";

                        when others =>

                            w_data_too_spitop <= x"CCC0";

                    end case;

                    w_control_answer <= '1';

                    state <= WAITING;

                when WAITING =>

                    state <= IDLE;

            end case;

    end process;
--------------------------------------------------------------------------------
    SPI: SPI_TOPMODULE
    port map(
             clk => clk,
             sck => sck,
             ss => ss,
             mosi => mosi,
             miso => miso,
             data_controller_i => w_data_too_spitop,
             data_controller_o => w_data_from_spitop,
             control_answer => w_control_answer,
             spi_signa => w_signa_spitop
             );
--------------------------------------------------------------------------------
    PWM_1: PWM
    port map(
            ready => w_ready_pwm1,
            clk => clk,
            pwm_set => w_set_pwm1(6 downto 0),
            direction => w_set_pwm1(7),
            ja => pwm1(1 downto 0),
            chip_enable => pwm1(2)
            );
--------------------------------------------------------------------------------
    PWM_2: PWM
    port map(
            ready => w_ready_pwm2,
            clk => clk,
            pwm_set => w_set_pwm2(6 downto 0),
            direction => w_set_pwm2(7),
            ja => pwm2(1 downto 0),
            chip_enable => pwm2(2)
            );
--------------------------------------------------------------------------------


end Behavioral;
