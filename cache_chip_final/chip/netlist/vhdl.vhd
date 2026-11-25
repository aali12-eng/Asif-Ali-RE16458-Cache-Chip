-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:37 2026


architecture netlist of chip is
    component register_n_6
        port (
            d : in std_logic_vector(5 downto 0);
            load : in std_logic;
            clk : in std_logic;
            q : out std_logic_vector(5 downto 0)
        );
    end component;
    component register_n_8
        port (
            d : in std_logic_vector(7 downto 0);
            load : in std_logic;
            clk : in std_logic;
            q : out std_logic_vector(7 downto 0)
        );
    end component;
    component dff_en
        port (
            d : in std_logic;
            load : in std_logic;
            clk : in std_logic;
            q : out std_logic
        );
    end component;
    component state_machine
        port (
            clk : in std_logic;
            reset : in std_logic;
            start : in std_logic;
            read_write : in std_logic;
            hit : in std_logic;
            count : in std_logic_vector(4 downto 0);
            busy : out std_logic;
            enable : out std_logic;
            output_enable : out std_logic;
            latch_input : out std_logic;
            latch_output : out std_logic;
            count_enable : out std_logic;
            count_restart : out std_logic;
            fill_byte : out std_logic_vector(1 downto 0);
            hit_result : out std_logic;
            fill : out std_logic;
            write : out std_logic;
            latch_way : out std_logic;
            lru_update : out std_logic;
            state : out std_logic_vector(4 downto 0)
        );
    end component;
    component counter
        port (
            count : in std_logic;
            restart : in std_logic;
            clk : in std_logic;
            q : out std_logic_vector(4 downto 0)
        );
    end component;
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    component mux2_n_8
        port (
            a : in std_logic_vector(7 downto 0);
            b : in std_logic_vector(7 downto 0);
            s : in std_logic;
            y : out std_logic_vector(7 downto 0)
        );
    end component;
    component cache
        port (
            clk : in std_logic;
            address : in std_logic_vector(5 downto 0);
            fill : in std_logic;
            fill_byte : in std_logic_vector(1 downto 0);
            write : in std_logic;
            latch_way : in std_logic;
            lru_update : in std_logic;
            reset : in std_logic;
            write_data : in std_logic_vector(7 downto 0);
            read_data : out std_logic_vector(7 downto 0);
            hit : out std_logic;
            miss : out std_logic;
            way : out std_logic
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
    signal ca_r : std_logic_vector(5 downto 0);
    signal cd_r : std_logic_vector(7 downto 0);
    signal count : std_logic_vector(4 downto 0);
    signal count_enable : std_logic;
    signal count_restart : std_logic;
    signal en_n : std_logic;
    signal fill : std_logic;
    signal fill_byte : std_logic_vector(1 downto 0);
    signal hit : std_logic;
    signal latch_input : std_logic;
    signal latch_output : std_logic;
    signal latch_way : std_logic;
    signal lru_update : std_logic;
    signal miss : std_logic;
    signal oe_n : std_logic;
    signal out_r : std_logic_vector(7 downto 0);
    signal output_enable : std_logic;
    signal read_data : std_logic_vector(7 downto 0);
    signal rw_r : std_logic;
    signal state : std_logic_vector(4 downto 0);
    signal tag_hit : std_logic;
    signal tag_miss : std_logic;
    signal way : std_logic;
    signal write : std_logic;
    signal write_data : std_logic_vector(7 downto 0);
begin
    u_ca_reg : register_n_6 port map (
        d(5 downto 0) => cpu_add(5 downto 0),
        load => latch_input,
        clk => clk,
        q(5 downto 0) => ca_r(5 downto 0)
    );
    u_cd_reg : register_n_8 port map (
        d(7 downto 0) => cpu_data(7 downto 0),
        load => latch_input,
        clk => clk,
        q(7 downto 0) => cd_r(7 downto 0)
    );
    u_rw_reg : dff_en port map (
        d => cpu_rd_wrn,
        load => latch_input,
        clk => clk,
        q => rw_r
    );
    u_sm : state_machine port map (
        clk => clk,
        reset => reset,
        start => start,
        read_write => rw_r,
        hit => tag_hit,
        count(4 downto 0) => count(4 downto 0),
        busy => busy,
        enable => mem_en,
        output_enable => output_enable,
        latch_input => latch_input,
        latch_output => latch_output,
        count_enable => count_enable,
        count_restart => count_restart,
        fill_byte(1 downto 0) => fill_byte(1 downto 0),
        hit_result => hit,
        fill => fill,
        write => write,
        latch_way => latch_way,
        lru_update => lru_update,
        state(4 downto 0) => state(4 downto 0)
    );
    u_counter : counter port map (
        count => count_enable,
        restart => count_restart,
        clk => clk,
        q(4 downto 0) => count(4 downto 0)
    );
    u_miss : not_gate port map (
        a => hit,
        y => miss
    );
    u_data_mux : mux2_n_8 port map (
        a(7 downto 0) => cd_r(7 downto 0),
        b(7 downto 0) => mem_data(7 downto 0),
        s => fill,
        y(7 downto 0) => write_data(7 downto 0)
    );
    u_cache : cache port map (
        clk => clk,
        address(5 downto 0) => ca_r(5 downto 0),
        fill => fill,
        fill_byte(1 downto 0) => fill_byte(1 downto 0),
        write => write,
        latch_way => latch_way,
        lru_update => lru_update,
        reset => reset,
        write_data(7 downto 0) => write_data(7 downto 0),
        read_data(7 downto 0) => read_data(7 downto 0),
        hit => tag_hit,
        miss => tag_miss,
        way => way
    );
    u_out_reg : register_n_8 port map (
        d(7 downto 0) => read_data(7 downto 0),
        load => latch_output,
        clk => clk,
        q(7 downto 0) => out_r(7 downto 0)
    );
    u_oe_n : not_gate port map (
        a => output_enable,
        y => oe_n
    );
    u_cd_tx_0 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(0),
        output => cpu_data(0)
    );
    u_cd_tx_1 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(1),
        output => cpu_data(1)
    );
    u_cd_tx_2 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(2),
        output => cpu_data(2)
    );
    u_cd_tx_3 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(3),
        output => cpu_data(3)
    );
    u_cd_tx_4 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(4),
        output => cpu_data(4)
    );
    u_cd_tx_5 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(5),
        output => cpu_data(5)
    );
    u_cd_tx_6 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(6),
        output => cpu_data(6)
    );
    u_cd_tx_7 : tx port map (
        sel => output_enable,
        selnot => oe_n,
        input => out_r(7),
        output => cpu_data(7)
    );
    u_en_n : not_gate port map (
        a => mem_en,
        y => en_n
    );
    u_ma_tx_0 : tx port map (
        sel => mem_en,
        selnot => en_n,
        input => '0',
        output => mem_add(0)
    );
    u_ma_tx_1 : tx port map (
        sel => mem_en,
        selnot => en_n,
        input => '0',
        output => mem_add(1)
    );
    u_ma_tx_2 : tx port map (
        sel => mem_en,
        selnot => en_n,
        input => ca_r(2),
        output => mem_add(2)
    );
    u_ma_tx_3 : tx port map (
        sel => mem_en,
        selnot => en_n,
        input => ca_r(3),
        output => mem_add(3)
    );
    u_ma_tx_4 : tx port map (
        sel => mem_en,
        selnot => en_n,
        input => ca_r(4),
        output => mem_add(4)
    );
    u_ma_tx_5 : tx port map (
        sel => mem_en,
        selnot => en_n,
        input => ca_r(5),
        output => mem_add(5)
    );
end netlist;
