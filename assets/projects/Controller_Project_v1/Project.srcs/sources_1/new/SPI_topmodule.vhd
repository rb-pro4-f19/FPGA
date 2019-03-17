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
    clk                       :   in  std_logic;
    sck                       :   in  std_logic;
    ss                        :   in  std_logic;
    mosi                      :   in  std_logic;
    miso                      :   out std_logic                         := '0';
    control_answer            :   in  std_logic;
    spi_signa                 :   out std_logic                         := '0';
    data_controller_i         :   in  std_logic_vector(15 downto 0);
    data_controller_o         :   out std_logic_vector(15 downto 0)     := (others => '0')
    );
end SPI_topmodule;
    -- / / --
architecture Behavioral of SPI_topmodule is
    -- / / --

type states                     is (IDLE, RECI, WAIT_CTRL, TRNS, WAITING);
signal state                    : states := IDLE;

-- busy from reci and trns

signal w_busy,
       w_busy_trns,
       w_busy_reci              : std_logic                             := '0';


signal w_trns_data,
       w_reci_data,
       w_shift                  : std_logic_vector(15 downto 0)         := (others => '0');


signal w_cs_index               : natural range 0 to 3                  := 0;

signal w_cs_data                : std_logic_vector(3 downto 0)          := (others => '0');


begin

w_busy <= w_busy_reci or w_busy_trns;

process(clk)
begin
    if rising_edge(clk) then
        case( state ) is
            when IDLE =>
                w_cs_index <= 0;
                spi_signa <= '0';
                w_shift <= w_reci_data;
                
                if w_busy = '0' then
                    state <= RECI;
                else
                    state <= IDLE;
                end if;

            when RECI =>
                w_cs_index <= w_cs_index + 1;
                
                case( w_cs_index ) is
                    when 0 =>
                        w_cs_data <= f_CS( data_cs => w_shift(15 downto 12), current_cs => (others => '0') );
                    when 1 =>
                        w_cs_data <= f_CS( data_cs => w_shift(11 downto 8), current_cs => w_cs_data );
                    when 2 =>
                        w_cs_data <= f_CS( data_cs => w_shift(7 downto 4), current_cs => w_cs_data );
                    when 3 =>
                        if w_cs_data = w_shift(3 downto 0) then
                            data_controller_o <= w_shift;
                        else
                            data_controller_o <= (others => '0');
                        end if;
                end case;
                
                if w_cs_index = 3 then
                    spi_signa <= '1';
                    state <= WAIT_CTRL;
                elsif w_busy = '1' then
                    state <= IDLE;
                else
                    state <= RECI;
                end if;
                


            when WAIT_CTRL =>
                w_cs_index <= 0;
                spi_signa <= '0';
                
                if control_answer = '1' then
                    w_shift <= data_controller_i;
                    state <= TRNS;
                elsif w_busy = '1' then
                    state <= IDLE;
                else
                    state <= WAIT_CTRL;
                end if;

            when TRNS =>
                w_cs_index <= w_cs_index + 1;
                
                case( w_cs_index ) is
                    when 0 =>
                        w_cs_data <= f_CS( data_cs => w_shift(15 downto 12), current_cs => (others => '0') );
                    when 1 =>
                        w_cs_data <= f_CS( data_cs => w_shift(11 downto 8), current_cs => w_cs_data );
                    when 2 =>
                        w_cs_data <= f_CS( data_cs => w_shift(7 downto 4), current_cs => w_cs_data );
                    when 3 =>
                        w_trns_data(15 downto 0) <= w_shift(15 downto 4) & w_cs_data;
                end case;
                
                if w_cs_index = 3 then
                    state <= WAITING;
                else
                    state <= TRNS;
                end if;

            when WAITING =>
                if(w_busy = '1') then
                    state <= IDLE;
                else
                    state <= WAITING;
                end if;
        end case;
    end if;
end process;

URECI: SPI_slave_reci
    port map(sck => sck, ss => ss, mosi => mosi, data => w_reci_data, busy => w_busy_reci);

UTRNS: SPI_slave_trns
    port map(sck => sck, ss => ss, miso => miso, data => w_trns_data, busy => w_busy_trns);

end Behavioral;
