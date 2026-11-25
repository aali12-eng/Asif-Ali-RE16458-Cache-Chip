-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:33 2026


architecture netlist of mux4_n_1 is
    component mux2_n_1
        port (
            a : in std_logic_vector(0 downto 0);
            b : in std_logic_vector(0 downto 0);
            s : in std_logic;
            y : out std_logic_vector(0 downto 0)
        );
    end component;
    signal m01 : std_logic_vector(0 downto 0);
    signal m23 : std_logic_vector(0 downto 0);
begin
    u_01 : mux2_n_1 port map (
        a(0) => d0(0),
        b(0) => d1(0),
        s => s(0),
        y(0) => m01(0)
    );
    u_23 : mux2_n_1 port map (
        a(0) => d2(0),
        b(0) => d3(0),
        s => s(0),
        y(0) => m23(0)
    );
    u_y : mux2_n_1 port map (
        a(0) => m01(0),
        b(0) => m23(0),
        s => s(1),
        y(0) => y(0)
    );
end netlist;
