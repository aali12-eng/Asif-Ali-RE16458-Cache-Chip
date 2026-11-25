-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:06 2026


architecture netlist of cache_cell is
    component selector
        port (
            chip_enable : in std_logic;
            rd_wrn : in std_logic;
            read_enable : out std_logic;
            write_enable : out std_logic
        );
    end component;
    component \Dlatch\
        port (
            d : in std_logic;
            clk : in std_logic;
            q : out std_logic;
            qbar : out std_logic
        );
    end component;
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    component tx
        port (
            sel : in std_logic;
            selnot : in std_logic;
            input : in std_logic;
            output : out std_logic
        );
    end component;
    signal read_enable : std_logic;
    signal read_enable_n : std_logic;
    signal stored : std_logic;
    signal stored_n : std_logic;
    signal write_enable : std_logic;
begin
    u_sel : selector port map (
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_enable => read_enable,
        write_enable => write_enable
    );
    u_latch : \Dlatch\ port map (
        d => write_data,
        clk => write_enable,
        q => stored,
        qbar => stored_n
    );
    u_inv : not_gate port map (
        a => read_enable,
        y => read_enable_n
    );
    u_tx : tx port map (
        sel => read_enable,
        selnot => read_enable_n,
        input => stored,
        output => read_data
    );
end netlist;
