----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2019 03:49:47 PM
-- Design Name: 
-- Module Name: UART_topmodule - Behavioral
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
----------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--entity UART_topmodule is
--port(
--    clk         :   in std_logic;
--    data        :   in std_logic_vector(15 downto 0);
--    done        :   out std_logic;
--    active      :   out std_logic;
--    RsTx        :   out std_logic
--    );
--end UART_topmodule;

--architecture Behavioral of UART_topmodule is

--component UART_TX is
--  generic (
  
--    g_CLKS_PER_BIT : integer := 100     -- Needs to be set correctly
    
--    );
--  port (
  
--    i_Clk       : in  std_logic;
--    i_TX_DV     : in  std_logic;
--    i_TX_Byte   : in  std_logic_vector(7 downto 0);
--    o_TX_Active : out std_logic;
--    o_TX_Serial : out std_logic;
--    o_TX_Done   : out std_logic
    
--    );
--end component;

--signal start_TX : std_logic := '0';
--signal data_shift : std_logic := 

--begin


--UUT : UART_TX port map(i_Clk => clk, i_TX_DV => start_TX, );

--end Behavioral;
