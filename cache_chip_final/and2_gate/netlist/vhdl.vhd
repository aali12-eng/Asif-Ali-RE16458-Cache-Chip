-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:27:59 2026


architecture netlist of and2_gate is
    component nand2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    signal n1 : std_logic;
begin
    I0 : nand2_gate port map (
        a => a,
        b => b,
        y => n1
    );
    I1 : not_gate port map (
        a => n1,
        y => y
    );
end netlist;
