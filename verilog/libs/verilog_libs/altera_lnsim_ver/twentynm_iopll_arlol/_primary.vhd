library verilog;
use verilog.vl_types.all;
entity twentynm_iopll_arlol is
    generic(
        ENABLE          : integer := 0
    );
    port(
        refclk          : in     vl_logic;
        lock            : in     vl_logic;
        rst_n           : in     vl_logic;
        reconfig_idle_n : in     vl_logic;
        auto_rst_n      : out    vl_logic
    );
end twentynm_iopll_arlol;
