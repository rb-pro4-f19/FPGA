library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

---------------------------------------------------------------------------------------------------
-- MAIN ENTITY
---------------------------------------------------------------------------------------------------

entity main is

	generic
	(
		CLK_FREQ  		:		POSITIVE
						:=		100000000
	);

	port
	(
		clk				: in	STD_LOGIC;
		sw				: in	STD_LOGIC_VECTOR(15 downto 0);
		led				: out	STD_LOGIC_VECTOR(15 downto 0);
		btnU,
		btnL,
		btnC,
		btnR,
		btnD			: in	STD_LOGIC;
		seg				: out	STD_LOGIC_VECTOR(6 downto 0);
		dp				: out	STD_LOGIC;
		an				: out	STD_LOGIC_VECTOR(3 downto 0)
	);

end main;

architecture structure of main is

---------------------------------------------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------------------------------------------

-- COMPONENT: MODULE_NAME
component module_name is

	generic
	(
		GENERIC1		:		POSITIVE
						:=		100000000;

		GENERIC2		:		INTEGER
						:=		500
	);

	port
	(
		i_clk			: in	STD_LOGIC;
		o_sig			: out	STD_LOGIC
	);

end component;

---------------------------------------------------------------------------------------------------

-- ...

---------------------------------------------------------------------------------------------------
-- INTERNAL CONNECTIONS & CONSTANTS
---------------------------------------------------------------------------------------------------

type		SOME_STATE is (RDY, LOAD_BIT, SEND_BIT);

constant	SOME_CONST			: INTEGER
								:= CLK_FREQ * 2;

signal		r_some_state		: SOME_STATE
								:= RDY;

signal		r_some_register		: STD_LOGIC_VECTOR(9 downto 0)
								:= (others => '0');

signal		s_some_signal		: STD_LOGIC
								:= '0';

---------------------------------------------------------------------------------------------------

begin

---------------------------------------------------------------------------------------------------
-- PORT MAPPING
---------------------------------------------------------------------------------------------------

U1:	module_name
	port map
	(
		i_clk		=> clk,
		o_sig		=> dp
	);

end structure;
