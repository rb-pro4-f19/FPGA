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
use IEEE.NUMERIC_STD.ALL;

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
        CE_MOT0                     :   out std_logic;
        CE_MOT1                     :   out std_logic;
        MOT0_out                    :   out std_logic_vector(1 downto 0);
        MOT1_out                    :   out std_logic_vector(1 downto 0);
        ENC0                        :   in  std_logic_vector(1 downto 0);
        ENC1                        :   in  std_logic_vector(1 downto 0);
        hall_i_0                    :   in  std_logic;
        hall_i_1                    :   in  std_logic;
        led                         :   out std_logic_vector(7 downto 0)

        );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

    type MODE                       is (IDLE, PARSE, ACKNOWLEDGE, USELESS);
    signal state                    :   MODE                              := IDLE;

    signal w_data_TX                :   std_logic_vector(15 downto 0);
    signal w_data_RX                :   std_logic_vector(15 downto 0)     := (others => '0');

    signal w_ctrl_reply             :   std_logic                         := '0';
    signal w_spi_ready              :   std_logic                         := '0';

    signal w_freq_MOT0              :   std_logic_vector(6 downto 0)      := "0001010";
    signal w_rdy_MOT0               :   std_logic                         := '0';
    signal w_pwm0                   :   std_logic_vector(7 downto 0)      := (others => '0');
    signal w_stop_MOT0              :   std_logic                         := '0';

    signal w_freq_MOT1              :   std_logic_vector(6 downto 0)      := "0001010";
    signal w_rdy_MOT1               :   std_logic                         := '0';
    signal w_pwm1                   :   std_logic_vector(7 downto 0)      := (others => '0');
    signal w_stop_MOT1              :   std_logic                         := '0';

    signal w_reset_enc0             :   std_logic                         := '0';
    signal w_data_enc0              :   std_logic_vector(11 downto 0)     := (others => '0');

    signal w_reset_enc1             :   std_logic                         := '0';
    signal w_data_enc1              :   std_logic_vector(11 downto 0)     := (others => '0');

    signal w_ready_hall0            :   std_logic                         := '0';
    signal w_data_hall0             :   std_logic                         := '0';

    signal w_ready_hall1            :   std_logic                         := '0';
    signal w_data_hall1             :   std_logic                         := '0';

    begin

    process(clk)

    variable shift                  :   std_logic_vector( 15 downto 0)    := (others => '0');

    variable prev_data              :   std_logic_vector( 11 downto 0)    := (others => '0');

    begin

        if rising_edge(clk) then

            case( state ) is
--------------------------------------------------------------------------------
                when IDLE =>
--------------------------------------------------------------------------------
                    w_ctrl_reply <= '0';

                    if ( w_spi_ready = '1' ) then

                        shift := w_data_RX;
                        led <= shift(11 downto 4);
                        state <= PARSE;

                    else

                        state <= IDLE;

                    end if;
--------------------------------------------------------------------------------
                when PARSE =>
--------------------------------------------------------------------------------

                    case ( shift(15 downto 12) ) is

                        when CTRL =>

                            case( shift( 11 downto 4) ) is

                                when TURNOFF =>

                                    w_rdy_MOT0 <= '1';
                                    w_stop_MOT0 <= '1';

                                    w_rdy_MOT1 <= '1';
                                    w_stop_MOT1 <= '1';

                                when others =>

                            end case;

                        when MOT_0 =>

                            w_rdy_MOT0 <= '1';
                            w_pwm0  <= shift( 11 downto 4);

                        when MOT_1 =>

                            w_rdy_MOT1 <= '1';
                            w_pwm1  <= shift( 11 downto 4);

                        when ENC_0 =>

                            w_data_TX(15 downto 4) <= w_data_enc0;
                            prev_data := w_data_enc0;
                            w_reset_enc0 <= '1';

                        when ENC_1 =>

                            w_data_TX(15 downto 4) <= w_data_enc1;
                            prev_data := w_data_enc1;
                            w_reset_enc1   <= '1';

                        when HALL_0 =>

                            w_ready_hall0 <= '1';

                        when HALL_1 =>

                            w_ready_hall1 <= '1';

                        when FREQ =>

                            if shift(11) = '0' then

                                w_freq_MOT0 <= shift(10 downto 4);

                            else

                                w_freq_MOT1 <= shift(10 downto 4);

                            end if;

                        when RETX =>

                            -- done

                        when others =>

                            --

                    end case;

                    state <= ACKNOWLEDGE;

