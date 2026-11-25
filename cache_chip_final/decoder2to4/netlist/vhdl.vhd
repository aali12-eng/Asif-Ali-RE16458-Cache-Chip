-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:10 2026


architecture netlist of decoder2to4 is
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    component and3_gate
        port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            y : out std_logic
        );
    end component;
    signal a_n : std_logic_vector(1 downto 0);
begin
    u_inv0 : not_gate port map (
        a => a(0),
        y => a_n(0)
    );
    u_inv1 : not_gate port map (
        a => a(1),
        y => a_n(1)
    );
    u_y0 : and3_gate port map (
        a => en,
        b => a_n(1),
        c => a_n(0),
        y => y(0)
    );
    u_y1 : and3_gate port map (
        a => en,
        b => a_n(1),
        c => a(0),
        y => y(1)
    );
    u_y2 : and3_gate port map (
        a => en,
        b => a(1),
        c => a_n(0),
        y => y(2)
    );
    u_y3 : and3_gate port map (
        a => en,
        b => a(1),
        c => a(0),
        y => y(3)
    );
end netlist;
