-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:04 2026


architecture netlist of or4_gate is
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal ab : std_logic;
    signal cd : std_logic;
begin
    u_ab : or2_gate port map (
        a => a,
        b => b,
        y => ab
    );
    u_cd : or2_gate port map (
        a => c,
        b => d,
        y => cd
    );
    u_abcd : or2_gate port map (
        a => ab,
        b => cd,
        y => y
    );
end netlist;
