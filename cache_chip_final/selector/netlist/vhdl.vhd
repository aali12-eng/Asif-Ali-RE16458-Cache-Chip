-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:07 2026


architecture netlist of selector is
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
    signal wr : std_logic;
begin
    u_inv : not_gate port map (
        a => rd_wrn,
        y => wr
    );
    u_read : and2_gate port map (
        a => chip_enable,
        b => rd_wrn,
        y => read_enable
    );
    u_wr : and2_gate port map (
        a => chip_enable,
        b => wr,
        y => write_enable
    );
end netlist;
