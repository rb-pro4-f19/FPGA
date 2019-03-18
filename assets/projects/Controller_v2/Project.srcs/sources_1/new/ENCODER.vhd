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


entity PMOD_enc is
    port(
    signal clk          : in std_logic;
    signal a            : in std_logic;
    signal b            : in std_logic;
    signal reset        : in std_logic;
    signal data         : out std_logic_vector(11 downto 0)
    );
end PMOD_enc;

architecture Behavioral of PMOD_enc is

type MODES              is (S1,S2,S3,S4);

type DIRECTION          is (RIGHT, LEFT, STILL);

signal state            : MODES := S1;

signal prevstate        : MODES := S1;

signal direc            : DIRECTION := STILL;

signal spins            : std_logic_vector(11 downto 0) := x"800";

begin

process(clk)

    variable shift_a    : std_logic_vector(5 downto 0) := (others => '0');
    
    variable shift_b    : std_logic_vector(5 downto 0) := (others => '0');

begin

    if(rising_edge(clk)) then

        shift_a := shift_a(4 downto 0) & a;

        shift_b := shift_b(4 downto 0) & b;

        if(reset = '1') then
            
            if (spins >= x"800") then
                
                data <= '0' & spins(10 downto 0);
                
            else
            
                data <= '1' & spins(10 downto 0);
            
            end if;

            spins <= x"800";

            if shift_a = "000000" and shift_b = "000000" then

                state <= S1;
                prevstate <= S1;

            elsif shift_a = "111111" and shift_b = "000000" then

                state <= S2;
                prevstate <= S2;

            elsif shift_a = "111111" and shift_b = "111111" then

                state <= S3;
                prevstate <= S3;

            elsif shift_a = "000000" and shift_b = "111111" then

                state <= S4;
                prevstate <= S4;

            end if;

            direc <= STILL;

        else

            if state /= prevstate then
    
                case( direc ) is
    
                    -- Here, you first need to cast your input vectors to signed or unsigned
                    -- (according to your needs). Then, you will be allowed to add them.
                    -- The result will be a signed or unsigned vector, so you won't be able
                    -- to assign it directly to your output vector. You first need to cast
                    -- the result to std_logic_vector.
    
                    when RIGHT =>
                    spins <= std_logic_vector(unsigned(spins) + 1);
    
                    when LEFT =>
                    spins <= std_logic_vector(unsigned(spins) - 1);
    
                    when others =>
                    -- dont do nothing boi
    
                end case;
    
                direc <= STILL;
    
            end if;
    
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
        
     end if;

end process;

end Behavioral;
