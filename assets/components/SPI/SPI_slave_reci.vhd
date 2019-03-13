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

        busy            :   out std_logic                       := '0';

        ready           :   out std_logic                       := '1'

    );
end SPI_slave_reci;

architecture Behavioral of SPI_slave_reci is

    type   enable_spi   is (ENB, DIS, WAITING);
    signal state        :   enable_spi                          := ENB;

    -- index incoming data
    signal i_index      :   integer range 0 to 15               := 15;

    -- wire, basically buffer data to dataout
    signal w_data       :   std_logic_vector (15 downto 0)      := (others => '0');

    -- shift register to shift data to output
    signal w_shift      :   std_logic_vector (15 downto 0)      := (others => '0');

    -- is busy
    signal w_busy       :   std_logic                           := '0';

    -- is everything recieved -- rdy to read from
    signal w_ready      :   std_logic                           := '1';

    begin

    data <= w_data;

    busy <= w_busy;

    ready <= w_ready;

    process( ss, sck )

        begin

            case( state ) is

                when ENB =>

                    if ( ss = '0' ) then

                        w_busy <= '1';

                        w_ready <= '0';

                        i_index <= 15;

                        w_shift <= (others => '0');

                        state <= DIS;

                    else

                        state <= ENB;

                end if;

                --/ /--

                when DIS =>
                    if ( ss = '0' ) then

                        if( rising_edge(sck) ) then

                            if ( i_index >= 1 ) then

                                w_shift(i_index) <= mosi;

                                i_index <= i_index - 1;

                                state <= DIS;

                            elsif ( i_index = 0 ) then

                                w_shift(i_index) <= mosi;

                                state <= WAITING;

                            end if;

                        end if;

                    else

                        w_shift <= (others => '0');

                        state <= WAITING;

                    end if;
                    --/ /--
                    when WAITING =>

                        if( ss = '1' ) then

                            w_data <= w_shift;

                            w_busy <= '0';

                            w_ready <= '1';

                            state <= ENB;

                        end if;

            end case;

    end process;

end Behavioral;
