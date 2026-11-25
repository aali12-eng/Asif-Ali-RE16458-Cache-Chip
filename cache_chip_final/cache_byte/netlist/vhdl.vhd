-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:23 2026


architecture netlist of cache_byte is
    component cache_cell
        port (
            write_data : in std_logic;
            chip_enable : in std_logic;
            rd_wrn : in std_logic;
            read_data : out std_logic
        );
    end component;
begin
    u_cell_0 : cache_cell port map (
        write_data => write_data(0),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(0)
    );
    u_cell_1 : cache_cell port map (
        write_data => write_data(1),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(1)
    );
    u_cell_2 : cache_cell port map (
        write_data => write_data(2),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(2)
    );
    u_cell_3 : cache_cell port map (
        write_data => write_data(3),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(3)
    );
    u_cell_4 : cache_cell port map (
        write_data => write_data(4),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(4)
    );
    u_cell_5 : cache_cell port map (
        write_data => write_data(5),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(5)
    );
    u_cell_6 : cache_cell port map (
        write_data => write_data(6),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(6)
    );
    u_cell_7 : cache_cell port map (
        write_data => write_data(7),
        chip_enable => chip_enable,
        rd_wrn => rd_wrn,
        read_data => read_data(7)
    );
end netlist;
