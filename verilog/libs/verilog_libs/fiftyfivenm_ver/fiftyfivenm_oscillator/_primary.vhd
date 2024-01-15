library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_oscillator is
    generic(
        lpm_type        : string  := "fiftyfivenm_oscillator";
        device_id       : string  := "08";
        clock_frequency : string  := "dummy"
    );
    port(
        oscena          : in     vl_logic;
        clkout          : out    vl_logic;
        clkout1         : out    vl_logic
    );
end fiftyfivenm_oscillator;
