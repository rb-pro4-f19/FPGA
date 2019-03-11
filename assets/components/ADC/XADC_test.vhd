library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity XADC_test is
port(
clk             : in std_logic;
seg             : out std_logic_vector(7 downto 0);
an              : out std_logic_vector(3 downto 0);
led             : out std_logic_vector(15 downto 0);
JXADC           : in  STD_LOGIC_VECTOR (7 downto 0)
);
end XADC_test;

architecture Behavioral of XADC_test is

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
    reset_in        : in  STD_LOGIC;                         -- Reset signal for the System Monitor control logic
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

type state_m            is (IDLE, RESET, READ);

signal state            : state_m := IDLE;
signal AdressBus        : std_logic_vector(6 downto 0) := "0011110"; -- this is aux 14
signal EnableSignal     : std_logic := '0';
signal AdcIntcon        : std_logic_vector(11 downto 0);
signal Waste            : std_logic_vector(3 downto 0);
signal AdcBusy          : std_logic;
signal EndOfConversion  : std_logic;
signal DateReadyOnOut   : std_logic;

begin

------------------------------------------------------------------------------
-- https://cdn.instructables.com/ORIG/FRT/SYN1/IWMMH04D/FRTSYN1IWMMH04D.pdf --
------------------------------------------------------------------------------

led(15) <= AdcBusy;

process(clk) begin
    if (rising_edge(clk)) then
        case( state ) is
            when IDLE =>
                if ( AdcBusy = '0' ) then
                    EnableSignal <= '1';
                    -- dwe is already low no reason to parse it
                    AdressBus <= "0011110"; -- aux 14
                    state <= RESET;
                else
                    state <= IDLE;
                end if;
            when RESET =>
                EnableSignal <= '0';
                state <= READ;
            
            when READ =>
                if( DateReadyOnOut = '1') then
                    -- data is valid
                    led(11 downto 0) <= AdcIntCon;
                    state <= IDLE;
                 else
                    state <= READ;
                 end if;
                
            when others => state <= IDLE;
        
        end case;
    end if;
end process;

UU: xadc_wiz_0 
    port map(
    daddr_in                => AdressBus,        -- Address bus for the dynamic reconfiguration port
    den_in                  => EnableSignal,     -- wire to control adc
    di_in                   => (others => '0'),  -- Input data bus for the dynamic reconfiguration port
    dwe_in                  => '0',              -- Write Enable for the dynamic reconfiguration port
    do_out(15 downto 4)     => AdcIntcon,        -- Output data bus for dynamic reconfiguration port
    do_out(3 downto 0)      => Waste,
    drdy_out                => DateReadyOnOut,            -- Data ready signal for the dynamic reconfiguration port
    dclk_in                 => clk,             -- Clock input for the dynamic reconfiguration port
    reset_in                => '0',             -- Reset signal for the System Monitor control logic
    vauxp14                 => JXADC(1),        -- 
    vauxn14                 => JXADC(5),        -- when ADC is sampled
    busy_out                => AdcBusy,        -- when adc is busy
    channel_out             => open,         -- single channel
    eoc_out                 => EndOfConversion,         -- end of conv signal
    vp_in                   => '0',
    vn_in                   => '0'
);


end Behavioral;
