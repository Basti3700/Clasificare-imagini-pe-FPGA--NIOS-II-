library verilog;
use verilog.vl_types.all;
entity common_14nm_lutram_register is
    generic(
        width           : integer := 1;
        preset          : integer := 0;
        portb_dataout_clear: string  := "none"
    );
    port(
        d               : in     vl_logic_vector;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic;
        stall           : in     vl_logic;
        ena             : in     vl_logic;
        q               : out    vl_logic_vector;
        aclrout         : out    vl_logic
    );
end common_14nm_lutram_register;
