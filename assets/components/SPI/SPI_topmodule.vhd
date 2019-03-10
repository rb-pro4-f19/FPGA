----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/04/2019 11:27:16 PM
-- Design Name:
-- Module Name: SPI_topmodule - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPI_topmodule is
port(
    clk                     :   in  std_logic;
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    mosi                    :   in  std_logic;
    control_answer          :   in  std_logic;
    data_controller_i       :   in  std_logic_vector(15 downto 0) := x"0000";
    miso                    :   out std_logic;
    data_controller_o       :   out std_logic_vector(15 downto 0) := x"0000";
    spi_sleep               :   out std_logic := '0'
    );
end SPI_topmodule;

architecture Behavioral of SPI_topmodule is
--------------------------------------------------------------------------------
component SPI_slave_trns is
    port(
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    data                    :   in  std_logic_vector(15 downto 0);
    miso                    :   out std_logic;
    busy                    :   out std_logic
    );
end component;
--------------------------------------------------------------------------------
component SPI_slave_reci is
    port(
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    mosi                    :   in  std_logic;
    data                    :   out std_logic_vector(15 downto 0) := x"0000";
    busy                    :   out std_logic := '0';
    ready                   :   out std_logic := '1'
    );
end component;
--------------------------------------------------------------------------------
component SPI_checksum
port(
    clk                     :   in  std_logic;
    data                    :   in  std_logic_vector(15 downto 0);
    start_in                :   in  std_logic;
    ready                   :   out std_logic := '1';
    checksum                :   out std_logic_vector(3 downto 0) := "0000"
);
end component;
--------------------------------------------------------------------------------
type STATE_MACH is (IDLE, RECI, WAIT_CTRL, TRNS, WAITING);
--------------------------------------------------------------------------------
signal state                : STATE_MACH := IDLE;
signal b_busy               : std_logic;
signal b_busy_reci          : std_logic;
signal b_busy_trns          : std_logic;
signal b_trns               : std_logic_vector(15 downto 0) := x"F0F0";
signal b_reci               : std_logic_vector(15 downto 0);
signal b_spi_sleep          : std_logic := '0';
signal b_ready              : std_logic := '1';
signal b_shift              : std_logic_vector(15 downto 0) := x"0000";

signal b_check_data         : std_logic_vector(15 downto 0) := x"0000";
signal b_start              : std_logic := '0';
signal b_check_ready        : std_logic;
signal b_checksum           : std_logic_vector(3 downto 0);
signal b_to_checksum        : std_logic_vector(15 downto 0);
signal b_transmit_buf       : std_logic_vector(15 downto 0) := x"0000";
signal b_data_controller_i  : std_logic_vector(15 downto 0);

signal b_data_controller_o  :    std_logic_vector (15 downto 0) := x"0000";
signal b_miso               :    std_logic;

--------------------------------------------------------------------------------
begin
    b_data_controller_i <= b_reci;
    b_busy <= b_busy_reci or b_busy_trns;
    spi_sleep <= b_spi_sleep;
    data_controller_o <= b_data_controller_o;
    miso <= b_miso;
    b_check_data <= b_to_checksum;
    b_trns <= b_transmit_buf;

process( clk, ss ) begin
    if( ss = '1' ) then
            case( state ) is
                when IDLE =>
                    if ( b_busy = '0' ) and ( b_ready = '1' ) then
                        b_spi_sleep <= '0';
                        b_shift <= b_reci;                                 -- init read from reciever to controller! bad practice to read from b_check_data later!
                        b_to_checksum <= b_reci;                           -- load data recieved
                        b_start <= '1';
                        state <= RECI;
                    else
                        state <= IDLE;
                    end if;

                when RECI =>
                    if ( b_start = '0' ) and ( b_check_ready = '1') then
                        if ( b_checksum = b_shift(3 downto 0) ) then
                            b_spi_sleep <= '1';
                            b_data_controller_o <= b_shift;                     -- checksum was right
                            state <= WAIT_CTRL;
                        else
                            b_spi_sleep <= '1';
                            b_data_controller_o <= x"AAAA";                     -- checksum was wrong
                            state <= WAIT_CTRL;
                        end if;
                    else
                        b_start <= '0';                                         --
                        state <= RECI;                                          --
                    end if;

                when WAIT_CTRL =>
                    if (b_spi_sleep = '0') then
                        if (control_answer = '1') then                          -- wait for controller to answer!                       --
                            b_spi_sleep <= '0';                                 --
                            b_shift <= b_data_controller_i;                     -- read from controller to transmit!
                            b_to_checksum <= b_data_controller_i;               --
                            b_start <= '1';                                     -- start checksum
                            state <= TRNS;
                        else
                            state <= WAIT_CTRL;
                        end if;
                    else
                        b_spi_sleep <= '0';                                     --
                        state <= WAIT_CTRL;                                     --
                    end if;

                when TRNS =>
                    if (b_start = '0') and (b_check_ready = '1') then           -- burn a clock cycle
                        b_transmit_buf(15 downto 0) <=
                        b_shift(15 downto 4) & b_checksum;                      -- send to transmission
                        state <= WAITING;
                    else
                        b_start <= '0';                                         --
                        state <= TRNS;                                          --
                    end if;

                when WAITING =>
                    state <= WAITING;

            end case;
    else
        state <= IDLE;
    end if;
end process;


URECI: SPI_slave_reci
    port map(sck => sck, ss => ss, mosi => mosi, data => b_reci, busy => b_busy_reci, ready => b_ready);

UTRNS: SPI_slave_trns
    port map(sck => sck, ss => ss, miso => b_miso, data => b_trns, busy => b_busy_trns);

CHK : SPI_checksum
    port map(clk => clk, data => b_check_data, start_in => b_start, ready => b_check_ready, checksum => b_checksum );

end Behavioral;
