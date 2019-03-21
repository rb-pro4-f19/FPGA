library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity calibrator is
    Port ( clk : in  STD_LOGIC;
           JA: in STD_LOGIC_VECTOR(7 downto 0);
           led: out STD_LOGIC_VECTOR(15 downto 0)
			  );
end calibrator;

architecture Behavioral of calibrator is

signal sclk: std_logic_vector (6 downto 0);
signal sampledA, sampledB : std_logic_vector (7 downto 0);
signal Ain : std_logic;
Signal Bin : std_logic;
signal Aout : std_logic;
Signal Bout : std_logic;

begin

	process(clk)
		begin 
		
		    Ain <= JA(2);
		    Bin <= JA(1);
		    led(2) <= Aout;
		    led(1) <= Bout;
		    
		    
			if rising_edge(clk) then
				if sclk = "1100100" then --Sættes til 1 mhz  (100 mhz / 100)
				
                    SampledA(7 downto 1) <= SampledA(6 downto 0);
                    SampledA(0) <= Ain;
                    
                    SampledB(7 downto 1) <= SampledB(6 downto 0);
                    SampledB(0) <= Bin;
                    
					if (SampledA = (SampledA'range => '0')) then 
						Aout <= Ain;
                    elsif (SampledA = (SampledA'range => '1')) then 
                        Aout <= Ain;
                    end if;
                    
                    if (SampledB = (SampledB'range => '0')) then 
                        Bout <= Bin;
                    elsif (SampledB = (SampledB'range => '1')) then 
                        Bout <= Bin;
					end if;
					
					sclk <="0000000";
				else
					sclk <= sclk +1;
				end if;
			end if;
	end process;
	
end Behavioral;


