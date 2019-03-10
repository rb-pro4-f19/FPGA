----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/04/2019 07:28:51 PM
-- Design Name:
-- Module Name: SPL_slave - Behavioral
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
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SPI_slave_trns is
    port(
    sck                     :   in  std_logic;
    ss                      :   in  std_logic;
    data                    :   in  std_logic_vector(15 downto 0);
    miso                    :   out std_logic;
    busy                    :   out std_logic
    );
end SPI_slave_trns;
architecture Behavioral of SPI_slave_trns is

    type enable_spi         is (ENB, DIS, WAITING);

    signal state            :   enable_spi  := ENB;
    signal b_busy           :   std_logic;
    signal b_miso           :   std_logic;
    signal b_data_transmit  :   std_logic_vector(15 downto 0);
    signal shift_reg        :   std_logic_vector(15 downto 0);
    signal index            :   integer;

    begin
--------------------------------------------------------------------------------
    busy <= b_busy;
    miso <= b_miso;
    b_data_transmit <= data;
--------------------------------------------------------------------------------
    process(sck, ss)
    begin
--------------------------------------------------------------------------------
        case( state ) is
--------------------------------------------------------------------------------
        when ENB =>
        if (ss = '0') then
            b_busy <= '1';
            shift_reg <= b_data_transmit;
            b_miso <= b_data_transmit(15);
            index <= 14;
            state <= DIS;
        else
            b_busy <= '0';
            state <= ENB;
        end if;

--------------------------------------------------------------------------------
        when DIS =>
        if (ss = '0') then
            if(falling_edge(sck)) then
                if (index >= 1) then
                    b_miso <= shift_reg(index);
                    index <= index - 1;
                    state <= DIS;
                elsif (index = 0) then
                    b_miso <= shift_reg(index);
                    state <= WAITING;
                end if;
            end if;
        else
            b_miso <= '0';
            state <= WAITING;
        end if;

--------------------------------------------------------------------------------
        when WAITING =>
            if(ss = '1') then
                b_busy <= '0';
                b_miso <= '0';
                state <= ENB;
            end if;

--------------------------------------------------------------------------------
        end case;

        end process;
    end Behavioral;
