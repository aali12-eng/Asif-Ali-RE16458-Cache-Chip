-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:17 2026


architecture netlist of state_machine is
    component not_gate
        port (
            a : in std_logic;
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
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component nand2_gate
        port (
            a : in std_logic;
            b : in std_logic;
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
    component nor2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component or3_gate
        port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            y : out std_logic
        );
    end component;
    component dff
        port (
            d : in std_logic;
            clk : in std_logic;
            q : out std_logic;
            qbar : out std_logic
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
    component pos_dff
        port (
            d : in std_logic;
            clk : in std_logic;
            q : out std_logic
        );
    end component;
    component xnor2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal b1 : std_logic;
    signal busy_d : std_logic;
    signal busy_st : std_logic;
    signal byte_c : std_logic;
    signal byte_valid : std_logic;
    signal c0_n : std_logic;
    signal c16 : std_logic;
    signal c21 : std_logic;
    signal c321 : std_logic;
    signal c41_n : std_logic;
    signal enable_d : std_logic;
    signal hit_d : std_logic;
    signal hit_load : std_logic;
    signal idle_keep : std_logic;
    signal idle_set : std_logic;
    signal miss : std_logic;
    signal miss_done : std_logic;
    signal n_idle : std_logic;
    signal n_miss : std_logic;
    signal n_miss_i : std_logic;
    signal n_out_i : std_logic;
    signal n_write : std_logic;
    signal q_n : std_logic_vector(7 downto 0);
    signal rd_hit : std_logic;
    signal rd_miss : std_logic;
    signal rd_n : std_logic;
    signal rd_ok : std_logic;
    signal rst_n : std_logic;
    signal used : std_logic;
    signal waiting : std_logic;
    signal wphase : std_logic;
    signal wphase_a : std_logic;
    signal wr_hit : std_logic;
    signal wr_req : std_logic;
begin
    u_rst_n : not_gate port map (
        a => reset,
        y => rst_n
    );
    u_rd_n : not_gate port map (
        a => read_write,
        y => rd_n
    );
    u_miss : not_gate port map (
        a => hit,
        y => miss
    );
    u_c0_n : not_gate port map (
        a => count(0),
        y => c0_n
    );
    u_c1_n : not_gate port map (
        a => count(1),
        y => fill_byte(0)
    );
    u_wait : or2_gate port map (
        a => state(0),
        b => state(4),
        y => waiting
    );
    u_accept : and2_gate port map (
        a => start,
        b => waiting,
        y => latch_input
    );
    u_rd_ok : and2_gate port map (
        a => latch_way,
        b => read_write,
        y => rd_ok
    );
    u_rd_hit : and2_gate port map (
        a => rd_ok,
        b => hit,
        y => rd_hit
    );
    u_rd_ms : and2_gate port map (
        a => rd_ok,
        b => miss,
        y => rd_miss
    );
    u_wr_req : and2_gate port map (
        a => latch_way,
        b => rd_n,
        y => wr_req
    );
    u_c41_n : nand2_gate port map (
        a => count(4),
        b => count(1),
        y => c41_n
    );
    u_ms_on : and2_gate port map (
        a => state(3),
        b => c41_n,
        y => fill
    );
    u_ms_dn : and3_gate port map (
        a => state(3),
        b => count(4),
        c => count(1),
        y => miss_done
    );
    u_n_chk : and2_gate port map (
        a => latch_input,
        b => rst_n,
        y => count_restart
    );
    u_n_wr : and2_gate port map (
        a => wr_req,
        b => rst_n,
        y => n_write
    );
    u_n_ms_i : or2_gate port map (
        a => rd_miss,
        b => fill,
        y => n_miss_i
    );
    u_n_ms : and2_gate port map (
        a => n_miss_i,
        b => rst_n,
        y => n_miss
    );
    u_n_out_i : or2_gate port map (
        a => rd_hit,
        b => miss_done,
        y => n_out_i
    );
    u_n_out : and2_gate port map (
        a => n_out_i,
        b => rst_n,
        y => latch_output
    );
    u_keep : nor2_gate port map (
        a => latch_input,
        b => reset,
        y => idle_keep
    );
    u_kept : and2_gate port map (
        a => waiting,
        b => idle_keep,
        y => idle_set
    );
    u_n_idle : or3_gate port map (
        a => reset,
        b => idle_set,
        c => state(2),
        y => n_idle
    );
    u_s_idle : dff port map (
        d => n_idle,
        clk => clk,
        q => state(0),
        qbar => q_n(0)
    );
    u_s_check : dff port map (
        d => count_restart,
        clk => clk,
        q => latch_way,
        qbar => q_n(1)
    );
    u_s_write : dff port map (
        d => n_write,
        clk => clk,
        q => state(2),
        qbar => q_n(2)
    );
    u_s_miss : dff port map (
        d => n_miss,
        clk => clk,
        q => state(3),
        qbar => q_n(3)
    );
    u_s_out : dff port map (
        d => latch_output,
        clk => clk,
        q => state(4),
        qbar => q_n(4)
    );
    u_busy_a : or2_gate port map (
        a => count_restart,
        b => n_write,
        y => b1
    );
    u_busy_b : or2_gate port map (
        a => b1,
        b => n_miss,
        y => busy_d
    );
    u_busy : dff port map (
        d => busy_d,
        clk => clk,
        q => busy,
        qbar => q_n(5)
    );
    u_en_d : and2_gate port map (
        a => rd_miss,
        b => rst_n,
        y => enable_d
    );
    u_en : dff port map (
        d => enable_d,
        clk => clk,
        q => enable,
        qbar => q_n(6)
    );
    u_oe : dff port map (
        d => latch_output,
        clk => clk,
        q => output_enable,
        qbar => q_n(7)
    );
    u_hit_d : and2_gate port map (
        a => hit,
        b => rst_n,
        y => hit_d
    );
    u_hit_ld : or2_gate port map (
        a => latch_way,
        b => reset,
        y => hit_load
    );
    u_hit_r : dff_en port map (
        d => hit_d,
        load => hit_load,
        clk => clk,
        q => hit_result
    );
    u_wr_hit : and2_gate port map (
        a => state(2),
        b => hit_result,
        y => wr_hit
    );
    u_c21 : or2_gate port map (
        a => count(2),
        b => count(1),
        y => c21
    );
    u_c321 : and2_gate port map (
        a => count(3),
        b => c21,
        y => c321
    );
    u_c4 : and2_gate port map (
        a => count(4),
        b => fill_byte(0),
        y => c16
    );
    u_byte_c : or2_gate port map (
        a => c321,
        b => c16,
        y => byte_c
    );
    u_bv : and3_gate port map (
        a => state(3),
        b => byte_c,
        c => c0_n,
        y => byte_valid
    );
    u_wph_a : or2_gate port map (
        a => wr_hit,
        b => byte_valid,
        y => wphase_a
    );
    u_wphase : and2_gate port map (
        a => wphase_a,
        b => rst_n,
        y => wphase
    );
    u_write : pos_dff port map (
        d => wphase,
        clk => clk,
        q => write
    );
    u_bst : or3_gate port map (
        a => latch_way,
        b => state(2),
        c => state(3),
        y => busy_st
    );
    u_count : and2_gate port map (
        a => busy_st,
        b => rst_n,
        y => count_enable
    );
    u_fb1 : xnor2_gate port map (
        a => count(2),
        b => count(1),
        y => fill_byte(1)
    );
    u_used : or2_gate port map (
        a => hit,
        b => read_write,
        y => used
    );
    u_lru : and2_gate port map (
        a => latch_way,
        b => used,
        y => lru_update
    );
    state(1) <= latch_way;
end netlist;
