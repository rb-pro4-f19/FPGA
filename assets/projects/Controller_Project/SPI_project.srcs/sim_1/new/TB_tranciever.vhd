

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_tranciever is
--  Port ( );
end TB_tranciever;

architecture Behavioral of TB_tranciever is

component SPI_slave_trns is
    port(
    sck     :   in  std_logic;
    ss      :   in  std_logic;
    data    :   in  std_logic_vector(15 downto 0);
    miso    :   out std_logic;
    busy    :   out std_logic := '0'
    );
end component;

    signal sck : std_logic := '1';
    signal ss : std_logic := '1';
    signal b_data_trns : std_logic_vector(15 downto 0) := x"F0F0";
    signal miso : std_logic;
    signal busy : std_logic;

begin


clk : process
constant period: time := 1 ns;
begin
wait for period;
sck <= '1';
sck <= not(sck);
end process;

process
constant period: time := 50 ns;
begin
wait for period;
ss <= '1';
ss <= not(ss);
end process;



UTRNS: SPI_slave_trns
    port map(sck => sck, ss => ss, data => b_data_trns, miso => miso, busy => busy);


end Behavioral;
