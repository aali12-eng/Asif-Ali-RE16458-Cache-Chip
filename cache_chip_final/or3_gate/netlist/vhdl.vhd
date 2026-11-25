-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:03 2026


architecture netlist of or3_gate is
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal ab : std_logic;
begin
    u_ab : or2_gate port map (
        a => a,
        b => b,
        y => ab
    );
    u_abc : or2_gate port map (
        a => ab,
        b => c,
        y => y
    );
end netlist;
