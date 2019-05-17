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
    type   transmit_spi     is (TRANSMIT, WAITING, DONE);
    signal state_spi        :   enable_spi                          := DIS;
    signal state_trns       :   transmit_spi                        := TRANSMIT;

    begin

    busy <= '1' when state_spi = ENB else '0' when state_spi = DIS;

    process( clk )

        variable shift      :   std_logic_vector(15 downto 0)       := (others => '0');
        variable shiftsck   :   std_logic_vector(3 downto 0)        := "0000";
        variable shiftss    :   std_logic_vector(3 downto 0)        := "1111";
        variable index      :   natural range 0 to 15               := 15;

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

                    when TRANSMIT =>

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

                            state_trns <= TRANSMIT;

                         end if;

                    when WAITING =>

                        if shiftsck = "1111" then -- rising edge

                            state_trns <= TRANSMIT;

                        else

                            state_trns <= WAITING;

                        end if;

                    when DONE =>

                        state_trns <= DONE;

                end case;

            elsif state_spi = DIS then

                miso <= '0';
				shift := data;
				index := 15;
				state_trns <= TRANSMIT;

            end if;

        end if;

    end process;

    end Behavioral;
