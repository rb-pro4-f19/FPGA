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

entity SPI_slave_reci is
    port(

        clk                 :   in  std_logic;
        sck                 :   in  std_logic;
        ss                  :   in  std_logic;
        mosi                :   in  std_logic;
        data                :   out std_logic_vector(15 downto 0)   := (others => '0');
        busy                :   out std_logic                       := '0'

    );
end SPI_slave_reci;

architecture Behavioral of SPI_slave_reci is

    type   enable_spi       is (ENB, DIS);
    type   recieve_spi      is (START, CHANGESIGNAL, WAITING, DONE);
    signal state_spi        :   enable_spi                          := DIS;
    signal state_reci       :   recieve_spi                         := START;

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

            if shiftss = "0000" then
                state_spi <= ENB;
            elsif shiftss = "1111" then
                state_spi <= DIS;
            end if;

            if state_spi = ENB then
                case( state_reci ) is
                    when START =>

                    index := 15;
                    state_reci <= WAITING;

                    when CHANGESIGNAL =>
                        if shiftsck = "1111" then -- rising_edge
                            if ( index >= 1 ) then
                                shift(index) := mosi;
                                index := index - 1;
                                state_reci <= WAITING;
                            elsif ( index = 0 ) then
                                data <= shift(15 downto 1) & mosi;
                                state_reci <= DONE;
                            end if;
                        else
                            state_reci <= CHANGESIGNAL;
                        end if;

                    when WAITING =>
                        if shiftsck = "0000" then
                            state_reci <= CHANGESIGNAL;
                        else
                            state_reci <= WAITING;
                        end if;

                    when DONE =>
                        state_reci <= DONE;

                    when others => state_reci <= START;

                end case;

            elsif state_spi = DIS then

                    state_reci <= START; -- basically waits;

            end if;
        end if;
    end process;

end Behavioral;
