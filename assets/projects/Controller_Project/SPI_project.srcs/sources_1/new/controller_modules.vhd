library IEEE;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

package controller_modules is

    -- type AdressCodeType is array (7 downto 0) of std_logic_vector(3 downto 0);
    -- constant EntryCode : AdressCodeType;

    component SPI_topmodule is
    port(
    
        clk                     :   in  std_logic;
    
        sck                     :   in  std_logic;
    
        ss                      :   in  std_logic;
    
        mosi                    :   in  std_logic;
    
        miso                    :   out std_logic                      := '0';
    
        control_answer          :   in  std_logic;
    
        spi_signa               :   out std_logic                      := '0';
    
        data_controller_i       :   in  std_logic_vector(15 downto 0);
    
        data_controller_o       :   out std_logic_vector(15 downto 0)  := (others => '0')
    
        );
    end component;
    
    component PWM is
    generic(
        pwm_max_val             : integer := 128;
    
        pwm_freq                : integer := 10000
    
        );
    port(
        ready                   : in std_logic;
        
        clk                     : in std_logic;
        
        pwm_set                 : in std_logic_vector(6 downto 0);
        
        direction               : in std_logic;
        
        ja                      : out std_logic_vector(1 downto 0);
        
        chip_enable             : out std_logic := '1'
    );
    end component;
    
    component ADC_currentSense is
    port (
    
        clk 	                : in std_logic;

        led                     : out std_logic_vector(11 downto 0);
    
        vauxp6                  : in std_logic;
    
        vauxn6                  : in std_logic;
    
        vauxp14                 : in std_logic;
    
        vauxn14                 : in std_logic
    
    );
    end component;

end controller_modules;

package body controller_modules is

    

end package body;