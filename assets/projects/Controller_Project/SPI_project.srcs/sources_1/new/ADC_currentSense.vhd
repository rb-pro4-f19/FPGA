library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ADC_currentSense is
port (

    clk 	                : in std_logic;

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

signal 	w_data_valid   		: STD_LOGIC;

signal 	w_data_ready   		: STD_LOGIC; -- unused

signal 	w_data_out     		: STD_LOGIC_VECTOR(11 DOWNTO 0);

signal 	w_adress_bus 		: STD_LOGIC_VECTOR(6 downto 0)             := "0010111";

signal  clk_10MHz           : STD_LOGIC;

signal  w_data_xadc_1       : STD_LOGIC_VECTOR(11 downto 0)            := (others => '0');

signal  w_data_xadc_2       : STD_LOGIC_VECTOR(11 downto 0)            := (others => '0');

signal  w_waste             : STD_LOGIC_VECTOR(3 downto 0); -- unused

begin

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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity xadc_wiz_0 is
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
end xadc_wiz_0;

architecture xilinx of xadc_wiz_0 is

  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of xilinx : architecture is "xadc_wiz_0,xadc_wiz_v3_3_6,{component_name=xadc_wiz_0,enable_axi=false,enable_axi4stream=false,dclk_frequency=10,enable_busy=true,enable_convst=false,enable_convstclk=false,enable_dclk=true,enable_drp=true,enable_eoc=true,enable_eos=true,enable_vbram_alaram=false,enable_vccddro_alaram=false,enable_Vccint_Alaram=false,enable_Vccaux_alaram=falseenable_vccpaux_alaram=false,enable_vccpint_alaram=false,ot_alaram=false,user_temp_alaram=false,timing_mode=continuous,channel_averaging=None,sequencer_mode=on,startup_channel_selection=contineous_sequence}";


  signal FLOAT_VCCAUX_ALARM : std_logic;
  signal FLOAT_VCCINT_ALARM : std_logic;
  signal FLOAT_USER_TEMP_ALARM : std_logic;
  signal FLOAT_VBRAM_ALARM : std_logic;
  signal FLOAT_MUXADDR : std_logic_vector (4 downto 0);
  signal aux_channel_p : std_logic_vector (15 downto 0);
  signal aux_channel_n : std_logic_vector (15 downto 0);
  signal alm_int : std_logic_vector (7 downto 0);

begin

       alarm_out <= alm_int(7);

        aux_channel_p(0) <= '0';
        aux_channel_n(0) <= '0';

        aux_channel_p(1) <= '0';
        aux_channel_n(1) <= '0';

        aux_channel_p(2) <= '0';
        aux_channel_n(2) <= '0';

        aux_channel_p(3) <= '0';
        aux_channel_n(3) <= '0';

        aux_channel_p(4) <= '0';
        aux_channel_n(4) <= '0';

        aux_channel_p(5) <= '0';
        aux_channel_n(5) <= '0';

        aux_channel_p(6) <= vauxp6;
        aux_channel_n(6) <= vauxn6;

        aux_channel_p(7) <= '0';
        aux_channel_n(7) <= '0';

        aux_channel_p(8) <= '0';
        aux_channel_n(8) <= '0';

        aux_channel_p(9) <= '0';
        aux_channel_n(9) <= '0';

        aux_channel_p(10) <= '0';
        aux_channel_n(10) <= '0';

        aux_channel_p(11) <= '0';
        aux_channel_n(11) <= '0';

        aux_channel_p(12) <= '0';
        aux_channel_n(12) <= '0';

        aux_channel_p(13) <= '0';
        aux_channel_n(13) <= '0';

        aux_channel_p(14) <= vauxp14;
        aux_channel_n(14) <= vauxn14;

        aux_channel_p(15) <= '0';
        aux_channel_n(15) <= '0';

 U0 : XADC
     generic map(
        INIT_40 => X"8000", -- config reg 0
        INIT_41 => X"21AF", -- config reg 1
        INIT_42 => X"0400", -- config reg 2
        INIT_48 => X"0000", -- Sequencer channel selection
        INIT_49 => X"4040", -- Sequencer channel selection
        INIT_4A => X"0000", -- Sequencer Average selection
        INIT_4B => X"0000", -- Sequencer Average selection
        INIT_4C => X"0000", -- Sequencer Bipolar selection
        INIT_4D => X"0000", -- Sequencer Bipolar selection
        INIT_4E => X"0000", -- Sequencer Acq time selection
        INIT_4F => X"0040", -- Sequencer Acq time selection
        INIT_50 => X"B5ED", -- Temp alarm trigger
        INIT_51 => X"57E4", -- Vccint upper alarm limit
        INIT_52 => X"A147", -- Vccaux upper alarm limit
        INIT_53 => X"CA33",  -- Temp alarm OT upper
        INIT_54 => X"A93A", -- Temp alarm reset
        INIT_55 => X"52C6", -- Vccint lower alarm limit
        INIT_56 => X"9555", -- Vccaux lower alarm limit
        INIT_57 => X"AE4E",  -- Temp alarm OT reset
        INIT_58 => X"5999",  -- Vccbram upper alarm limit
        INIT_5C => X"5111",  -- Vccbram lower alarm limit
        SIM_DEVICE => "7SERIES",
        SIM_MONITOR_FILE => "design.txt"
        )

port map (
        CONVST              => '0',
        CONVSTCLK           => '0',
        DADDR(6 downto 0)   => daddr_in(6 downto 0),
        DCLK                => dclk_in,
        DEN                 => den_in,
        DI(15 downto 0)     => di_in(15 downto 0),
        DWE                 => dwe_in,
        RESET               => '0',
        VAUXN(15 downto 0)  => aux_channel_n(15 downto 0),
        VAUXP(15 downto 0)  => aux_channel_p(15 downto 0),
        ALM                 => alm_int,
        BUSY                => busy_out,
        CHANNEL(4 downto 0) => channel_out(4 downto 0),
        DO(15 downto 0)     => do_out(15 downto 0),
        DRDY                => drdy_out,
        EOC                 => eoc_out,
        EOS                 => eos_out,
        JTAGBUSY            => open,
        JTAGLOCKED          => open,
        JTAGMODIFIED        => open,
        OT                  => open,
     
        MUXADDR             => FLOAT_MUXADDR,
        VN                  => vn_in,
        VP                  => vp_in
         );
end xilinx;


