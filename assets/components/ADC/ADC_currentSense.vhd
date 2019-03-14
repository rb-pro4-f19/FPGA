library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ADC_currentSense is
port (

    clk 	                : in std_logic;

    led                     : out std_logic_vector(11 downto 0);

    RsTx                    : out std_logic;

    vauxp6                  : in std_logic;

    vauxn6                  : in std_logic;

    vauxp14                 : in std_logic;

    vauxn14                 : in std_logic

);
end ADC_currentSense;

architecture Behavorial of ADC_currentSense is

component xadc_wiz_0 is
port
   (
    daddr_in        : in  STD_LOGIC_VECTOR (6 downto 0);     -- Address bus for the dynamic reconfiguration port

    den_in          : in  STD_LOGIC;                         -- Enable Signal for the dynamic reconfiguration port

    di_in           : in  STD_LOGIC_VECTOR (15 downto 0);    -- Input data bus for the dynamic reconfiguration port

    dwe_in          : in  STD_LOGIC;                         -- Write Enable for the dynamic reconfiguration port

    do_out          : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port

    drdy_out        : out  STD_LOGIC;                        -- Data ready signal for the dynamic reconfiguration port

    dclk_in         : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port

    vauxp6          : in  STD_LOGIC;                         -- Auxiliary Channel 6
    vauxn6          : in  STD_LOGIC;

    vauxp14         : in  STD_LOGIC;                         -- Auxiliary Channel 14
    vauxn14         : in  STD_LOGIC;

    busy_out        : out  STD_LOGIC;                        -- ADC Busy signal

    channel_out     : out  STD_LOGIC_VECTOR (4 downto 0);    -- Channel Selection Outputs

    eoc_out         : out  STD_LOGIC;                        -- End of Conversion Signal

    eos_out         : out  STD_LOGIC;                        -- End of Sequence Signal

    alarm_out       : out STD_LOGIC;                         -- OR'ed output of all the Alarms

    vp_in           : in  STD_LOGIC;                         -- Dedicated Analog Input Pair
    vn_in           : in  STD_LOGIC
);
end component;

component clk10MHz is
    port (

        clk_in              : in  STD_LOGIC;

        clk_out             : out STD_LOGIC

    );
end component;

component UART_TX_topmodule is
    port(

        send                :   in  std_logic;

        clk                 :   in  std_logic;

        data                :   in  std_logic_vector (7 downto 0);

        ready               :   out std_logic;

        RsTx                :   out std_logic

        );
end component;

signal 	w_data_valid   		: STD_LOGIC;

signal 	w_data_ready   		: STD_LOGIC; -- unused

signal 	w_data_out     		: STD_LOGIC_VECTOR(11 DOWNTO 0);

signal 	w_adress_bus 		: STD_LOGIC_VECTOR(6 downto 0)             := "0010111";

signal  clk_10MHz           : STD_LOGIC;

signal  w_data_xadc_1       : STD_LOGIC_VECTOR(11 downto 0)            := (others => '0');

signal  w_data_xadc_2       : STD_LOGIC_VECTOR(11 downto 0)            := (others => '0');

signal  w_waste             : STD_LOGIC_VECTOR(3 downto 0); -- unused

begin

led <= w_data_xadc_2;

process( clk_10MHz) begin

    if( rising_edge(clk_10Mhz) ) then

        case( w_adress_bus ) is

            when "0010111" =>

                w_data_xadc_1 <= w_data_out;

                w_adress_bus <= "0011110";

            when "0011110" =>

                w_data_xadc_2 <= w_data_out;

                w_adress_bus <= "0010111";

            when others => w_adress_bus <= "0010111";

        end case;

    end if;

end process;

xadc_wiz: xadc_wiz_0
port map (
        --DRP
    	daddr_in 	                => w_adress_bus,
        den_in                      => w_data_valid,
        di_in                       => X"0000",
    	dwe_in 		                => '0',
    	drdy_out 	                => w_data_ready,
    	do_out(15 downto 4)         => w_data_out,
    	do_out(3 downto 0)          => w_waste,
    	dclk_in 	                => clk,
    	vp_in 		                => '0',
    	vn_in 		                => '0',
    	-- Auxiliary
    	vauxp6 		                => vauxp6,
    	vauxn6 		                => vauxn6,
    	vauxp14 	                => vauxp14,
    	vauxn14 	                => vauxn14,
    	-- SEQUENCER
    	channel_out                 => open,
    	eoc_out 	                => w_data_valid,
    	alarm_out 	                => open,
    	eos_out 	                => open,
    	busy_out 	                => open
    );

clkdiv: clk10MHz
port map(
        clk_in                      => clk,
        clk_out                     => clk_10MHz
        );

end Behavorial;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk10MHz is
    Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clk10MHz;

architecture Behavioral of clk10MHz is

    signal temporal: STD_LOGIC := '0';
    signal counter : integer range 0 to 9 := 0;

begin

process (clk_in) begin
        if rising_edge(clk_in) then
            if (counter = 9) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_out <= temporal;
end Behavioral;
