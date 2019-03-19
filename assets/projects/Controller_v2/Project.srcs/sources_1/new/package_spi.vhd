-- Package Declaration Section
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package package_spi is

  component SPI_topmodule is
    port(
        clk                         :   in  std_logic;
        sck                         :   in  std_logic;
        ss                          :   in  std_logic;
        mosi                        :   in  std_logic;
        miso                        :   out std_logic                        := '0';
        ctrl_reply                  :   in  std_logic;
        spi_ready                   :   out std_logic                        := '0';
        data_controller_i           :   in  std_logic_vector(15 downto 0);
        data_controller_o           :   out std_logic_vector(15 downto 0)    := (others => '0')
        );
  end component;

  component SPI_slave_reci is
    port(
        clk             :   in  std_logic;
        sck             :   in  std_logic;
        ss              :   in  std_logic;
        mosi            :   in  std_logic;
        data            :   out std_logic_vector(15 downto 0)       := (others => '0');
        busy            :   out std_logic                           := '0'
    );
  end component;

  component SPI_slave_trns is
     port(
        clk                  :   in  std_logic;
        sck                  :   in  std_logic;
        ss                   :   in  std_logic;
        data                 :   in  std_logic_vector(15 downto 0);
        miso                 :   out std_logic                      := '0';
        busy                 :   out std_logic                      := '0'
    );
  end component;

  component clkdivision is
    generic (
        clk_freq    : integer := 10000
    );
    port (
        clk_in      : in  std_logic;
        clk_out     : out std_logic
    );
    end component;

  function f_CS (
                       data_cs    :   std_logic_vector(3 downto 0);
                       current_cs :   std_logic_vector(3 downto 0)
                       )

  return std_logic_vector;

end package package_spi;

-- Package Body Section
package body package_spi is

    function f_CS(
                       data_cs    :   std_logic_vector(3 downto 0);
                       current_cs :   std_logic_vector(3 downto 0)
                       )

    return std_logic_vector       is variable checksum_var : std_logic_vector(3 downto 0);

    begin

        checksum_var := (current_cs(0) & current_cs(3 downto 1));
        
        return std_logic_vector(unsigned(checksum_var) + unsigned(data_cs));

    end function;

end package body package_spi;
