-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:27 2026


architecture netlist of and_reduce_n_2 is
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
begin
    u_and_1 : and2_gate port map (
        a => a(0),
        b => a(1),
        y => y
    );
end netlist;
