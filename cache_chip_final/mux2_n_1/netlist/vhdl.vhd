-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:32 2026


architecture netlist of mux2_n_1 is
    component mux2
        port (
            a : in std_logic;
            b : in std_logic;
            s : in std_logic;
            y : out std_logic
        );
    end component;
begin
    u_mux_0 : mux2 port map (
        a => a(0),
        b => b(0),
        s => s,
        y => y(0)
    );
end netlist;