--------------------------------------------------------------------------------
                when ACKNOWLEDGE =>
--------------------------------------------------------------------------------
                    case ( shift(15 downto 12) ) is

                        when CTRL =>

                            case( shift( 11 downto 4) ) is

                                when TURNOFF =>

                                    w_rdy_MOT0 <= '0';
                                    w_stop_MOT0 <= '0';

                                    w_rdy_MOT1 <= '0';
                                    w_stop_MOT1 <= '0';

                                when others =>

                            end case;
                            
                            w_data_TX      <= shift;

                        when MOT_0 =>

                            w_rdy_MOT0 <= '0';
                            w_data_TX      <= x"B0B0";

                        when MOT_1 =>

                            w_rdy_MOT1 <= '0';
                            w_data_TX      <= x"A0A0";

                        when ENC_0 =>

                            w_reset_enc0   <= '0';

                        when ENC_1 =>

                            w_reset_enc1   <= '0';

                        when HALL_0 =>

                            w_ready_hall0   <= '0';
                            w_data_TX(4)  <= w_data_hall0;
                            w_data_TX(15 downto 12) <= HALL_0;

                        when HALL_1 =>

                            w_ready_hall1   <= '0';
                            w_data_TX(4)  <= w_data_hall1;
                            w_data_TX(15 downto 12) <= HALL_1;

                        when RETX =>
                            
                            w_data_TX(15 downto 4) <= prev_data;

                            -- done

                        when others =>
                        
                            w_data_TX      <= x"F0F0";

                            -- done

                    end case;
                    
                    w_ctrl_reply <= '1';
                    state <= USELESS;
                    
                    when USELESS =>
                    
                        state <= IDLE;
                                    
            end case;

        end if;

    end process;

--------------------------------------------------------------------------------
    SPI: SPI_TOPMODULE
    port map(

             clk        => clk,
             sck        => sck,
             ss         => ss,
             mosi       => mosi,
             miso       => miso,
             data_ctrl_i => w_data_TX,
             data_ctrl_o => w_data_RX,
             ctrl_reply => w_ctrl_reply,
             spi_ready  => w_spi_ready

             );
--------------------------------------------------------------------------------
    MOTOR_0: MOTOR
    port map(

            freq        => w_freq_MOT0,
            stop        => w_stop_MOT0,
            ready       => w_rdy_MOT0,
            clk         => clk,
            pwm         => w_pwm0(6 downto 0),
            dir         => w_pwm0(7),
            mot_out     => MOT0_out(1 downto 0),
            CE          => CE_MOT0

            );
--------------------------------------------------------------------------------
    MOTOR_1: MOTOR
    port map(

            freq        => w_freq_MOT1,
            stop        => w_stop_MOT1,
            ready       => w_rdy_MOT1,
            clk         => clk,
            pwm         => w_pwm1(6 downto 0),
            dir         => w_pwm1(7),
            mot_out     => MOT1_out(1 downto 0),
            CE          => CE_MOT1

            );
--------------------------------------------------------------------------------
    ENCODER_0: ENCODER
    port map(

            clk         => clk,
            enc_a       => ENC0(0),
            enc_b       => ENC0(1),
            reset       => w_reset_enc0,
            data        => w_data_enc0

            );
--------------------------------------------------------------------------------
    ENCODER_1: ENCODER
    port map(

            clk         => clk,
            enc_a       => ENC1(0),
            enc_b       => ENC1(1),
            reset       => w_reset_enc1,
            data        => w_data_enc1

            );
--------------------------------------------------------------------------------
    hallSensor_0: HALLSENSOR
    port map(

            clk         => clk,
            hall_in     => hall_i_0,
            hall_read   => w_ready_hall0,
            hall_out    => w_data_hall0

            );
--------------------------------------------------------------------------------
    hallSensor_1: HALLSENSOR
    port map(

            clk         => clk,
            hall_in     => hall_i_1,
            hall_read   => w_ready_hall1,
            hall_out    => w_data_hall1

            );

end Behavioral;
