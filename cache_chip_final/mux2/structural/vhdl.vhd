-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Sun Nov 22 21:36:09 2026


architecture structural of mux2 is
    signal s_n, a_sel, b_sel : std_logic;
begin
    u_inv : entity work.not_gate  port map (a => s, y => s_n);
    u_a   : entity work.and2_gate port map (a => a, b => s_n, y => a_sel);
    u_b   : entity work.and2_gate port map (a => b, b => s,   y => b_sel);
    u_or  : entity work.or2_gate  port map (a => a_sel, b => b_sel, y => y);
end architecture structural;
