-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:05 2026


architecture netlist of dff is
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    component \Dlatch\
        port (
            d : in std_logic;
            clk : in std_logic;
            q : out std_logic;
            qbar : out std_logic
        );
    end component;
    signal clkn : std_logic;
    signal m : std_logic;
    signal mn : std_logic;
begin
    I0 : not_gate port map (
        a => clk,
        y => clkn
    );
    u_m : \Dlatch\ port map (
        d => d,
        clk => clk,
        q => m,
        qbar => mn
    );
    u_s : \Dlatch\ port map (
        d => m,
        clk => clkn,
        q => q,
        qbar => qbar
    );
end netlist;
