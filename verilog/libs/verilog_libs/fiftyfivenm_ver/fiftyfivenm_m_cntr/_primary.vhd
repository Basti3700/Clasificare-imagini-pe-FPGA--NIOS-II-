library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_m_cntr is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        cout            : out    vl_logic;
        initial_value   : in     vl_logic_vector(31 downto 0);
        modulus         : in     vl_logic_vector(31 downto 0);
        time_delay      : in     vl_logic_vector(31 downto 0)
    );
end fiftyfivenm_m_cntr;
