-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:16 2026


architecture netlist of register_n_8 is
    component dff_en
        port (
            d : in std_logic;
            load : in std_logic;
            clk : in std_logic;
            q : out std_logic
        );
    end component;
begin
    u_bit_0 : dff_en port map (
        d => d(0),
        load => load,
        clk => clk,
        q => q(0)
    );
    u_bit_1 : dff_en port map (
        d => d(1),
        load => load,
        clk => clk,
        q => q(1)
    );
    u_bit_2 : dff_en port map (
        d => d(2),
        load => load,
        clk => clk,
        q => q(2)
    );
    u_bit_3 : dff_en port map (
        d => d(3),
        load => load,
        clk => clk,
        q => q(3)
    );
    u_bit_4 : dff_en port map (
        d => d(4),
        load => load,
        clk => clk,
        q => q(4)
    );
    u_bit_5 : dff_en port map (
        d => d(5),
        load => load,
        clk => clk,
        q => q(5)
    );
    u_bit_6 : dff_en port map (
        d => d(6),
        load => load,
        clk => clk,
        q => q(6)
    );
    u_bit_7 : dff_en port map (
        d => d(7),
        load => load,
        clk => clk,
        q => q(7)
    );
end netlist;
