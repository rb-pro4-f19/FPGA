
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Debounce is
    Port ( clk : in  STD_LOGIC;
           Ain : in  STD_LOGIC; 
           Bin : in  STD_LOGIC;
           Aout: out STD_LOGIC;
           Bout: out STD_LOGIC
			  );
end Debounce;

architecture Behavioral of Debounce is

signal sclk: integer;
signal sampledA, sampledB : std_logic_vector (4 downto 0) := "10101";
begin

	process(clk)
		begin 
			if rising_edge(clk) then
				if sclk = 100 then --Sættes til 1mhz (100 mhz / 100)
				
                    SampledA(4 downto 1) <= SampledA(3 downto 0);   --Shiftregister indholder 4 værdier
                    SampledA(0) <= Ain;
                    
                    SampledB(4 downto 1) <= SampledB(3 downto 0);   --Shiftregister indholder 4 værdier
                    SampledB(0) <= Bin;
                    
					if (SampledA = (SampledA'range => '0')) then    --Hvis alle værdier er 0 sættes 0
						Aout <= Ain;
                    elsif (SampledA = (SampledA'range => '1')) then --Hvis alle værdier er 1 sættes 1
                        Aout <= Ain;
                    end if;
                    
                    if (SampledB = (SampledB'range => '0')) then    --Hvis alle værdier er 0 sættes 0
                        Bout <= Bin;
                    elsif (SampledB = (SampledB'range => '1')) then --Hvis alle værdier er 1 sættes 1
                        Bout <= Bin;
					end if;
					sclk <= 0;                               --Clock divider count resetes
				else
					sclk <= sclk +1;                                --Clock divider count incrementeres
				end if;
			end if;
	end process;
	
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Enc is
		Port (
					clk: in STD_LOGIC;
                    A,B : in STD_LOGIC;
                    reset: in STD_LOGIC;
					encoderValue: out STD_LOGIC_VECTOR ( 11 downto 0)

			  );
end Enc;

architecture Behavioral of Enc is

begin

process(clk)
    variable ABab: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    variable int_ABab: integer range 0 to 15;
    variable encVal: signed (11 downto 0);
    variable wasRead: STD_LOGIC;
    
begin
    if rising_edge(clk) then
        ABab := A&B&ABab(3)&ABab(2);
        int_ABab := to_integer(unsigned(ABab));
        case int_ABab is
            when 0|5|10|15 =>               --Der tjekkes for kombinationer hvor der ikke er sket en ændring "0000" "1010" "0101" "1111"
                        encVal := encVal;
            when 1|7|8|14 =>                --Der tjekkes for kombinationer hvor der er sket en postiv rotation ændring "0001" "0111" "1000" "1110"
                        encVal := encVal +1;
            when 2|4|11|13 =>               --Der tjekkes for kombinationer hvor der er sket en postiv rotation ændring "0010" "0100" "1011" "1101"
                        encVal := encVal -1;
            when others =>                  --Alle andre kombinationer er ulovlige
                        null;
                        
        end case;
        if reset = '1' then                 --Hvis værdien skal læses outputtes værdien til encoderValue;
			if wasRead = '0' then
				encoderValue <= std_logic_vector(encVal);
				wasRead := '1';    
			end if;
        elsif reset = '0' then              
            if wasRead = '1' then           --Bruges som tjek til at se om værdien har været læst (da der ikke må bruges faling edge)
            encVal := "000000000000";       --encVal resetes til 0
            wasRead := '0';                 --Gør klar til endnu en læsning
            end if;
        end if;
         
    end if;
 end process;
 
 end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity RotENC is
    Port (
			 clk: in STD_LOGIC;
             Ain: in STD_LOGIC;
			 Bin: in STD_LOGIC;
             encoder_read: in STD_LOGIC;
             encoder_out:  out STD_LOGIC_VECTOR(11 downto 0)

			  );
end RotENC;



architecture Behavioral of RotENC is
component Debounce is
	port(
			clk : in  STD_LOGIC;
            Ain : in  STD_LOGIC;
            Bin : in  STD_LOGIC;
            Aout: out STD_LOGIC;
            Bout: out STD_LOGIC
		);
	end component;
    
    
component Enc is
	Port (
            clk: in STD_LOGIC;
            A,B : in STD_LOGIC;
            reset: in STD_LOGIC;
            encoderValue: out STD_LOGIC_VECTOR (11 downto 0)
	      );
	end component;
	
	
	signal A,B: STD_LOGIC;
	

begin
    
	C0: Debounce port map ( clk=>clk, Ain=>Ain, Bin=>Bin, Aout=>A , Bout=>B);
	C2: Enc port map ( clk=>clk, A=>A, B=>B ,reset=>encoder_read, encoderValue=>encoder_out);
	
end Behavioral;
