
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CHECKsum_TB is
end CHECKsum_TB;

architecture Behavioral of CHECKsum_TB is

component SPI_checksum 
port(
    clk                 :   in  std_logic;
    data                :   in  std_logic_vector(15 downto 0);
    start_in            :   in  std_logic := '0';
    ready               :   out std_logic := '1';
    checksum            :   out std_logic_vector(3 downto 0)
);
end component;


    constant data_l     : integer := 16;
    signal b_checksum   : std_logic_vector(3 downto 0) := x"0";
    signal b_data       : std_logic_vector(data_l-1 downto 0) := x"0000";
    signal b_clk        : std_logic := '0';
    signal b_start_in   : std_logic := '0';
    signal b_ready      : std_logic := '1';
    signal b_ein        : std_logic_vector(3 downto 0) := x"C";
    signal b_two        : std_logic_vector(3 downto 0) := x"A";
    signal b_three      : std_logic_vector(3 downto 0) := x"B";
    

-----------------------------------------------

begin
    
--------------------------------------------------------------------------------

clk : process
constant period: time := 1 ns;
begin
    wait for period;
    b_clk <= '1';
    b_clk <= not(b_clk);
end process;

sim : process
begin
    wait for 5 ns;
    b_data <= x"b8e8";
    b_start_in <= '1';
    wait for 2 ns;
    b_start_in <= '0';
    b_three <= b_three(2 downto 0) & b_three(3);
    wait for 9 ns;
    b_data <= x"0000";
    wait for 9 ns;
    b_three <= std_logic_vector(unsigned(b_two) + unsigned(b_ein));
    b_start_in <= '1';
    wait;
end process;

    --b_three <= std_logic_vector(unsigned(b_ein) + unsigned(b_two));

TB_TOP : SPI_checksum
    port map(clk => b_clk, data => b_data, start_in => b_start_in, ready => b_ready, checksum => b_checksum);

end Behavioral;
