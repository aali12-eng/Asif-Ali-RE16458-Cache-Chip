-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:20 2026


architecture netlist of mux2_n_8 is
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
    u_mux_1 : mux2 port map (
        a => a(1),
        b => b(1),
        s => s,
        y => y(1)
    );
    u_mux_2 : mux2 port map (
        a => a(2),
        b => b(2),
        s => s,
        y => y(2)
    );
    u_mux_3 : mux2 port map (
        a => a(3),
        b => b(3),
        s => s,
        y => y(3)
    );
    u_mux_4 : mux2 port map (
        a => a(4),
        b => b(4),
        s => s,
        y => y(4)
    );
    u_mux_5 : mux2 port map (
        a => a(5),
        b => b(5),
        s => s,
        y => y(5)
    );
    u_mux_6 : mux2 port map (
        a => a(6),
        b => b(6),
        s => s,
        y => y(6)
    );
    u_mux_7 : mux2 port map (
        a => a(7),
        b => b(7),
        s => s,
        y => y(7)
    );
end netlist;
