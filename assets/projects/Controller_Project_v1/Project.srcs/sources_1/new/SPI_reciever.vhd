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
        sck             :   in  std_logic;
        ss              :   in  std_logic;
        mosi            :   in  std_logic;
        data            :   out std_logic_vector(15 downto 0)   := (others => '0');
        busy            :   out std_logic                       := '0'
    );
end SPI_slave_reci;

architecture Behavioral of SPI_slave_reci is

    type   enable_spi   is (ENB, DIS);
    type   recieve_spi  is (IDLE, WAITING, DONE);
    signal state_spi    :   enable_spi                          := DIS;
    signal state_reci   :   recieve_spi                         := IDLE;
    signal index        :   natural range 0 to 15               := 15;
    signal shift        :   std_logic_vector (15 downto 0)      := (others => '0');
    begin
    -- upper FSM --
    process( ss ) begin
        if ss = '0' then
            state_spi <= ENB;
        elsif ss = '1' then
            state_spi <= DIS;
        end if;
    end process;
    
    busy <= '1' when state_spi = ENB else '0' when state_spi = DIS;

    -- LOWER FSM --
    process(all) begin
        case( state_reci ) is
            when IDLE =>
                if state_spi = ENB then
                    index <= 15;
                    state_reci <= WAITING;
                elsif state_spi = DIS then
                    state_reci <= IDLE;
                end if;

            when WAITING =>
                if (sck'event and sck = '1') then
                        if ( index >= 1 ) then
                            shift(index) <= mosi;
                            index <= index - 1;
                            state_reci <= WAITING;
                        elsif ( index = 0 ) then
                            data <= shift(15 downto 1) & mosi;
                            state_reci <= DONE;
                        end if;
                end if;
                if state_spi = DIS then
                    state_reci <= IDLE;
                end if;

            when DONE =>
                if state_spi = DIS then
                    state_reci <= IDLE;
                else
                    state_reci <= DONE;
                end if;

        end case;
    end process;

end Behavioral;
