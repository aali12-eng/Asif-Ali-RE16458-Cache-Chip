-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:24 2026


architecture netlist of cache_block is
    component and2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    component cache_byte
        port (
            write_data : in std_logic_vector(7 downto 0);
            chip_enable : in std_logic;
            rd_wrn : in std_logic;
            read_data : out std_logic_vector(7 downto 0)
        );
    end component;
    component cache_cell
        port (
            write_data : in std_logic;
            chip_enable : in std_logic;
            rd_wrn : in std_logic;
            read_data : out std_logic
        );
    end component;
    component or2_gate
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;
    signal byte_enable : std_logic_vector(3 downto 0);
    signal valid_enable : std_logic;
begin
    u_en_0 : and2_gate port map (
        a => block_select,
        b => byte_select(0),
        y => byte_enable(0)
    );
    u_byte_0 : cache_byte port map (
        write_data(7 downto 0) => write_data(7 downto 0),
        chip_enable => byte_enable(0),
        rd_wrn => data_rd_wrn,
        read_data(7 downto 0) => read_data(7 downto 0)
    );
    u_en_1 : and2_gate port map (
        a => block_select,
        b => byte_select(1),
        y => byte_enable(1)
    );
    u_byte_1 : cache_byte port map (
        write_data(7 downto 0) => write_data(7 downto 0),
        chip_enable => byte_enable(1),
        rd_wrn => data_rd_wrn,
        read_data(7 downto 0) => read_data(7 downto 0)
    );
    u_en_2 : and2_gate port map (
        a => block_select,
        b => byte_select(2),
        y => byte_enable(2)
    );
    u_byte_2 : cache_byte port map (
        write_data(7 downto 0) => write_data(7 downto 0),
        chip_enable => byte_enable(2),
        rd_wrn => data_rd_wrn,
        read_data(7 downto 0) => read_data(7 downto 0)
    );
    u_en_3 : and2_gate port map (
        a => block_select,
        b => byte_select(3),
        y => byte_enable(3)
    );
    u_byte_3 : cache_byte port map (
        write_data(7 downto 0) => write_data(7 downto 0),
        chip_enable => byte_enable(3),
        rd_wrn => data_rd_wrn,
        read_data(7 downto 0) => read_data(7 downto 0)
    );
    u_tag_0 : cache_cell port map (
        write_data => tag_in(0),
        chip_enable => block_select,
        rd_wrn => tag_rd_wrn,
        read_data => tag_out(0)
    );
    u_tag_1 : cache_cell port map (
        write_data => tag_in(1),
        chip_enable => block_select,
        rd_wrn => tag_rd_wrn,
        read_data => tag_out(1)
    );
    u_valid_en : or2_gate port map (
        a => block_select,
        b => reset,
        y => valid_enable
    );
    u_valid : cache_cell port map (
        write_data => valid_in,
        chip_enable => valid_enable,
        rd_wrn => valid_rd_wrn,
        read_data => valid_out
    );
end netlist;
