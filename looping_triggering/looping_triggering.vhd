----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2025 08:44:39
-- Design Name: 
-- Module Name: looping_triggering - Behavioral
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

entity looping_triggering is
--  Port ( );
end looping_triggering;

architecture Behavioral of looping_triggering is
    signal clk: std_logic := '0';
    signal EXTERNAL_z: std_logic;
    component ExampleLLFSMWithTransition is
        port(
            clk: in std_logic;
            EXTERNAL_x: in std_logic;
            EXTERNAL_z: out std_logic
        );
    end component;
begin

clk <= not clk after 4 ns;

llfsm: ExampleLLFSMWithTransition port map(
    clk => clk,
    EXTERNAL_x => '1',
    EXTERNAL_z => EXTERNAL_z
);


end Behavioral;
