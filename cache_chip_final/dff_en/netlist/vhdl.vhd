-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:14 2026


architecture netlist of dff_en is
    component mux2
        port (
            a : in std_logic;
            b : in std_logic;
            s : in std_logic;
            y : out std_logic
        );
    end component;
    component dff
        port (
            d : in std_logic;
            clk : in std_logic;
            q : out std_logic;
            qbar : out std_logic
        );
    end component;
    signal d_sel : std_logic;
    signal q_n : std_logic;
begin
    u_mux : mux2 port map (
        a => q,
        b => d,
        s => load,
        y => d_sel
    );
    u_ff : dff port map (
        d => d_sel,
        clk => clk,
        q => q,
        qbar => q_n
    );
end netlist;
