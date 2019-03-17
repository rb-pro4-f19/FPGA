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


entity SPI_slave_trns is
    port(
        sck                  :   in  std_logic;
        ss                   :   in  std_logic;
        data                 :   in  std_logic_vector(15 downto 0);
        miso                 :   out std_logic                      := '0';
        busy                 :   out std_logic                      := '0'
    );
end SPI_slave_trns;

architecture Behavioral of SPI_slave_trns is

    type   enable_spi       is (ENB, DIS);
    type   transmit_spi     is (IDLE, WAITING, DONE);
    signal state_spi        :   enable_spi                          := DIS;
    signal state_trns       :   transmit_spi                        := IDLE;
    signal index            :   natural range 0 to 14               := 14;
    
    signal shift            :   std_logic_vector(15 downto 0)       := (others => '0');

    begin
    -- upper FSM --
    process( ss ) begin
        
        if ss'event and ss = '0' then
            shift <= data;
            state_spi <= ENB;
        end if;
        
        if ss = '0' then
            state_spi <= DIS;
        end if;
        
    end process;
    
    busy <= '1' when state_spi = ENB else '0' when state_spi = DIS;
    -- LOWER FSM --
    process( all ) begin
        case( state_trns ) is
            when IDLE =>
                if state_spi = ENB then
                    miso <= shift(15);
                    state_trns <= WAITING;
                else 
                    state_trns <= IDLE;
                end if;
                
            when WAITING =>
                if (sck'event and sck = '0') then
                        if ( index >= 1 ) then
                            miso <= shift(index);
                            index <= index - 1;
                            state_trns <= WAITING;
                        elsif ( index = 0 ) then
                            miso <= shift(index);
                            state_trns <= DONE;
                        end if;
                end if;
                
                if state_spi = DIS then
                    miso <= '0';
                    state_trns <= IDLE;
                end if;

            when DONE =>
                if state_spi = DIS then
                    index <= 14;
                    miso <= '0';
                    state_trns <= IDLE;
                else
                    state_trns <= DONE;
                end if;

        end case;
        
        
    end process;

    end Behavioral;
