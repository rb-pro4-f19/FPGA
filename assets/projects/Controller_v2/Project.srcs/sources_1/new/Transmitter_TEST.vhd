----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/19/2019 05:45:42 PM
-- Design Name:
-- Module Name: Reciever_TEST - Behavioral
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

entity Controller_TEST is
    port(
        clk                 :   in  std_logic;
        sck                 :   in  std_logic;
        ss                  :   in  std_logic;
        mosi                :   in  std_logic;
        miso                :   out std_logic;
        led                 :   out std_logic_vector(15 downto 0)
    );
end Controller_TEST;

architecture Behavioral of Controller_TEST is

component CONTROLLER is
    port(
        clk                         :   in  std_logic;
        sck                         :   in  std_logic;
        ss                          :   in  std_logic;
        mosi                        :   in  std_logic;
        miso                        :   out std_logic                      := '0';
        CE_motor_1                  :   out std_logic;
        CE_motor_2                  :   out std_logic;
        motor_o_1                   :   out std_logic_vector(1 downto 0);
        motor_o_2                   :   out std_logic_vector(1 downto 0);
        w_enc_1                     :   in  std_logic_vector(1 downto 0);
        w_enc_2                     :   in  std_logic_vector(1 downto 0)
    );
end component;

begin


   DUT: CONTROLLER
   port map(clk => clk, sck => sck, ss => ss, miso => miso, mosi => mosi, motor_o_1 => led(15 downto 14), motor_o_2  => led(1 downto 0), CE_motor_1 => open, CE_motor_2 => open);


end Behavioral;
