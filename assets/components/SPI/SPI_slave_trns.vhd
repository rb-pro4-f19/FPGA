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

    type enable_spi         is (ENB, DIS, WAITING);
    signal state            :   enable_spi  := ENB;
    -- wire for w_data -- no default since it is an input
    signal w_data           :   std_logic_vector(15 downto 0);
    -- w_busy wire
    signal w_busy           :   std_logic                           := '0';
    -- master in slave out
    signal w_miso           :   std_logic                           := '0';
    -- shift register
    signal w_shift          :   std_logic_vector(15 downto 0)       := (others => '0');
    -- index
    signal i_index          :   integer range 0 to 15               := 14;

    begin

    busy <= w_busy;

    miso <= w_miso;

    w_data <= data;

    process( ss, sck ) begin

        case( state ) is

            when ENB =>

                if ( ss = '0' ) then

                    w_busy <= '1';

                    w_shift <= w_data;
                    -- send MSB because send immediately due to protocol
                    w_miso <= w_data(15);
                    -- start index one lower
                    i_index <= 14;

                    state <= DIS;

                else

                    w_busy <= '0';

                    state <= ENB;

                end if;

                --/ /--

                when DIS =>

                    if ( ss = '0' ) then

                        if( falling_edge(sck) ) then

                            if ( i_index >= 1 ) then

                                w_miso <= w_shift(i_index);

                                i_index <= i_index - 1;

                                state <= DIS;

                            elsif ( i_index = 0 ) then

                                w_miso <= w_shift(i_index);

                                state <= WAITING;

                            end if;

                        end if;

                    else

                        w_miso <= '0';
                        -- only incase error happends
                        state <= WAITING;

                    end if;

                when WAITING =>

                    if( ss = '1' ) then

                        w_busy <= '0';

                        w_miso <= '0';

                        state <= ENB;

                    end if;

            end case;

        end process;

    end Behavioral;
