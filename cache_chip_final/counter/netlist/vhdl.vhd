-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:19 2026


architecture netlist of counter is
    component not_gate
        port (
            a : in std_logic;
            y : out std_logic
        );
    end component;
    component half_adder
        port (
            a : in std_logic;
            b : in std_logic;
            sum : out std_logic;
            carry : out std_logic
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
    component dff
        port (
            d : in std_logic;
            clk : in std_logic;
            q : out std_logic;
            qbar : out std_logic
        );
    end component;
    signal carry : std_logic_vector(5 downto 1);
    signal d : std_logic_vector(4 downto 0);
    signal d_c : std_logic_vector(4 downto 0);
    signal q_n : std_logic_vector(4 downto 0);
    signal restart_n : std_logic;
    signal sum : std_logic_vector(4 downto 0);
begin
    u_rs_n : not_gate port map (
        a => restart,
        y => restart_n
    );
    u_ha_0 : half_adder port map (
        a => q(0),
        b => '1',
        sum => sum(0),
        carry => carry(1)
    );
    u_clr_0 : and2_gate port map (
        a => sum(0),
        b => count,
        y => d_c(0)
    );
    u_rs_0 : or2_gate port map (
        a => d_c(0),
        b => restart,
        y => d(0)
    );
    u_ff_0 : dff port map (
        d => d(0),
        clk => clk,
        q => q(0),
        qbar => q_n(0)
    );
    u_ha_1 : half_adder port map (
        a => q(1),
        b => carry(1),
        sum => sum(1),
        carry => carry(2)
    );
    u_clr_1 : and2_gate port map (
        a => sum(1),
        b => count,
        y => d_c(1)
    );
    u_rs_1 : and2_gate port map (
        a => d_c(1),
        b => restart_n,
        y => d(1)
    );
    u_ff_1 : dff port map (
        d => d(1),
        clk => clk,
        q => q(1),
        qbar => q_n(1)
    );
    u_ha_2 : half_adder port map (
        a => q(2),
        b => carry(2),
        sum => sum(2),
        carry => carry(3)
    );
    u_clr_2 : and2_gate port map (
        a => sum(2),
        b => count,
        y => d_c(2)
    );
    u_rs_2 : and2_gate port map (
        a => d_c(2),
        b => restart_n,
        y => d(2)
    );
    u_ff_2 : dff port map (
        d => d(2),
        clk => clk,
        q => q(2),
        qbar => q_n(2)
    );
    u_ha_3 : half_adder port map (
        a => q(3),
        b => carry(3),
        sum => sum(3),
        carry => carry(4)
    );
    u_clr_3 : and2_gate port map (
        a => sum(3),
        b => count,
        y => d_c(3)
    );
    u_rs_3 : and2_gate port map (
        a => d_c(3),
        b => restart_n,
        y => d(3)
    );
    u_ff_3 : dff port map (
        d => d(3),
        clk => clk,
        q => q(3),
        qbar => q_n(3)
    );
    u_ha_4 : half_adder port map (
        a => q(4),
        b => carry(4),
        sum => sum(4),
        carry => carry(5)
    );
    u_clr_4 : and2_gate port map (
        a => sum(4),
        b => count,
        y => d_c(4)
    );
    u_rs_4 : and2_gate port map (
        a => d_c(4),
        b => restart_n,
        y => d(4)
    );
    u_ff_4 : dff port map (
        d => d(4),
        clk => clk,
        q => q(4),
        qbar => q_n(4)
    );
end netlist;
