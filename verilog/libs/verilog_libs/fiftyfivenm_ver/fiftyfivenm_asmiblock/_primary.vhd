library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_asmiblock is
    generic(
        lpm_type        : string  := "fiftyfivenm_asmiblock";
        enable_sim      : string  := "false"
    );
    port(
        dclkin          : in     vl_logic;
        scein           : in     vl_logic;
        oe              : in     vl_logic;
        sdoin           : in     vl_logic;
        data0out        : out    vl_logic
    );
end fiftyfivenm_asmiblock;
