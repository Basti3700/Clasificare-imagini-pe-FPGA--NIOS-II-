library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_io_clock_divider is
    generic(
        invert_input_clock_phase: string  := "false";
        invert_output_clock_phase: string  := "false";
        use_phasectrlin : string  := "false";
        sync_mode       : string  := "none"
    );
    port(
        clk             : in     vl_logic;
        sreset          : in     vl_logic;
        phaseinvertctrl : in     vl_logic;
        clkout          : out    vl_logic
    );
end fiftyfivenm_io_clock_divider;
