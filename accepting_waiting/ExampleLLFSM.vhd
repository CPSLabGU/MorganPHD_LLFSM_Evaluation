library IEEE;
use IEEE.std_logic_1164.all;

entity ExampleLLFSM is
    port(
        clk: in std_logic;
        EXTERNAL_x: in std_logic;
        EXTERNAL_z: out std_logic
    );
end ExampleLLFSM;

architecture Behavioral of ExampleLLFSM is
    -- Internal State Representation Bits
    constant CheckTransition: std_logic_vector(2 downto 0) := "000";
    constant Internal: std_logic_vector(2 downto 0) := "001";
    constant NoOnEntry: std_logic_vector(2 downto 0) := "010";
    constant OnEntry: std_logic_vector(2 downto 0) := "011";
    constant OnExit: std_logic_vector(2 downto 0) := "100";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "101";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "110";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    -- State Representation Bits
    constant STATE_S0: std_logic_vector(0 downto 0) := "0";
    signal currentState: std_logic_vector(0 downto 0) := STATE_S0;
    signal targetState: std_logic_vector(0 downto 0) := STATE_S0;
    signal previousRinglet: std_logic_vector(0 downto 0) := "Z";
    -- Snapshot of External Signals and Variables
    signal x: std_logic;
    signal z: std_logic;
begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when CheckTransition =>
                    case currentState is
                        when others =>
                            internalState <= Internal;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_S0 =>
                            z <= x;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when OnEntry =>
                    internalState <= CheckTransition;
                when OnExit =>
                    internalState <= WriteSnapshot;
                when ReadSnapshot =>
                    case currentState is
                        when STATE_S0 =>
                            x <= EXTERNAL_x;
                        when others =>
                            null;
                    end case;
                    if (previousRinglet /= currentState) then
                        internalState <= OnEntry;
                    else
                        internalState <= NoOnEntry;
                    end if;
                when WriteSnapshot =>
                    case currentState is
                        when STATE_S0 =>
                            EXTERNAL_z <= z;
                        when others =>
                            null;
                    end case;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end Behavioral;

