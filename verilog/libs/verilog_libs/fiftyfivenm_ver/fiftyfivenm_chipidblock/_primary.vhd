library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_chipidblock is
    generic(
        lpm_type        : string  := "fiftyfivenm_chipidblock";
        id_value        : string  := "00000000ffffffff"
    );
    port(
        clk             : in     vl_logic;
        shiftnld        : in     vl_logic;
        regout          : out    vl_logic
    );
end fiftyfivenm_chipidblock;
