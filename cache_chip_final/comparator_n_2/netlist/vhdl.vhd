-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:28 2026


architecture netlist of comparator_n_2 is
    component xnor2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component and_reduce_n_2
        port (
            a : in std_logic_vector(1 downto 0);
            y : out std_logic
        );
    end component;
    signal same : std_logic_vector(1 downto 0);
begin
    u_xnor_0 : xnor2_gate port map (
        a => a(0),
        b => b(0),
        y => same(0)
    );
    u_xnor_1 : xnor2_gate port map (
        a => a(1),
        b => b(1),
        y => same(1)
    );
    u_and : and_reduce_n_2 port map (
        a(1 downto 0) => same(1 downto 0),
        y => eq
    );
end netlist;
