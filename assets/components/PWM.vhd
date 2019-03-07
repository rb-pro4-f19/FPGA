library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---------------------------------------------------------------------------------------------------
-- MAIN ENTITY
---------------------------------------------------------------------------------------------------

entity PWM is

	port
	(
		clk				: in	STD_LOGIC;
		JA              : out   STD_LOGIC_VECTOR(7 downto 0);
		JB              : in    STD_LOGIC_VECTOR(7 downto 0)
	);

end PWM;

architecture Behavioral of PWM is

---------------------------------------------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------------------------------------------

-- COMPONENT: MODULE_NAME


---------------------------------------------------------------------------------------------------

-- ...

---------------------------------------------------------------------------------------------------
-- INTERNAL CONNECTIONS & CONSTANTS
---------------------------------------------------------------------------------------------------


signal      Xi                  : INTEGER range 0 to 255;


signal      t                   : STD_LOGIC_VECTOR(31 downto 0);


signal      pwm_value           : INTEGER range 0 to 255;


---------------------------------------------------------------------------------------------------

begin

---------------------------------------------------------------------------------------------------
-- PORT MAPPING
---------------------------------------------------------------------------------------------------


pwm_value <= conv_integer(JB);


Counter_32bit: Process(clk)
begin
    if rising_edge(clk) then
        t <= t + 1;
    end if;
end process;


Counter_scale: Process(t)
begin
    if rising_edge(t(7)) then
        Xi <= Xi + 1;
    end if;
end process;


JA(1) <= '0' when Xi >= pwm_value
else '1';

end Behavioral;