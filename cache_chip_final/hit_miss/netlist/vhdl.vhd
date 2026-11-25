-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:29 2026


architecture netlist of hit_miss is
    component comparator_n_2
        port (
            a : in std_logic_vector(1 downto 0);
            b : in std_logic_vector(1 downto 0);
            eq : out std_logic
        );
    end component;
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    signal tag_equal : std_logic;
begin
    u_cmp : comparator_n_2 port map (
        a(1 downto 0) => tag(1 downto 0),
        b(1 downto 0) => stored_tag(1 downto 0),
        eq => tag_equal
    );
    u_hit : and2_gate port map (
        a => valid,
        b => tag_equal,
        y => hit
    );
    u_miss : not_gate port map (
        a => hit,
        y => miss
    );
end netlist;
