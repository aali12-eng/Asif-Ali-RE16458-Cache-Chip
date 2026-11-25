-- 5-bit cycle counter for the read miss (negative edge)
--   count = 1 : count <= count + 1        count = 0 : count <= 0 (synchronous clear)
--   The state machine counts the clock cycles of a read miss with it: the memory enable
--   cycle, the 8-cycle memory access, the four data bytes and the final cache read.
library ieee;
use ieee.std_logic_1164.all;
use work.cache_pkg.all;

entity counter is
    port (
        count : in  std_logic;
        clk   : in  std_logic;
        q     : out std_logic_vector(COUNT_W-1 downto 0)
    );
end entity counter;

architecture structural of counter is
    signal q_i, q_n, sum, d : std_logic_vector(COUNT_W-1 downto 0);
    signal carry             : std_logic_vector(COUNT_W downto 0);
begin
    carry(0) <= '1';                                      -- add one
    g_bit : for i in 0 to COUNT_W-1 generate
        u_ha  : entity work.half_adder port map (a => q_i(i), b => carry(i), sum => sum(i), carry => carry(i+1));
        u_clr : entity work.and2_gate  port map (a => sum(i), b => count, y => d(i));
        u_ff  : entity work.dff        port map (d => d(i), clk => clk, q => q_i(i), qbar => q_n(i));
    end generate g_bit;
    q <= q_i;
end architecture structural;
