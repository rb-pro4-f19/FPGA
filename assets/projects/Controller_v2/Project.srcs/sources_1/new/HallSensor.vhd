library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity HALLSENSOR is
	port(

        	clk : in  STD_LOGIC;
			hall_in : in STD_LOGIC;
			hall_out : out STD_LOGIC;
			hall_read : in STD_LOGIC

		);
end HALLSENSOR;

architecture Behavioral of HALLSENSOR is

signal sclk: integer;                           	                    --Vector til clock divider

signal sampled_in : std_logic_vector (7 downto 0);					  	--Vector til samples

begin

	process(clk)

	   variable current_state: STD_LOGIC;

		begin

			if rising_edge(clk) then

			    sclk <= sclk +1;

				if ( sclk = 100 ) then                            	            --Sættes til 1 mhz  (100 mhz / 100)

                    sampled_in(7 downto 0) <= sampled_in(6 downto 0) & hall_in;

					if ( sampled_in = x"00" ) then

						current_state := '0';

                    elsif ( sampled_in = x"FF" ) then

                        current_state := '1';

                    end if;

 				sclk <= 0;

			    end if;

			end if;

			if hall_read = '1' then                 					--Hvis værdien skal læses outputtes værdier til cal_out;

                 hall_out <= current_state;

            end if;

	end process;

end Behavioral;
