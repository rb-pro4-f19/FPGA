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
        CE_motor_1                  :   out std_logic;
        CE_motor_2                  :   out std_logic;
        motor_o_1                   :   out std_logic_vector(1 downto 0);
        motor_o_2                   :   out std_logic_vector(1 downto 0);
        w_enc_1                     :   in  std_logic_vector(1 downto 0);
        w_enc_2                     :   in  std_logic_vector(1 downto 0);
        rotEnc_i_1                  :   in  std_logic_vector(1 downto 0);
        rotEnc_i_2                  :   in  std_logic_vector(1 downto 0);
        hall_i_1                    :   in  std_logic;
        hall_i_2                    :   in  std_logic;
        led                         :   out std_logic_vector(15 downto 0)

        );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

    type MODE                       is (IDLE, PARSE, WAITING, REPLY);
    signal state                    :   MODE                              := IDLE;

    signal w_data_TX                :   std_logic_vector(15 downto 0);
    signal w_data_RX                :   std_logic_vector(15 downto 0)     := (others => '0');

    signal w_ctrl_reply             :   std_logic                         := '0';
    signal w_spi_ready              :   std_logic                         := '0';

    signal w_ready_motor1           :   std_logic                         := '0';
    signal w_set_pwm1               :   std_logic_vector(7 downto 0)      := (others => '0');
    signal w_stop_motor1            :   std_logic                         := '0';

    signal w_ready_motor2           :   std_logic                         := '0';
    signal w_set_pwm2               :   std_logic_vector(7 downto 0)      := (others => '0');
    signal w_stop_motor2            :   std_logic                         := '0';

    signal w_ready_enc1             :   std_logic                         := '0';
    signal w_data_enc1              :   std_logic_vector(11 downto 0)     := (others => '0');

    signal w_ready_enc2             :   std_logic                         := '0';
    signal w_data_enc2              :   std_logic_vector(11 downto 0)     := (others => '0');
    
    signal w_ready_rotEnc1          :   std_logic                         := '0';
    signal w_data_rotEnc1           :   std_logic_vector(11 downto 0)     := (others => '0');

    signal w_ready_rotEnc2          :   std_logic                         := '0';
    signal w_data_rotEnc2           :   std_logic_vector(11 downto 0)     := (others => '0');
    
    signal w_ready_hall1            :   std_logic                         := '0';
    signal w_data_hall1             :   std_logic                         := '0';
    
    signal w_ready_hall2            :   std_logic                         := '0';
    signal w_data_hall2             :   std_logic                         := '0';

    begin

    -- led <= w_data_enc1;

    process(clk)

    variable shift                  :   std_logic_vector( 15 downto 0)    := (others => '0');

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

                                    w_ready_motor1 <= '1';
                                    w_stop_motor1 <= '1';

                                    w_ready_motor2 <= '1';
                                    w_stop_motor2 <= '1';

                                when others =>

                            end case;

                        when PWM_1 =>

                            w_ready_motor1 <= '1';
                            w_set_pwm1     <= shift( 11 downto 4);

                        when PWM_2 =>

                            w_ready_motor2 <= '1';
                            w_set_pwm2     <= shift( 11 downto 4);

                        when ENC_1 =>

                            w_ready_enc1   <= '1';
                            w_data_TX(15 downto 4) <= w_data_enc1;
                            
                            --w_ready_rotEnc1 <= '1';
                            --w_data_TX(15 downto 4) <= w_data_rotEnc1;

                        when ENC_2 =>

                            w_ready_enc2   <= '1';
                            w_data_TX(15 downto 4) <= w_data_enc2;
                            
                            --w_ready_rotEnc2 <= '1';
                            --w_data_TX(15 downto 4) <= w_data_rotEnc2;
                         
                        when HALL_1 =>

                            w_ready_hall1   <= '1';
                            w_data_TX(4) <= w_data_hall1;
                            w_data_TX(15 downto 12) <= HALL_1;

                        when HALL_2 =>

                            w_ready_hall2   <= '1';
                            w_data_TX(4) <= w_data_hall2;
                            w_data_TX(15 downto 12) <= HALL_2;

                        when others =>

                    end case;

                    state <= WAITING;
