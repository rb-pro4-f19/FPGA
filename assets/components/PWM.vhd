----------------------------------------------------------------------------------
-- Company: SDU TEK
-- Engineer: Martin Dong & Andreas
--
-- Create Date: 02/21/2019 15:19:22 PM
-- Design Name:
-- Module Name: PWM - Behavioral
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
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
-- MAIN ENTITY
--------------------------------------------------------------------------------
entity PWM is
generic(
		clk_divider	   	 		 : INTEGER	:= 6;		--Divides the clock for PWM_counter
		PWM_maxval					 : INTEGER  := 255
);

port(
		clk	 				  	   	 : in  STD_LOGIC;
		JA    			 	     	 : out STD_LOGIC_VECTOR(7 downto 0);
		data   	    	 			 : in  STD_LOGIC_VECTOR(7 downto 0)
);
end PWM;
-------------------------ARCH STARTS HEREE--------------------------------------
architecture Behavioral of PWM is
--------------------------------------------------------------------------------

		type	 STATE_DIR    is (UP, DOWN);
		type   STATE_OUTPUT	is (HIGH, LOW, MAX);

--------------------------------------------------------------------------------

		signal PWM_counter   : INTEGER range 0 to PWM_maxval := 0;
		signal t             : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
		signal pwm_value   	 : INTEGER range 0 to PWM_maxval := 0;
		signal state_counter : STATE_DIR 										 := UP;
		signal state_PWM	   : STATE_OUTPUT 								 := LOW;

--------------------------------------------------------------------------------
    begin -- start here --------------------------------------------------------
--------------------------------------------------------------------------------

		pwm_value <= conv_integer(data);  -- Convert data to integer

		Counter_32bit: Process ( clk )
		begin
		    if ( rising_edge ( clk ) ) then
		        t <= t + 1;
		    end if;
		end process;

		----------------------------------------------------------------------------

		Phase_corrected_PWM: Process ( t )
		begin
			if ( rising_edge ( t ( clk_divider ) ) ) then
					case ( state_counter ) is
							when UP =>
									if ( PWM_counter < PWM_maxval ) then
											PWM_counter <= PWM_counter + 1;
									else
											state_counter <= DOWN;
									end if;

							when DOWN =>
									if ( PWM_counter > 0 ) then
											PWM_counter <= PWM_counter - 1;
									else
											state_counter <= UP;
									end if;
				  end case;
			end if;
		end process;

		----------------------------------------------------------------------------

		JA(1) <= '0' when ( state_counter = UP and PWM_counter > pwm_value )
	else '1' when ( state_counter = DOWN and PWM_counter < pwm_value );

end Behavioral;
