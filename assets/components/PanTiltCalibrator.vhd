library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity hallSensor is
    Port ( clk : in  STD_LOGIC;
           cal_in: in STD_LOGIC;
           cal_out: out STD_LOGIC;
           cal_read: in STD_LOGIC
			  );
end hallSensor;

architecture Behavioral of hallSensor is

signal sclk: std_logic_vector (6 downto 0);                           	--Vector til clock divider
signal sampled_in : std_logic_vector (7 downto 0);					  	--Vector til samples


begin

	process(clk)
	   variable current_state: STD_LOGIC;
		begin 
		
		    
		    
			if rising_edge(clk) then
				if sclk = "1100100" then                            	--Sættes til 1 mhz  (100 mhz / 100)
				
                    sampled_in(7 downto 1) <= sampled_in(6 downto 0);
                    sampled_in(0) <= cal_in;                           	--Ændres til den ønskede port
                    
                    
					if (sampled_in = (sampled_in'range => '0')) then 
						current_state := sampled_in(0);
                    elsif (sampled_in = (sampled_in'range => '1')) then 
                        current_state := sampled_in(0);
                    end if;
 
				end if;
					
					sclk <="0000000";
					
			else
				sclk <= sclk +1;
			end if;
				
			if cal_read = '1' then                 					--Hvis værdien skal læses outputtes værdier til cal_out;
                    cal_out <= current_state;
                
            end if;
                
        
	end process;
	
end Behavioral;


