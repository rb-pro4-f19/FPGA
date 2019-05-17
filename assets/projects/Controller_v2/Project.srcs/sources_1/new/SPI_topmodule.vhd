----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Daniel T.S
--
-- Create Date: 03/04/2019 11:27:16 PM
-- Design Name:
-- Module Name: SPI_topmodule - Behavioral
-- Project Name: PAN TILT
-- Target Devices: BASYS 3
-- Tool Versions: VHDL 2008
-- Description:
--
-- Dependencies:
--
-- Revision: MARCH 13 2019
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.Numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

library SPI;
use SPI.package_spi.all;

entity SPI_topmodule is
    port(

        clk                         :   in  std_logic;
        sck                         :   in  std_logic;
        ss                          :   in  std_logic;
        mosi                        :   in  std_logic;
        miso                        :   out std_logic                        := '0';
        ctrl_reply                  :   in  std_logic;
        spi_ready                   :   out std_logic                        := '0';
        data_ctrl_i                 :   in  std_logic_vector(15 downto 0);
        data_ctrl_o                 :   out std_logic_vector(15 downto 0)    := (others => '0')

        );
end SPI_topmodule;

architecture Behavioral of SPI_topmodule is

    type states                     is (IDLE, RX, WAIT_CTRL, TX, DONE);
    signal state                    : states := IDLE;

    signal w_busy,
           w_busy_tx,
           w_busy_rx              : std_logic                               := '0';


    signal w_tx_data,
           w_rx_data              : std_logic_vector(15 downto 0)           := (others => '0');


    begin

    w_busy <= w_busy_rx or w_busy_tx;

    process(clk)

        variable cs_index          : natural range 0 to 3                  := 0;
        variable cs_data           : std_logic_vector(3 downto 0)          := (others => '0');
        variable shift             : std_logic_vector(15 downto 0)         := (others => '0');
        variable rx_fail           : std_logic                             := '0';

    begin

        if rising_edge(clk) then

            case( state ) is

                when IDLE =>

                    spi_ready <= '0';
                    cs_index := 0;
                    shift := w_rx_data;

                    if ( w_busy = '0' ) then    -- if modules are busy then do nothing

                        state <= RX;
                        
                    else
                    
                        state <= IDLE;
                        
                    end if;

                when RX =>      -- calculate checksum from recieve

                    case( cs_index ) is

                        when 0 =>

                            cs_data := f_CS( data_cs => shift(15 downto 12), current_cs => (others => '0') );

                        when 1 =>

                            cs_data := f_CS( data_cs => shift(11 downto 8), current_cs => cs_data );

                        when 2 =>

                            cs_data := f_CS( data_cs => shift(7 downto 4), current_cs => cs_data );

                        when 3 =>

                            if ( cs_data = shift(3 downto 0) ) then

                                spi_ready <= '1';
                                data_ctrl_o <= shift;
                                state <= WAIT_CTRL;

                            else

                                rx_fail := '1';
                                state <= TX;

                            end if;

                    end case;

                    cs_index := cs_index + 1;

                when WAIT_CTRL =>

                    cs_index := 0;
                    spi_ready <= '0';

                    if ( ctrl_reply = '1' ) then

                        shift := data_ctrl_i;
                        state <= TX;

                    else

                        state <= WAIT_CTRL;

                    end if;

                when TX =>

                    if ( rx_fail = '1' ) then


                        rx_fail := '0';
                        w_tx_data(15 downto 0) <= x"000F";
                        state <= DONE;

                    else

                        case( cs_index ) is

                            when 0 =>

                                cs_data := f_CS( data_cs => shift(15 downto 12), current_cs => (others => '0') );

                            when 1 =>

                                cs_data := f_CS( data_cs => shift(11 downto 8), current_cs => cs_data );

                            when 2 =>

                                cs_data := f_CS( data_cs => shift(7 downto 4), current_cs => cs_data );

                            when 3 =>

                                w_tx_data(15 downto 0) <= shift(15 downto 4) & cs_data;

                        end case;

                        if cs_index = 3 then

                            state <= DONE;

                        else

                            state <= TX;

                        end if;

                        cs_index := cs_index + 1;

                    end if;

                when DONE =>

                    if(w_busy = '1') then

                        state <= IDLE;
                        
                    else
                    
                        state <= DONE;
                        
                    end if;

                when others =>

                    state <= IDLE;

            end case;

        end if;

    end process;

    URECI: SPI_slave_RX
        port map(clk => clk, sck => sck, ss => ss, mosi => mosi, data => w_rx_data, busy => w_busy_rx);

    UTRNS: SPI_slave_TX
        port map(clk => clk, sck => sck, ss => ss, miso => miso, data => w_tx_data, busy => w_busy_tx);

end Behavioral;
