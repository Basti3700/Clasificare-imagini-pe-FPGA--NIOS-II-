library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_phy_clkbuf is
    port(
        inclk           : in     vl_logic_vector(3 downto 0);
        outclk          : out    vl_logic_vector(3 downto 0)
    );
end fiftyfivenm_phy_clkbuf;
