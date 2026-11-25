-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:09 2026


architecture netlist of half_adder is
    component xor2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
begin
    u_sum : xor2_gate port map (
        a => a,
        b => b,
        y => sum
    );
    u_carry : and2_gate port map (
        a => a,
        b => b,
        y => carry
    );
end netlist;
