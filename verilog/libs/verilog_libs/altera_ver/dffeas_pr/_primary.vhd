library verilog;
use verilog.vl_types.all;
entity dffeas_pr is
    generic(
        power_up        : string  := "DONT_CARE";
        is_wysiwyg      : string  := "false";
        dont_touch      : string  := "false";
        x_on_violation  : string  := "on";
        sclr_over_ena   : string  := "false";
        lpm_type        : string  := "dffeas_pr"
      --pr_load         : integer type with unrepresentable value!
    );
    port(
        d               : in     vl_logic;
        clk             : in     vl_logic;
        ena             : in     vl_logic;
        clrn            : in     vl_logic;
        prn             : in     vl_logic;
        aload           : in     vl_logic;
        asdata          : in     vl_logic;
        sclr            : in     vl_logic;
        sload           : in     vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic;
        pr_activate     : in     vl_logic;
        q               : out    vl_logic
    );
end dffeas_pr;
