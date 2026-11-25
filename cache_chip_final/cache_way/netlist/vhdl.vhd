-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:07 2026


architecture netlist of cache_way is
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
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component cache_block
        port (
            block_select : in std_logic;
            byte_select : in std_logic_vector(3 downto 0);
            reset : in std_logic;
            data_rd_wrn : in std_logic;
            tag_rd_wrn : in std_logic;
            valid_rd_wrn : in std_logic;
            write_data : in std_logic_vector(7 downto 0);
            tag_in : in std_logic_vector(1 downto 0);
            valid_in : in std_logic;
            read_data : out std_logic_vector(7 downto 0);
            tag_out : out std_logic_vector(1 downto 0);
            valid_out : out std_logic
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
    signal data_c : std_logic_vector(7 downto 0);
    signal data_n : std_logic_vector(7 downto 0);
    signal data_rd_wrn : std_logic;
    signal look : std_logic;
    signal tag_c : std_logic_vector(1 downto 0);
    signal tag_n : std_logic_vector(1 downto 0);
    signal tag_rd_wrn : std_logic;
    signal tag_write : std_logic;
    signal valid_c : std_logic;
    signal valid_n : std_logic;
    signal valid_rd_wrn : std_logic;
    signal valid_write : std_logic;
begin
    u_data_rw : not_gate port map (
        a => write,
        y => data_rd_wrn
    );
    u_tag_w : and2_gate port map (
        a => write,
        b => fill,
        y => tag_write
    );
    u_tag_rw : not_gate port map (
        a => tag_write,
        y => tag_rd_wrn
    );
    u_valid_w : or2_gate port map (
        a => tag_write,
        b => reset,
        y => valid_write
    );
    u_valid_rw : not_gate port map (
        a => valid_write,
        y => valid_rd_wrn
    );
    u_block_0 : cache_block port map (
        block_select => block_select(0),
        byte_select(3 downto 0) => byte_select(3 downto 0),
        reset => reset,
        data_rd_wrn => data_rd_wrn,
        tag_rd_wrn => tag_rd_wrn,
        valid_rd_wrn => valid_rd_wrn,
        write_data(7 downto 0) => write_data(7 downto 0),
        tag_in(1 downto 0) => tag_in(1 downto 0),
        valid_in => fill,
        read_data(7 downto 0) => data_c(7 downto 0),
        tag_out(1 downto 0) => tag_c(1 downto 0),
        valid_out => valid_c
    );
    u_block_1 : cache_block port map (
        block_select => block_select(1),
        byte_select(3 downto 0) => byte_select(3 downto 0),
        reset => reset,
        data_rd_wrn => data_rd_wrn,
        tag_rd_wrn => tag_rd_wrn,
        valid_rd_wrn => valid_rd_wrn,
        write_data(7 downto 0) => write_data(7 downto 0),
        tag_in(1 downto 0) => tag_in(1 downto 0),
        valid_in => fill,
        read_data(7 downto 0) => data_c(7 downto 0),
        tag_out(1 downto 0) => tag_c(1 downto 0),
        valid_out => valid_c
    );
    u_block_2 : cache_block port map (
        block_select => block_select(2),
        byte_select(3 downto 0) => byte_select(3 downto 0),
        reset => reset,
        data_rd_wrn => data_rd_wrn,
        tag_rd_wrn => tag_rd_wrn,
        valid_rd_wrn => valid_rd_wrn,
        write_data(7 downto 0) => write_data(7 downto 0),
        tag_in(1 downto 0) => tag_in(1 downto 0),
        valid_in => fill,
        read_data(7 downto 0) => data_c(7 downto 0),
        tag_out(1 downto 0) => tag_c(1 downto 0),
        valid_out => valid_c
    );
    u_block_3 : cache_block port map (
        block_select => block_select(3),
        byte_select(3 downto 0) => byte_select(3 downto 0),
        reset => reset,
        data_rd_wrn => data_rd_wrn,
        tag_rd_wrn => tag_rd_wrn,
        valid_rd_wrn => valid_rd_wrn,
        write_data(7 downto 0) => write_data(7 downto 0),
        tag_in(1 downto 0) => tag_in(1 downto 0),
        valid_in => fill,
        read_data(7 downto 0) => data_c(7 downto 0),
        tag_out(1 downto 0) => tag_c(1 downto 0),
        valid_out => valid_c
    );
    u_look : not_gate port map (
        a => fill,
        y => look
    );
    u_data_hold_0 : \Dlatch\ port map (
        d => data_c(0),
        clk => look,
        q => read_data(0),
        qbar => data_n(0)
    );
    u_data_hold_1 : \Dlatch\ port map (
        d => data_c(1),
        clk => look,
        q => read_data(1),
        qbar => data_n(1)
    );
    u_data_hold_2 : \Dlatch\ port map (
        d => data_c(2),
        clk => look,
        q => read_data(2),
        qbar => data_n(2)
    );
    u_data_hold_3 : \Dlatch\ port map (
        d => data_c(3),
        clk => look,
        q => read_data(3),
        qbar => data_n(3)
    );
    u_data_hold_4 : \Dlatch\ port map (
        d => data_c(4),
        clk => look,
        q => read_data(4),
        qbar => data_n(4)
    );
    u_data_hold_5 : \Dlatch\ port map (
        d => data_c(5),
        clk => look,
        q => read_data(5),
        qbar => data_n(5)
    );
    u_data_hold_6 : \Dlatch\ port map (
        d => data_c(6),
        clk => look,
        q => read_data(6),
        qbar => data_n(6)
    );
    u_data_hold_7 : \Dlatch\ port map (
        d => data_c(7),
        clk => look,
        q => read_data(7),
        qbar => data_n(7)
    );
    u_tag_hold_0 : \Dlatch\ port map (
        d => tag_c(0),
        clk => look,
        q => tag_out(0),
        qbar => tag_n(0)
    );
    u_tag_hold_1 : \Dlatch\ port map (
        d => tag_c(1),
        clk => look,
        q => tag_out(1),
        qbar => tag_n(1)
    );
    u_valid_hold : \Dlatch\ port map (
        d => valid_c,
        clk => look,
        q => valid_out,
        qbar => valid_n
    );
end netlist;
