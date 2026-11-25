-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:37 2026


library ieee;
use ieee.std_logic_1164.all;

entity chip is
    port (
        cpu_add : in std_logic_vector(5 downto 0);
        cpu_rd_wrn : in std_logic;
        start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        mem_data : in std_logic_vector(7 downto 0);
        busy : out std_logic;
        mem_en : inout std_logic;
        mem_add : out std_logic_vector(5 downto 0);
        cpu_data : inout std_logic_vector(7 downto 0)
    );
end chip;
