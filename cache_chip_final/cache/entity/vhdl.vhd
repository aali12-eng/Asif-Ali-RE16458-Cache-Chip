-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:09 2026


library ieee;
use ieee.std_logic_1164.all;

entity cache is
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
        way : inout std_logic
    );
end cache;
