-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:30 2026


architecture netlist of way_select is
    component or2_gate
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
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal inv1_or_lru : std_logic;
    signal valid1_n : std_logic;
begin
    u_hit : or2_gate port map (
        a => hit0,
        b => hit1,
        y => hit
    );
    u_miss : not_gate port map (
        a => hit,
        y => miss
    );
    u_v1n : not_gate port map (
        a => valid1,
        y => valid1_n
    );
    u_vor : or2_gate port map (
        a => valid1_n,
        b => lru_way,
        y => inv1_or_lru
    );
    u_vic : and2_gate port map (
        a => valid0,
        b => inv1_or_lru,
        y => victim
    );
    hit_way <= hit1;
end netlist;
