-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:08 2026


architecture netlist of mux2 is
    component not_gate
        port (
            a : in std_logic;
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
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal a_sel : std_logic;
    signal b_sel : std_logic;
    signal s_n : std_logic;
begin
    u_inv : not_gate port map (
        a => s,
        y => s_n
    );
    u_a : and2_gate port map (
        a => a,
        b => s_n,
        y => a_sel
    );
    u_b : and2_gate port map (
        a => b,
        b => s,
        y => b_sel
    );
    u_or : or2_gate port map (
        a => a_sel,
        b => b_sel,
        y => y
    );
end netlist;
