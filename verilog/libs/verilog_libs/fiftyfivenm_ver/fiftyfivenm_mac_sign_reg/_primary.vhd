library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_mac_sign_reg is
    port(
        clk             : in     vl_logic;
        d               : in     vl_logic;
        ena             : in     vl_logic;
        aclr            : in     vl_logic;
        q               : out    vl_logic
    );
end fiftyfivenm_mac_sign_reg;
