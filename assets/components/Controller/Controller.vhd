----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/06/2019 09:21:32 AM
-- Design Name:
-- Module Name: CONTROLLER - Behavioral
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

entity CONTROLLER is
    port(

        clk                         :   in  std_logic;

        sck                         :   in  std_logic;

        ss                          :   in  std_logic;

        mosi                        :   in  std_logic;

        miso                        :   out std_logic                      := '0'

    );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

    component SPI_topmodule is
        port(

            clk                     :   in  std_logic;

            sck                     :   in  std_logic;

            ss                      :   in  std_logic;

            mosi                    :   in  std_logic;

            miso                    :   out std_logic                      := '0';

            control_answer          :   in  std_logic;

            spi_sleep               :   out std_logic                      := '0';

            data_controller_i       :   in  std_logic_vector(15 downto 0);

            data_controller_o       :   out std_logic_vector(15 downto 0)  := (others => '0')

            );
    end component;
    -- / / --
    type MODE is (IDLE, REPLY, WAITING);
    signal state                    :   MODE   := IDLE;

    signal w_data_too_spitop        :   std_logic_vector(15 downto 0);

    signal w_data_from_spitop       :   std_logic_vector(15 downto 0)     := (others => '0');

    signal w_control_answer         :   std_logic                         := '0';

    signal w_spitop_sleep           :   std_logic                         := '0';

    signal w_shift                  :   std_logic_vector( 15 downto 0)    := (others => '0');

    -- / / --
    begin

    process(clk, w_spitop_sleep) begin

         case( state ) is

                when IDLE =>

                    if (w_spitop_sleep = '1') then

                        w_control_answer <= '0';

                        w_shift <= w_data_from_spitop;

                        state <= REPLY;

                    else

                        state <= IDLE;

                    end if;
                    -- / / --
                when REPLY =>

                    if( w_shift(3 downto 0) = "0000" ) then

                        w_data_too_spitop <= (others => '0');

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0001" ) then

                        w_data_too_spitop <= x"00F0";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0010" ) then

                        w_data_too_spitop <= x"0F00";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0011" ) then

                        w_data_too_spitop<= x"0FF0";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0100" ) then

                        w_data_too_spitop <= x"F000";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0101" ) then

                        w_data_too_spitop <= x"F0F0";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0110" ) then

                        w_data_too_spitop <= x"FF00";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "0111" ) then

                        w_data_too_spitop <= x"FFF0";

                        state <= WAITING;

                    elsif( w_shift(3 downto 0) = "1001" ) then

                        w_data_too_spitop <= x"AAA0";

                        state <= WAITING;

                    else

                        w_data_too_spitop <= x"0FF0";

                        state <= WAITING;

                    end if;
                    -- / / --
                when WAITING =>

                    if ( w_control_answer = '0' ) then

                        w_control_answer <= '1';

                        state <= WAITING;

                    else

                        state <= IDLE;

                    end if;

            end case;

    end process;
--------------------------------------------------------------------------------
    SPI: SPI_TOPMODULE
    port map(clk => clk,
             sck => sck,
             ss => ss,
             mosi => mosi,
             miso => miso,
             data_controller_i => w_data_too_spitop,
             data_controller_o => w_data_from_spitop,
             control_answer => w_control_answer,
             spi_sleep => w_spitop_sleep
             );

end Behavioral;
