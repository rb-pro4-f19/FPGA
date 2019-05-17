----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Daniel T.S
--
-- Create Date: 03/04/2019 07:28:51 PM
-- Design Name: SPI - Reciever Module
-- Module Name: SPL_slave - Behavioral
-- Project Name: Pan Tilt System
-- Target Devices: ARTIC 7
-- Tool Versions: VHDL 2008
-- Description:
--
-- Dependencies:
--
-- Revision: 13 March 2019
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPI_slave_RX is
    port(

        clk                 :   in  std_logic;
        sck                 :   in  std_logic;
        ss                  :   in  std_logic;
        mosi                :   in  std_logic;
        data                :   out std_logic_vector(15 downto 0)   := (others => '0');
        busy                :   out std_logic                       := '0'

        );
end SPI_slave_RX;

architecture Behavioral of SPI_slave_RX is

    type   enable_spi       is (ENB, DIS);
    type   recieve_spi      is (READ, WAITING, DONE);
    signal state_spi        :   enable_spi                          := DIS;
    signal state_reci       :   recieve_spi                         := WAITING;

    begin

    busy <= '1' when state_spi = ENB else '0' when state_spi = DIS;

    -- lower FSM --
    process( clk )

    variable shift      :   std_logic_vector(15 downto 0)       := (others => '0');
    variable shiftsck   :   std_logic_vector(3 downto 0)        := "0000";
    variable shiftss    :   std_logic_vector(3 downto 0)        := "1111";
    variable index      :   natural range 0 to 15               := 15;

    begin

        if rising_edge(clk) then

            shiftss := shiftss(2 downto 0) & ss;
            shiftsck := shiftsck(2 downto 0) & sck;

            if shiftss = "0000" then -- slave select is low

                state_spi <= ENB;

            elsif shiftss = "1111" then -- slave select is high

                state_spi <= DIS;

            end if;

            if state_spi = ENB then

                case( state_reci ) is

                    when READ =>

                        if shiftsck = "1111" then -- wait for signal to go high

                            if ( index >= 1 ) then

                                shift(index) := mosi;
                                index := index - 1;
                                state_reci <= WAITING;

                            elsif ( index = 0 ) then

                                data <= shift(15 downto 1) & mosi;
                                state_reci <= DONE;

                            end if;

                        else

                            state_reci <= READ;

                        end if;

                    when WAITING =>

                        if shiftsck = "0000" then -- wait for signal to go low

                            state_reci <= READ;

                        else

                            state_reci <= WAITING;

                        end if;

                    when DONE =>

                        state_reci <= DONE;

                    when others =>

                        state_reci <= WAITING;

                end case;

            elsif state_spi = DIS then

					index := 15;
                    state_reci <= WAITING; -- ready for next run

            end if;

        end if;

    end process;

end Behavioral;
