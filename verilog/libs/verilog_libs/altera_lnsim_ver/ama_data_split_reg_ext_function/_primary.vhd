library verilog;
use verilog.vl_types.all;
entity ama_data_split_reg_ext_function is
    generic(
        width_data_in   : integer := 1;
        register_clock_0: string  := "UNREGISTERED";
        register_aclr_0 : string  := "NONE";
        register_sclr_0 : string  := "NONE";
        register_clock_1: string  := "UNREGISTERED";
        register_aclr_1 : string  := "NONE";
        register_sclr_1 : string  := "NONE";
        register_clock_2: string  := "UNREGISTERED";
        register_aclr_2 : string  := "NONE";
        register_sclr_2 : string  := "NONE";
        register_clock_3: string  := "UNREGISTERED";
        register_aclr_3 : string  := "NONE";
        register_sclr_3 : string  := "NONE";
        number_of_multipliers: integer := 1;
        port_sign       : string  := "PORT_UNUSED";
        latency         : integer := 0;
        latency_clock_0 : string  := "UNREGISTERED";
        latency_aclr_0  : string  := "NONE";
        latency_sclr_0  : string  := "NONE";
        latency_clock_1 : string  := "UNREGISTERED";
        latency_aclr_1  : string  := "NONE";
        latency_sclr_1  : string  := "NONE";
        latency_clock_2 : string  := "UNREGISTERED";
        latency_aclr_2  : string  := "NONE";
        latency_sclr_2  : string  := "NONE";
        latency_clock_3 : string  := "UNREGISTERED";
        latency_aclr_3  : string  := "NONE";
        latency_sclr_3  : string  := "NONE";
        width_data_in_0_lsb: integer := 0
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        sclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        sign            : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_out_0      : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector;
        data_out_2      : out    vl_logic_vector;
        data_out_3      : out    vl_logic_vector
    );
end ama_data_split_reg_ext_function;
