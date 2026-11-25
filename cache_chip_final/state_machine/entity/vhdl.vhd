-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:17 2026


library ieee;
use ieee.std_logic_1164.all;

entity state_machine is
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
        latch_input : inout std_logic;
        latch_output : inout std_logic;
        count_enable : out std_logic;
        count_restart : inout std_logic;
        fill_byte : inout std_logic_vector(1 downto 0);
        hit_result : inout std_logic;
        fill : inout std_logic;
        write : out std_logic;
        latch_way : inout std_logic;
        lru_update : out std_logic;
        state : inout std_logic_vector(4 downto 0)
    );
end state_machine;
