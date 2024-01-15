library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_io_pad is
    generic(
        lpm_type        : string  := "fiftyfivenm_io_pad"
    );
    port(
        padin           : in     vl_logic;
        padout          : out    vl_logic
    );
end fiftyfivenm_io_pad;
