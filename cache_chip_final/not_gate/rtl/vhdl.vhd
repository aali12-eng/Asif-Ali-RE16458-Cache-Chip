-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Sun Nov 22 21:36:09 2026


architecture rtl of not_gate is
begin
    y <= not a after GATE_DELAY;
end architecture rtl;
