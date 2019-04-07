----------------------------------------------------------------------------------
-- Company:
-- Engineer: Daniel TS
--
-- Create Date: 03/04/2019 07:28:51 PM
-- Design Name:
-- Module Name: SPL_slave - Behavioral
-- Project Name: PAN TILT
-- Target Devices: BASYS 3
-- Tool Versions: VHDL 2008
-- Description: SPI SLAVE TRANSMITTER
--
-- Dependencies:
--
-- Revision: MARCH 13 2019
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SPI_slave_TX is
    port(

        clk                  :   in  std_logic;
        sck                  :   in  std_logic;
        ss                   :   in  std_logic;
        data                 :   in  std_logic_vector(15 downto 0);
        miso                 :   out std_logic                      := '0';
        busy                 :   out std_logic                      := '0'

        );
end SPI_slave_TX;

architecture Behavioral of SPI_slave_TX is

    type   enable_spi       is (ENB, DIS);
    type   transmit_spi     is (START, CHANGESIGNAL, WAITING, DONE);
    signal state_spi        :   enable_spi                          := DIS;
    signal state_trns       :   transmit_spi                        := START;

    begin

    busy <= '1' when state_spi = ENB else '0' when state_spi = DIS;

    process( clk )

        variable shift      :   std_logic_vector(15 downto 0)       := (others => '0');
        variable shiftsck   :   std_logic_vector(3 downto 0)        := "0000";
        variable shiftss    :   std_logic_vector(3 downto 0)        := "1111";
        variable index      :   natural range 0 to 14               := 14;

    begin

        if rising_edge(clk) then

            shiftss := shiftss(2 downto 0) & ss;

            shiftsck := shiftsck(2 downto 0) & sck;

            if shiftss = "0000" then

                state_spi <= ENB;

            elsif shiftss = "1111" then

                state_spi <= DIS;

            end if;

            if state_spi = ENB then

                case( state_trns ) is

                    when START =>

                        shift := data;
                        miso <= shift(15);
                        index := 14;
                        state_trns <= WAITING;

                    when CHANGESIGNAL =>

                        if shiftsck = "0000" then -- falling edge

                            if ( index >= 1 ) then

                                miso <= shift(index);
                                index := index - 1;
                                state_trns <= WAITING;

                            elsif ( index = 0 ) then

                                miso <= shift(index);
                                state_trns <= DONE;

                            end if;

                        else

                            state_trns <= CHANGESIGNAL;

                        end if;

                    when WAITING =>

                        if shiftsck = "1111" then -- rising edge

                            state_trns <= CHANGESIGNAL;

                        else

                            state_trns <= WAITING;

                        end if;

                    when DONE =>

                        state_trns <= DONE;

                    when others =>

                        state_trns <= START;

                end case;

            elsif state_spi = DIS then

                    miso <= '0';
                    state_trns <= START; -- basically waits for next go

            end if;

        end if;

    end process;

    end Behavioral;
