----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/18/2019 02:54:33 PM
-- Design Name:
-- Module Name: PMOD_enc - Behavioral
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


entity ENCODER is
    port(

        clk          : in std_logic;
        enc_a        : in std_logic;
        enc_b        : in std_logic;
        reset        : in std_logic;
        data         : out std_logic_vector(11 downto 0)

    );
end ENCODER;

architecture Behavioral of ENCODER is

    type MODES              is (S1,S2,S3,S4);
    signal state            : MODES := S1;
    signal prevstate        : MODES := S1;

    type DIRECTION          is (RIGHT, LEFT, STILL);
    signal direc            : DIRECTION := STILL;
    signal w_spins          : signed (11 downto 0) := (others => '0');

    begin

    process(clk)

    variable shift_a    : std_logic_vector(5 downto 0) := (others => '0');

    variable shift_b    : std_logic_vector(5 downto 0) := (others => '0');

    begin

        if(rising_edge(clk)) then

            shift_a := shift_a(4 downto 0) & enc_a;

            shift_b := shift_b(4 downto 0) & enc_b;

            if(reset = '1') then

                    w_spins <= x"000";

            end if;

            if state /= prevstate then

                case( direc ) is

                    when RIGHT =>

                        w_spins <= w_spins + 1;

                    when LEFT =>

                        w_spins <= w_spins - 1;

                    when others =>

                end case;

                direc <= STILL;

            end if;

            data <= std_logic_vector(w_spins);

            prevstate <= state;

            case( state ) is

                when S1 =>
                    -- a = 0 b = 0
                    if shift_a = "000000" and shift_b = "000000" then

                        direc <= STILL;
                        state <= S1;

                    elsif shift_a = "111111" and shift_b = "000000" then

                        direc <= RIGHT;
                        state <= S2;

                    elsif shift_a = "000000" and shift_b = "111111" then

                        direc <= LEFT;
                        state <= S4;

                    end if;

                when S2 =>
                    -- a = 1 b = 0
                    if shift_a = "111111" and shift_b = "000000" then

                        direc <= STILL;
                        state <= S2;

                    elsif shift_a = "111111" and shift_b = "111111" then

                        direc <= RIGHT;
                        state <= S3;

                    elsif shift_a = "000000" and shift_b = "000000" then

                        direc <= LEFT;
                        state <= S1;

                    end if;

                when S3 =>
                    -- a = 0 b = 1
                    if shift_a = "111111" and shift_b = "111111" then

                        direc <= STILL;
                        state <= S3;

                    elsif shift_a = "000000" and shift_b = "111111" then

                        direc <= RIGHT;
                        state <= S4;

                    elsif shift_a = "111111" and shift_b = "000000" then

                        direc <= LEFT;
                        state <= S2;

                    end if;

                when S4 =>
                    -- a = 1 b = 1
                    if shift_a = "000000" and shift_b = "111111" then

                        direc <= STILL;
                        state <= S4;

                    elsif shift_a = "000000" and shift_b = "000000" then

                        direc <= RIGHT;
                        state <= S1;

                    elsif shift_a = "111111" and shift_b = "111111" then

                        direc <= LEFT;
                        state <= S3;

                    end if;

            end case;

        end if;

    end process;
    
end Behavioral;
