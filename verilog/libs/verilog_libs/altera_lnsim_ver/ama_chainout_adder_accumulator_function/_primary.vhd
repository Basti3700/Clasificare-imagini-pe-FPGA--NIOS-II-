library verilog;
use verilog.vl_types.all;
entity ama_chainout_adder_accumulator_function is
    generic(
        width_result    : integer := 1;
        chainout_adder  : string  := "NO";
        chainout_adder_direction: string  := "ADD";
        accumulator     : string  := "NO";
        accum_direction : string  := "ADD";
        loadconst_value : integer := 0;
        accum_sload_register: string  := "UNREGISTERED";
        accum_sload_aclr: string  := "NONE";
        accum_sload_sclr: string  := "NONE";
        double_accum    : string  := "NO";
        use_sload_accum_port: string  := "NO";
        output_register : string  := "UNREGISTERED";
        output_aclr     : string  := "NONE";
        output_sclr     : string  := "NONE";
        latency         : integer := 0;
        accum_sload_latency_clock: string  := "UNREGISTERED";
        accum_sload_latency_aclr: string  := "NONE";
        accum_sload_latency_sclr: string  := "NONE";
        port_negate     : string  := "UNUSED";
        negate_register : string  := "UNREGISTERED";
        negate_aclr     : string  := "NONE";
        negate_sclr     : string  := "NONE";
        negate_latency_clock: string  := "UNREGISTERED";
        negate_latency_aclr: string  := "NONE";
        negate_latency_sclr: string  := "NONE"
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        sclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        accum_sload     : in     vl_logic;
        sload_accum     : in     vl_logic;
        negate          : in     vl_logic;
        data_result     : in     vl_logic_vector;
        prev_result     : in     vl_logic_vector;
        chainin         : in     vl_logic_vector;
        result          : out    vl_logic_vector
    );
end ama_chainout_adder_accumulator_function;
