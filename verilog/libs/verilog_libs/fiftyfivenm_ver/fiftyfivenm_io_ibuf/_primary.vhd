library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_io_ibuf is
    generic(
        bus_hold        : string  := "false";
        simulate_z_as   : string  := "Z";
        listen_to_nsleep_signal: string  := "false";
        differential_mode: string  := "false";
        lpm_type        : string  := "fiftyfivenm_io_ibuf"
    );
    port(
        i               : in     vl_logic;
        ibar            : in     vl_logic;
        nsleep          : in     vl_logic;
        o               : out    vl_logic
    );
end fiftyfivenm_io_ibuf;
