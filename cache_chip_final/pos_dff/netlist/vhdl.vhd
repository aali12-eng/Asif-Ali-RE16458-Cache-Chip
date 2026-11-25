-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:12 2026


architecture netlist of pos_dff is
    component not_gate
        port (
            a : in std_logic;
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
    signal clk_n : std_logic;
    signal q_n : std_logic;
begin
    u_inv : not_gate port map (
        a => clk,
        y => clk_n
    );
    u_ff : dff port map (
        d => d,
        clk => clk_n,
        q => q,
        qbar => q_n
    );
end netlist;
