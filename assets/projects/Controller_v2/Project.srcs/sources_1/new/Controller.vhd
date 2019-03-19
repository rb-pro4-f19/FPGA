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

library SPI;
use SPI.package_spi.ALL;
use SPI.package_controller.all;


entity CONTROLLER is
    port(
        clk                         :   in  std_logic;
        sck                         :   in  std_logic;
        ss                          :   in  std_logic;
        mosi                        :   in  std_logic;
        miso                        :   out std_logic                      := '0';
        CE_pwm                      :   out std_logic;
        pwm1                        :   out std_logic_vector(1 downto 0);
        pwm2                        :   out std_logic_vector(1 downto 0)
    );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

    type MODE                       is (IDLE, PARSE, REPLY, WAITING);

    signal state                    :   MODE   := IDLE;

    signal w_data_TX                :   std_logic_vector(15 downto 0);

    signal w_data_RX                :   std_logic_vector(15 downto 0)     := (others => '0');

    signal w_ctrl_reply             :   std_logic                         := '0';
    signal w_spi_ready              :   std_logic                         := '0';

    -- this is for motor1
    signal w_ready_pwm1             :   std_logic                         := '0';
    signal w_set_pwm1               :   std_logic_vector(7 downto 0)      := (others => '0');

    -- this is for motor2
    signal w_ready_pwm2             :   std_logic                         := '0';
    signal w_set_pwm2               :   std_logic_vector(7 downto 0)      := (others => '0');

    begin

    process(clk)

    variable shift                  :   std_logic_vector( 15 downto 0)    := (others => '0');

    begin

        if rising_edge(clk) then

            case( state ) is

                when IDLE =>

                    w_ctrl_reply <= '0';

                    if(w_spi_ready = '1') then
                        shift := w_data_RX;
                        state <= PARSE;
                    else
                        state <= IDLE;
                    end if;

                when PARSE =>

                    case( shift(15 downto 12) ) is

                        when PWM_1 =>
                            w_ready_pwm1 <= '1';
                            w_set_pwm1   <= shift( 11 downto 4);

                        when PWM_2 =>
                             w_ready_pwm2 <= '1';
                             w_set_pwm2   <= shift( 11 downto 4);

                        when others =>

                    end case;

                    state <= REPLY;

                when REPLY =>

                    case( shift(15 downto 12) ) is

                        when CTRL =>
                            -- controller --
                            w_data_TX <= shift;

                        when PWM_1 =>
                            -- motor1 --
                            w_ready_pwm1 <= '0';
                            w_data_TX <= x"A0A0";

                        when PWM_2 =>
                            -- motor2 --
                             w_ready_pwm2 <= '0';
                             w_data_TX <= x"B0B0";

                        when others =>
                            w_data_TX <= x"F0F0";

                    end case;

                    w_ctrl_reply <= '1';

                    state <= WAITING;

                when WAITING =>

                    state <= IDLE;

                when others => state <= IDLE;

            end case;

        end if;

    end process;
--------------------------------------------------------------------------------
    SPI: SPI_TOPMODULE
    port map(
             clk => clk,
             sck => sck,
             ss => ss,
             mosi => mosi,
             miso => miso,
             data_controller_i => w_data_TX,
             data_controller_o => w_data_RX,
             ctrl_reply => w_ctrl_reply,
             spi_ready => w_spi_ready
             );
--------------------------------------------------------------------------------
    PWM_1: PWM
    port map(
            ready => w_ready_pwm1,
            clk => clk,
            pwm_set => w_set_pwm1(6 downto 0),
            direction => w_set_pwm1(7),
            ja => pwm1(1 downto 0),
            chip_enable => CE_pwm
            );
--------------------------------------------------------------------------------
    PWM_2: PWM
    port map(
            ready => w_ready_pwm2,
            clk => clk,
            pwm_set => w_set_pwm2(6 downto 0),
            direction => w_set_pwm2(7),
            ja => pwm2(1 downto 0),
            chip_enable => CE_pwm
            );
--------------------------------------------------------------------------------


end Behavioral;
