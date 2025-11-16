----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2025 08:13:05
-- Design Name: 
-- Module Name: accepting_waiting - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity accepting_waiting is
--  Port ( );
end accepting_waiting;

architecture Behavioral of accepting_waiting is
    signal clk: std_logic := '0';
    signal EXTERNAL_z: std_logic := '0';

    component ExampleLLFSM is
        port(
            clk: in std_logic;
            EXTERNAL_x: in std_logic;
            EXTERNAL_z: out std_logic
        );
    end component;
begin

clk <= not clk after 4 ns;

llfsm: ExampleLLFSM port map(
    clk => clk,
    EXTERNAL_x => '1',
    EXTERNAL_z => EXTERNAL_z
);

end Behavioral;
