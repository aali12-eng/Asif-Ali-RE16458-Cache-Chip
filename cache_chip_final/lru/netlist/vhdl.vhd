-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:34 2026


architecture netlist of lru is
    component decoder2to4
        port (
            a : in std_logic_vector(1 downto 0);
            en : in std_logic;
            y : out std_logic_vector(3 downto 0)
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
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
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
    component mux4_n_1
        port (
            d0 : in std_logic_vector(0 downto 0);
            d1 : in std_logic_vector(0 downto 0);
            d2 : in std_logic_vector(0 downto 0);
            d3 : in std_logic_vector(0 downto 0);
            s : in std_logic_vector(1 downto 0);
            y : out std_logic_vector(0 downto 0)
        );
    end component;
    signal bits : std_logic_vector(3 downto 0);
    signal d : std_logic;
    signal load : std_logic_vector(3 downto 0);
    signal rst_n : std_logic;
    signal set_en : std_logic_vector(3 downto 0);
    signal used_n : std_logic;
begin
    u_dec : decoder2to4 port map (
        a(1 downto 0) => block_offset(1 downto 0),
        en => update,
        y(3 downto 0) => set_en(3 downto 0)
    );
    u_inv : not_gate port map (
        a => used_way,
        y => used_n
    );
    u_rst_n : not_gate port map (
        a => reset,
        y => rst_n
    );
    u_d : and2_gate port map (
        a => used_n,
        b => rst_n,
        y => d
    );
    u_load_0 : or2_gate port map (
        a => set_en(0),
        b => reset,
        y => load(0)
    );
    u_bit_0 : dff_en port map (
        d => d,
        load => load(0),
        clk => clk,
        q => bits(0)
    );
    u_load_1 : or2_gate port map (
        a => set_en(1),
        b => reset,
        y => load(1)
    );
    u_bit_1 : dff_en port map (
        d => d,
        load => load(1),
        clk => clk,
        q => bits(1)
    );
    u_load_2 : or2_gate port map (
        a => set_en(2),
        b => reset,
        y => load(2)
    );
    u_bit_2 : dff_en port map (
        d => d,
        load => load(2),
        clk => clk,
        q => bits(2)
    );
    u_load_3 : or2_gate port map (
        a => set_en(3),
        b => reset,
        y => load(3)
    );
    u_bit_3 : dff_en port map (
        d => d,
        load => load(3),
        clk => clk,
        q => bits(3)
    );
    u_mux : mux4_n_1 port map (
        d0(0) => bits(0),
        d1(0) => bits(1),
        d2(0) => bits(2),
        d3(0) => bits(3),
        s(1 downto 0) => block_offset(1 downto 0),
        y(0) => lru_way
    );
end netlist;
