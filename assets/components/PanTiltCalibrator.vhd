library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity calibrator is
    Port ( clk : in  STD_LOGIC;
           JA: in STD_LOGIC_VECTOR(7 downto 0);
           cal_out: out STD_LOGIC_VECTOR(1 downto 0);
           cal_read: in STD_LOGIC
			  );
end calibrator;

architecture Behavioral of calibrator is

signal sclk: std_logic_vector (6 downto 0);
signal sampledA, sampledB : std_logic_vector (7 downto 0);


begin

	process(clk)
	   variable Aout, Bout: STD_LOGIC;
		begin 
		
		    
		    
			if rising_edge(clk) then
				if sclk = "1100100" then                            --Sættes til 1 mhz  (100 mhz / 100)
				
                    SampledA(7 downto 1) <= SampledA(6 downto 0);
                    SampledA(0) <= JA(4);                           --Ændres til den ønskede port
                    
                    SampledB(7 downto 1) <= SampledB(6 downto 0);
                    SampledB(0) <= JA(5);                           --Ændres til den ønskede port
                    
					if (SampledA = (SampledA'range => '0')) then 
						Aout := SampledA(0);
                    elsif (SampledA = (SampledA'range => '1')) then 
                        Aout := SampledA(0);
                    end if;
                    
                    if (SampledB = (SampledB'range => '0')) then 
                        Bout := SampledB(0);
                    elsif (SampledB = (SampledB'range => '1')) then 
                        Bout := SampledB(0);
					end if;
					
					sclk <="0000000";
					
				else
					sclk <= sclk +1;
				end if;
				
				if cal_read = '1' then                 --Hvis værdien skal læses outputtes værdier til cal_out;
                    cal_out <= Aout&Bout;
                
                end if;
                
            end if;
        
	end process;
	
end Behavioral;


