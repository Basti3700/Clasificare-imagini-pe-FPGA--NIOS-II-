library verilog;
use verilog.vl_types.all;
entity ama_latency_function is
    generic(
        width_data_in   : integer := 1;
        width_data_out  : integer := 1;
        latency         : integer := 0;
        latency_clock   : string  := "UNREGISTERED";
        latency_aclr    : string  := "NONE";
        latency_sclr    : string  := "NONE"
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        sclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
end ama_latency_function;
