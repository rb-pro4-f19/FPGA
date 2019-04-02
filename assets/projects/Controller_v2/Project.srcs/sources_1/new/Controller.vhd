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
        CE_motor_0                  :   out std_logic;
        CE_motor_1                  :   out std_logic;
        MOT_0_out                   :   out std_logic_vector(1 downto 0);
        MOT_1_out                   :   out std_logic_vector(1 downto 0);
        w_enc_0                     :   in  std_logic_vector(1 downto 0);
        w_enc_1                     :   in  std_logic_vector(1 downto 0);
        hall_i_0                    :   in  std_logic;
        hall_i_1                    :   in  std_logic
        
        );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

    type MODE                       is (IDLE, PARSE, WAITING, REPLY);
    signal state                    :   MODE                              := IDLE;

    signal w_data_TX                :   std_logic_vector(15 downto 0);
    signal w_data_RX                :   std_logic_vector(15 downto 0)     := (others => '0');

    signal w_ctrl_reply             :   std_logic                         := '0';
    signal w_spi_ready              :   std_logic                         := '0';

    signal w_pwm_freq_MOT_0         :   std_logic_vector(6 downto 0)      := "0001010";
    signal w_rdy_MOT_0              :   std_logic                         := '0';
    signal w_set_pwm0               :   std_logic_vector(7 downto 0)      := (others => '0');
    signal w_stop_MOT_0             :   std_logic                         := '0';

    signal w_pwm_freq_MOT_1         :   std_logic_vector(6 downto 0)      := "0001010";
    signal w_rdy_MOT_1              :   std_logic                         := '0';
    signal w_set_pwm1               :   std_logic_vector(7 downto 0)      := (others => '0');
    signal w_stop_MOT_1             :   std_logic                         := '0';

    signal w_ready_enc0             :   std_logic                         := '0';
    signal w_data_enc0              :   std_logic_vector(11 downto 0)     := (others => '0');

    signal w_ready_enc1             :   std_logic                         := '0';
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

                                    w_rdy_MOT_0 <= '1';
                                    w_stop_MOT_0 <= '1';

                                    w_rdy_MOT_1 <= '1';
                                    w_stop_MOT_1 <= '1';

                                when others =>

                            end case;

                        when MOT_0 =>

                            w_rdy_MOT_0 <= '1';
                            w_set_pwm0  <= shift( 11 downto 4);

                        when MOT_1 =>

                            w_rdy_MOT_1 <= '1';
                            w_set_pwm1  <= shift( 11 downto 4);

                        when ENC_0 =>

                            w_data_TX(15 downto 4) <= w_data_enc0;
                            prev_data := w_data_enc0;
                            w_ready_enc0 <= '1';

                            --w_ready_rotEnc0 <= '1';
                            --w_data_TX(15 downto 4) <= w_data_rotEnc0;

                        when ENC_1 =>

                            w_data_TX(15 downto 4) <= w_data_enc1;
                            prev_data := w_data_enc1;
                            w_ready_enc1   <= '1';

                            --w_ready_rotEnc1 <= '1';
                            --w_data_TX(15 downto 4) <= w_data_rotEnc1;

                        when HALL_0 =>

                            w_ready_hall0   <= '1';
                            w_data_TX(4) <= w_data_hall0;
                            w_data_TX(15 downto 12) <= HALL_0;

                        when HALL_1 =>

                            w_ready_hall1   <= '1';
                            w_data_TX(4) <= w_data_hall1;
                            w_data_TX(15 downto 12) <= HALL_1;

                        when FREQ =>

                            if shift(11) = '0' then

                                w_pwm_freq_MOT_0 <= shift(10 downto 4);

                            else

                                w_pwm_freq_MOT_1 <= shift(10 downto 4);

                            end if;

                        when RETX =>

                            -- done

                        when others =>

                            --

                    end case;

                    state <= WAITING;
--------------------------------------------------------------------------------
                when WAITING =>
