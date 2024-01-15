library verilog;
use verilog.vl_types.all;
entity ama_scanchain is
    generic(
        width_scanin    : integer := 1;
        width_scanchain : integer := 1;
        input_register_clock_0: string  := "UNREGISTERED";
        input_register_aclr_0: string  := "NONE";
        input_register_clock_1: string  := "UNREGISTERED";
        input_register_aclr_1: string  := "NONE";
        input_register_clock_2: string  := "UNREGISTERED";
        input_register_aclr_2: string  := "NONE";
        input_register_clock_3: string  := "UNREGISTERED";
        input_register_aclr_3: string  := "NONE";
        input_register_sclr_0: string  := "NONE";
        input_register_sclr_1: string  := "NONE";
        input_register_sclr_2: string  := "NONE";
        input_register_sclr_3: string  := "NONE";
        scanchain_register_clock: string  := "UNREGISTERED";
        scanchain_register_aclr: string  := "NONE";
        scanchain_register_sclr: string  := "NONE";
        port_sign       : string  := "PORT_UNUSED";
        number_of_multipliers: integer := 1
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        sclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        sign            : in     vl_logic;
        scanin          : in     vl_logic_vector;
        data_out_0      : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector;
        data_out_2      : out    vl_logic_vector;
        data_out_3      : out    vl_logic_vector;
        scanout         : out    vl_logic_vector
    );
end ama_scanchain;
