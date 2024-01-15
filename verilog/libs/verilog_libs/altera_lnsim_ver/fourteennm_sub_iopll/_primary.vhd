library verilog;
use verilog.vl_types.all;
entity fourteennm_sub_iopll is
    generic(
        lpm_type        : string  := "sub_pll";
        duty_cycle      : integer := 50;
        output_clock_frequency: string  := "0 ps";
        phase_shift     : string  := "0 ps";
        reference_clock_frequency: string  := "0 ps";
        sim_additional_refclk_cycles_to_lock: integer := 0;
        fractional_vco_multiplier: string  := "false";
        use_khz         : integer := 1;
        clock_name      : string  := "";
        clock_name_global: string  := "false";
        counter_number  : integer := 0
    );
    port(
        refclk          : in     vl_logic;
        rst             : in     vl_logic;
        fbclk           : in     vl_logic;
        outclk          : out    vl_logic;
        locked          : out    vl_logic;
        fboutclk        : out    vl_logic
    );
end fourteennm_sub_iopll;
