library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debounce is

    generic
    (
        c_clk_freq  :       POSITIVE                                := 100000000;
        c_debounce  :       INTEGER                                 := 20  -- ms
    );

    port
    (
        i_clk       : in    STD_LOGIC;
        i_signal    : in    STD_LOGIC;
        o_signal    : out   STD_LOGIC                               := '0'
    );

end debounce;

architecture dataflow of debounce is

constant    c_dur_debounce  : INTEGER                               := c_clk_freq * c_debounce * (1/1000);

signal      r_counter       : INTEGER                               := 0;
signal      s_signal        : STD_LOGIC                             := '0';

begin

process(i_clk) begin

    if rising_edge(i_clk) then

        if (i_signal /= s_signal) then
            s_signal <= i_signal;
            r_counter <= 0;
        elsif (r_counter = c_dur_debounce) then
            o_signal <= s_signal;
        else
            r_counter <= r_counter + 1;
        end if;

    end if;

end process;

end dataflow;