--------------------------------------------------------------------------------
                    case ( shift(15 downto 12) ) is

                        when CTRL =>

                            case( shift( 11 downto 4) ) is

                                when TURNOFF =>

                                    w_rdy_MOT_0 <= '0';
                                    w_stop_MOT_0 <= '0';

                                    w_rdy_MOT_1 <= '0';
                                    w_stop_MOT_1 <= '0';

                                when others =>

                            end case;

                        when MOT_0 =>

                            w_rdy_MOT_0 <= '0';

                        when MOT_1 =>

                            w_rdy_MOT_1 <= '0';

                        when ENC_0 =>

                            w_ready_enc0   <= '0';
                            --w_ready_rotEnc0 <= '0';

                        when ENC_1 =>

                            w_ready_enc1   <= '0';
                            --w_ready_rotEnc1 <= '0';

                        when HALL_0 =>

                            w_ready_hall0   <= '0';

                        when HALL_1 =>

                            w_ready_hall1   <= '0';

                        when RETX =>

                            -- done

                        when others =>

                            -- done

                    end case;

                    state <= REPLY;
--------------------------------------------------------------------------------
                when REPLY =>
--------------------------------------------------------------------------------
                    case ( shift(15 downto 12) ) is

                        when CTRL =>

                            w_data_TX      <= shift;

                        when MOT_0 =>

                            w_data_TX      <= x"B0B0";

                        when MOT_1 =>

                            w_data_TX      <= x"A0A0";

                        when ENC_0 =>

                            -- done

                        when ENC_1 =>

                            -- done

                        when HALL_0 =>

                            -- done

                        when HALL_1 =>

                            -- done

                        when RETX =>

                            w_data_TX(15 downto 4) <= prev_data;

                        when others =>

                            w_data_TX      <= x"F0F0";

                    end case;

                    w_ctrl_reply <= '1';
                    state <= IDLE;
--------------------------------------------------------------------------------
                when others =>
--------------------------------------------------------------------------------
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
             data_controller_i => w_data_TX,
             data_controller_o => w_data_RX,
             ctrl_reply => w_ctrl_reply,
             spi_ready  => w_spi_ready
             
             );
--------------------------------------------------------------------------------
    MOTOR_0: MOTOR
    port map(
    
            pwm_freq    => w_pwm_freq_MOT_0,
            stop_btn    => w_stop_MOT_0,
            ready       => w_rdy_MOT_0,
            clk         => clk,
            pwm_set     => w_set_pwm0(6 downto 0),
            direction   => w_set_pwm0(7),
            motor_o     => MOT_0_out(1 downto 0),
            chip_enable => CE_motor_0
            
            );
--------------------------------------------------------------------------------
    MOTOR_1: MOTOR
    port map(
    
            pwm_freq    => w_pwm_freq_MOT_1,
            stop_btn    => w_stop_MOT_1,
            ready       => w_rdy_MOT_1,
            clk         => clk,
            pwm_set     => w_set_pwm1(6 downto 0),
            direction   => w_set_pwm1(7),
            motor_o     => MOT_1_out(1 downto 0),
            chip_enable => CE_motor_1
            
            );
--------------------------------------------------------------------------------
    ENCODER_0: ENCODER
    port map(
    
            clk         => clk,
            enc_a       => w_enc_0(0),
            enc_b       => w_enc_0(1),
            reset       => w_ready_enc0,
            data        => w_data_enc0
            
            );
--------------------------------------------------------------------------------
    ENCODER_1: ENCODER
    port map(
    
            clk         => clk,
            enc_a       => w_enc_1(0),
            enc_b       => w_enc_1(1),
            reset       => w_ready_enc1,
            data        => w_data_enc1
            
            );
 --------------------------------------------------------------------------------
--    RotENC_0: RotENC
--    port map(
--             clk            => clk,
--             Ain            => w_enc_0(0),
--			 Bin            => w_enc_0(1),
--             encoder_read   => w_ready_enc0,
--             encoder_out    => w_data_enc0
--            );
--------------------------------------------------------------------------------
--    RotENC_1: RotENC
--    port map(
--             clk            => clk,
--             Ain            => w_enc_1(0),
--			 Bin            => w_enc_1(1),
--             encoder_read   => w_ready_enc1,
--             encoder_out    => w_data_enc1
--            );
--------------------------------------------------------------------------------
    hallSensor_0: hallSensor
    port map(
    
            clk         => clk,
            hall_in     => hall_i_0,
            hall_read   => w_ready_hall0,
            hall_out    => w_data_hall0
            
            );
--------------------------------------------------------------------------------
    hallSensor_1: hallSensor
    port map(
    
            clk         => clk,
            hall_in     => hall_i_1,
            hall_read   => w_ready_hall1,
            hall_out    => w_data_hall1
            
            );

end Behavioral;
