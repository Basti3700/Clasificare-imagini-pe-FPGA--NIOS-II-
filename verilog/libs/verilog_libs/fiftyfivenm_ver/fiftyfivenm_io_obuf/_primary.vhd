library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_io_obuf is
    generic(
        open_drain_output: string  := "false";
        bus_hold        : string  := "false";
        lpm_type        : string  := "fiftyfivenm_io_obuf"
    );
    port(
        i               : in     vl_logic;
        oe              : in     vl_logic;
        seriesterminationcontrol: in     vl_logic_vector(15 downto 0);
        o               : out    vl_logic;
        obar            : out    vl_logic;
        devoe           : in     vl_logic
    );
end fiftyfivenm_io_obuf;