--------------------------------------------------------------------------------
                when WAITING =>
--------------------------------------------------------------------------------
                    case ( shift(15 downto 12) ) is

                        when CTRL =>

                            case( shift( 11 downto 4) ) is

                                when TURNOFF =>

                                    w_ready_motor1 <= '0';
                                    w_stop_motor1 <= '0';

                                    w_ready_motor2 <= '0';
                                    w_stop_motor2 <= '0';

                                when others =>

                            end case;

                        when PWM_1 =>

                            w_ready_motor1 <= '0';

                        when PWM_2 =>

                            w_ready_motor2 <= '0';

                        when ENC_1 =>

                            w_ready_enc1   <= '0';
                            --w_ready_rotEnc1 <= '0';

                        when ENC_2 =>

                            w_ready_enc2   <= '0';
                            --w_ready_rotEnc2 <= '0';
                            
                        when HALL_1 =>

                            w_ready_hall1   <= '0';

                        when HALL_2 =>

                            w_ready_hall2   <= '0';

                        when others =>

                    end case;

                    state <= REPLY;
--------------------------------------------------------------------------------
                when REPLY =>
--------------------------------------------------------------------------------
                    case ( shift(15 downto 12) ) is

                        when CTRL =>

                            w_data_TX      <= shift;

                        when PWM_1 =>

                            w_data_TX      <= x"B0B0";

                        when PWM_2 =>

                            w_data_TX      <= x"A0A0";

                        when ENC_1 =>

                            -- done

                        when ENC_2 =>

                            -- done
                        when HALL_1 =>
                        
                            -- done

                        when HALL_2 =>
                        
                            -- done

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
             spi_ready  => w_spi_ready,
             led        => led
             );
--------------------------------------------------------------------------------
    MOTOR_1: MOTOR
    port map(
            stop_btn    => w_stop_motor1,
            ready       => w_ready_motor1,
            clk         => clk,
            pwm_set     => w_set_pwm1(6 downto 0),
            direction   => w_set_pwm1(7),
            motor_o     => motor_o_1(1 downto 0),
            chip_enable => CE_motor_1
            );
--------------------------------------------------------------------------------
    MOTOR_2: MOTOR
    port map(
            stop_btn    => w_stop_motor2,
            ready       => w_ready_motor2,
            clk         => clk,
            pwm_set     => w_set_pwm2(6 downto 0),
            direction   => w_set_pwm2(7),
            motor_o     => motor_o_2(1 downto 0),
            chip_enable => CE_motor_2
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
    ENCODER_2: ENCODER
    port map(
            clk         => clk,
            enc_a       => w_enc_2(0),
            enc_b       => w_enc_2(1),
            reset       => w_ready_enc2,
            data        => w_data_enc2
            );
 --------------------------------------------------------------------------------
    RotENC_1: RotENC
    port map(
             clk            => clk,
             Ain            => w_enc_1(0),
			 Bin            => w_enc_1(1),
             encoder_read   => w_ready_rotEnc1,
             encoder_out    => w_data_rotEnc1
            );
--------------------------------------------------------------------------------
    RotENC_2: RotENC
    port map(
             clk            => clk,
             Ain            => w_enc_2(0),
			 Bin            => w_enc_2(1),
             encoder_read   => w_ready_rotEnc2,
             encoder_out    => w_data_rotEnc2
            );
--------------------------------------------------------------------------------
    hallSensor_1: hallSensor
    port map(
            clk         => clk,
            hall_in     => hall_i_1,
            hall_read   => w_ready_hall1,
            hall_out    => w_data_hall1
            );
--------------------------------------------------------------------------------
    hallSensor_2: hallSensor
    port map(
            clk         => clk,
            hall_in     => hall_i_2,
            hall_read   => w_ready_hall2,
            hall_out    => w_data_hall2
            );

end Behavioral;
