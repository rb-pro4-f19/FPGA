library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

---------------------------------------------------------------------------------------------------
-- ENTITY DEFINITION
---------------------------------------------------------------------------------------------------

entity blank is

	generic
	(
		GENERIC1		:		POSITIVE
						:=		100000000
	);

	port
	(
		i_clk			: in	STD_LOGIC;
		i_btnA,
		i_btnB,
		i_btnC			: in	STD_LOGIC;

		o_vec			: out	STD_LOGIC_VECTOR(9 downto 0)
	);

end blank;

---------------------------------------------------------------------------------------------------
-- ENTITY ARCHITECTURE
---------------------------------------------------------------------------------------------------

architecture behaviour of blank is

---------------------------------------------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------------------------------------------

-- COMPONENT: MODULE_NAME
component module_name is

	generic
	(
		GENERIC2		:		POSITIVE
						:=		100000000;

		GENERIC3		:		INTEGER
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

type		SOME_STATE is (IDLE, PROCESSING, ERR);

constant	SOME_CONST			: INTEGER
								:= GENERIC1 * 2;

signal		r_some_state		: SOME_STATE
								:= IDLE;

signal		r_some_register		: STD_LOGIC_VECTOR(9 downto 0)
								:= (others => '0');

signal		s_some_signal		: STD_LOGIC
								:= '0';

---------------------------------------------------------------------------------------------------

begin

---------------------------------------------------------------------------------------------------
-- SEQUENTIAL
---------------------------------------------------------------------------------------------------

process(i_clk) begin

	if rising_edge(i_clk) then

		case r_some_state is

			when IDLE =>

				s_some_signal 	<= '0';
				r_some_state 	<= PROCESSING;

			when PROCESSING =>

				r_some_state 	<= IDLE;

			when ERR =>

				-- ...

		end case;

	end if;

end process;

---------------------------------------------------------------------------------------------------
-- CONCURRENT
---------------------------------------------------------------------------------------------------

s_some_signal <= '1' when (r_some_state = PROCESSING) else '0';

---------------------------------------------------------------------------------------------------
-- PORT MAPPING
---------------------------------------------------------------------------------------------------

U1:			module_name
			generic map
			(
				10,
				200
			)
			port map
			(
				i_clk		=> i_clk,
				o_sig		=> s_some_signal
			);

end behaviour;
