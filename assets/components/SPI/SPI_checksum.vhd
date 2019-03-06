----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/06/2019 08:29:32 AM
-- Design Name:
-- Module Name: SPI_checksum - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity SPI_checksum is
generic(

    data_l  :   integer := 16

    );
port(

    clk     :   in  std_logic;

    data    :   in  std_logic_vector(data_l-1 downto 0);

    ready   :   in  std_logic := true;

    busy    :   out std_logic := false;

    correct :   out std_logic

);
end SPI_checksum;

    constant mask_s : integer := 3;
    constant bitmask: STD_LOGIC_Vector(mask_s downto 0) := "1111";

--    signal b_data_a : std_logic_vector (mask_s downto 0) := "0000";
--    signal b_data_b : std_logic_vector(mask_s downto 0) := "0000";
--    signal b_data_c : std_logic_vector(mask_s downto 0) := "0000";
--    signal b_data_checksum : std_logic_vector(mask_s downto 0) := "0000";
--    signal state : integer range 0 to 2 := 0;


architecture Behavioral of SPI_checksum is

    begin

    process(clk)

    --variable b_index : integer range 0 to data_l-1;
    variable b_data_a : std_logic_vector (mask_s downto 0) := "0000";
    variable b_data_b : std_logic_vector(mask_s downto 0) := "0000";
    variable b_data_c : std_logic_vector(mask_s downto 0) := "0000";
    variable b_data_checksum : std_logic_vector(mask_s downto 0) := "0000";
    variable state : integer range 0 to 2 := 0;

    begin
      if(ready = true and busy = false) then

        ready <= false;

        busy  <= true;

      end if;

      if(ready = false and busy = true) then

        b_data_a        <= data_l(15 downto 12);
        b_data_b        <= data_l(11 downto 8);
        b_data_c        <= data_l(7 downto 4);

        b_data_checksum <= shift_left(unsigned(data_l(3 downto 0)), 4);

        b_data_checksum <= shift_left(unsigned((b_data_a + b_data_checksum) and bitmask), 4);

        b_data_checksum <= shift_left(unsigned((b_data_b + b_data_checksum) and bitmask), 4);

        b_data_checksum <= shift_left(unsigned((b_data_c + b_data_checksum) and bitmask), 4);

        if(b_data_checksum = data_l(3 downto 0)) then

          correct <= true;

        else false;
        end if;

        busy  = false;
        ready = true;

      end if;

    end process;

end Behavioral;
