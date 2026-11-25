-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:11 2026


architecture netlist of and_reduce_n is
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal chain : std_logic_vector(2 downto 1);
begin
    u_and1 : and2_gate port map (
        a => a(0),
        b => a(1),
        y => chain(1)
    );
    u_and2 : and2_gate port map (
        a => chain(1),
        b => a(2),
        y => chain(2)
    );
    u_and3 : and2_gate port map (
        a => chain(2),
        b => a(3),
        y => y
    );
end netlist;
