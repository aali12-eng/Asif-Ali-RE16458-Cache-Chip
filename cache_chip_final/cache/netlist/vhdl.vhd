-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:09 2026


architecture netlist of cache is
    component mux2_n_2
        port (
            a : in std_logic_vector(1 downto 0);
            b : in std_logic_vector(1 downto 0);
            s : in std_logic;
            y : out std_logic_vector(1 downto 0)
        );
    end component;
    component decoder2to4
        port (
            a : in std_logic_vector(1 downto 0);
            en : in std_logic;
            y : out std_logic_vector(3 downto 0)
        );
    end component;
    component mux2
        port (
            a : in std_logic;
            b : in std_logic;
            s : in std_logic;
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
    component cache_way
        port (
            block_select : in std_logic_vector(3 downto 0);
            byte_select : in std_logic_vector(3 downto 0);
            write : in std_logic;
            fill : in std_logic;
            reset : in std_logic;
            write_data : in std_logic_vector(7 downto 0);
            tag_in : in std_logic_vector(1 downto 0);
            read_data : out std_logic_vector(7 downto 0);
            tag_out : out std_logic_vector(1 downto 0);
            valid_out : out std_logic
        );
    end component;
    component hit_miss
        port (
            tag : in std_logic_vector(1 downto 0);
            stored_tag : in std_logic_vector(1 downto 0);
            valid : in std_logic;
            hit : out std_logic;
            miss : out std_logic
        );
    end component;
    component way_select
        port (
            hit0 : in std_logic;
            hit1 : in std_logic;
            valid0 : in std_logic;
            valid1 : in std_logic;
            lru_way : in std_logic;
            hit : out std_logic;
            miss : out std_logic;
            hit_way : out std_logic;
            victim : out std_logic
        );
    end component;
    component lru
        port (
            clk : in std_logic;
            reset : in std_logic;
            block_offset : in std_logic_vector(1 downto 0);
            update : in std_logic;
            used_way : in std_logic;
            lru_way : out std_logic
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
    component mux2_n_8
        port (
            a : in std_logic_vector(7 downto 0);
            b : in std_logic_vector(7 downto 0);
            s : in std_logic;
            y : out std_logic_vector(7 downto 0)
        );
    end component;
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
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
    signal block_select : std_logic_vector(3 downto 0);
    signal byte_select : std_logic_vector(3 downto 0);
    signal cell_byte_offset : std_logic_vector(1 downto 0);
    signal fill_way : std_logic;
    signal hit0 : std_logic;
    signal hit1 : std_logic;
    signal hit_d : std_logic;
    signal hit_i : std_logic;
    signal hit_open : std_logic;
    signal hit_way : std_logic;
    signal lru_way : std_logic;
    signal miss0 : std_logic;
    signal miss1 : std_logic;
    signal miss_i : std_logic;
    signal read0 : std_logic_vector(7 downto 0);
    signal read1 : std_logic_vector(7 downto 0);
    signal rst_n : std_logic;
    signal stored_tag0 : std_logic_vector(1 downto 0);
    signal stored_tag1 : std_logic_vector(1 downto 0);
    signal used_way : std_logic;
    signal valid0 : std_logic;
    signal valid1 : std_logic;
    signal victim : std_logic;
    signal way_sel_n : std_logic;
    signal write0 : std_logic;
    signal write1 : std_logic;
begin
    u_byte_mux : mux2_n_2 port map (
        a(1 downto 0) => address(1 downto 0),
        b(1 downto 0) => fill_byte(1 downto 0),
        s => fill,
        y(1 downto 0) => cell_byte_offset(1 downto 0)
    );
    u_block_dec : decoder2to4 port map (
        a(1 downto 0) => address(3 downto 2),
        en => '1',
        y(3 downto 0) => block_select(3 downto 0)
    );
    u_byte_dec : decoder2to4 port map (
        a(1 downto 0) => cell_byte_offset(1 downto 0),
        en => '1',
        y(3 downto 0) => byte_select(3 downto 0)
    );
    u_way_mux : mux2 port map (
        a => hit_way,
        b => fill_way,
        s => fill,
        y => way
    );
    u_way_n : not_gate port map (
        a => way,
        y => way_sel_n
    );
    u_write0 : and2_gate port map (
        a => write,
        b => way_sel_n,
        y => write0
    );
    u_write1 : and2_gate port map (
        a => write,
        b => way,
        y => write1
    );
    u_way0 : cache_way port map (
        block_select(3 downto 0) => block_select(3 downto 0),
        byte_select(3 downto 0) => byte_select(3 downto 0),
        write => write0,
        fill => fill,
        reset => reset,
        write_data(7 downto 0) => write_data(7 downto 0),
        tag_in(1 downto 0) => address(5 downto 4),
        read_data(7 downto 0) => read0(7 downto 0),
        tag_out(1 downto 0) => stored_tag0(1 downto 0),
        valid_out => valid0
    );
    u_way1 : cache_way port map (
        block_select(3 downto 0) => block_select(3 downto 0),
        byte_select(3 downto 0) => byte_select(3 downto 0),
        write => write1,
        fill => fill,
        reset => reset,
        write_data(7 downto 0) => write_data(7 downto 0),
        tag_in(1 downto 0) => address(5 downto 4),
        read_data(7 downto 0) => read1(7 downto 0),
        tag_out(1 downto 0) => stored_tag1(1 downto 0),
        valid_out => valid1
    );
    u_hit_miss0 : hit_miss port map (
        tag(1 downto 0) => address(5 downto 4),
        stored_tag(1 downto 0) => stored_tag0(1 downto 0),
        valid => valid0,
        hit => hit0,
        miss => miss0
    );
    u_hit_miss1 : hit_miss port map (
        tag(1 downto 0) => address(5 downto 4),
        stored_tag(1 downto 0) => stored_tag1(1 downto 0),
        valid => valid1,
        hit => hit1,
        miss => miss1
    );
    u_way_select : way_select port map (
        hit0 => hit0,
        hit1 => hit1,
        valid0 => valid0,
        valid1 => valid1,
        lru_way => lru_way,
        hit => hit_i,
        miss => miss_i,
        hit_way => hit_way,
        victim => victim
    );
    u_used : mux2 port map (
        a => victim,
        b => hit_way,
        s => hit_i,
        y => used_way
    );
    u_lru : lru port map (
        clk => clk,
        reset => reset,
        block_offset(1 downto 0) => address(3 downto 2),
        update => lru_update,
        used_way => used_way,
        lru_way => lru_way
    );
    u_fill_way : dff_en port map (
        d => victim,
        load => latch_way,
        clk => clk,
        q => fill_way
    );
    u_read_mux : mux2_n_8 port map (
        a(7 downto 0) => read0(7 downto 0),
        b(7 downto 0) => read1(7 downto 0),
        s => hit_way,
        y(7 downto 0) => read_data(7 downto 0)
    );
    u_rst_n : not_gate port map (
        a => reset,
        y => rst_n
    );
    u_hit_d : and2_gate port map (
        a => hit_i,
        b => rst_n,
        y => hit_d
    );
    u_hit_open : or2_gate port map (
        a => latch_way,
        b => reset,
        y => hit_open
    );
    u_hit_hold : \Dlatch\ port map (
        d => hit_d,
        clk => hit_open,
        q => hit,
        qbar => miss
    );
end netlist;
