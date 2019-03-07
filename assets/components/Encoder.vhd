library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---------------------------------------------------------------------------------------------------
-- MAIN ENTITY
---------------------------------------------------------------------------------------------------

ENTITY Encoder IS

    port
	(
		clk				: in	STD_LOGIC;
		JA              : out   STD_LOGIC_VECTOR(7 downto 0);
		JB              : in    STD_LOGIC_VECTOR(7 downto 0)
	);

END Encoder;

architecture Behavioral of Encoder is

---------------------------------------------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------------------------------------------

-- COMPONENT: MODULE_NAME


---------------------------------------------------------------------------------------------------

-- ...

---------------------------------------------------------------------------------------------------
-- INTERNAL CONNECTIONS & CONSTANTS
---------------------------------------------------------------------------------------------------


signal      t                   : STD_LOGIC_VECTOR(31 downto 0);


signal      sampleA,
            sampleB,
            checkout,
            A,
            B                   : STD_LOGIC;


---------------------------------------------------------------------------------------------------

begin

---------------------------------------------------------------------------------------------------
-- PORT MAPPING
---------------------------------------------------------------------------------------------------



Counter_32bit: Process(clk)
begin
    if rising_edge(clk) then
        t <= t + 1;
    end if;
end process;


Debounce: process(t(15))
begin
    if rising_edge(t(15)) then
        if(checkout = '1') then
            
            if(sampleA = JB(0)) then
                A <= sampleA;
            end if;
            
            if(sampleB = JB(1)) then
                B <= sampleB;
            end if;
            
            checkout <= '0';
            
            else 
            checkout <= '1';
            
        end if;
        sampleA <= JB(0);
        sampleB <= JB(1);
    end if;
end process;


JA(0) <= sampleA;
JA(1) <= sampleB;

end Behavioral;
