library verilog;
use verilog.vl_types.all;
entity alt_fault_injection is
    generic(
        CRC_OSC_DIVIDER : integer := 8;
        ENABLE_EMR_SHARE: string  := "NO";
        INTENDED_DEVICE_FAMILY: string  := "Stratix V";
        TEST_LOGIC_TYPE : string  := "OR";
        ENABLE_INTOSC_SHARE: string  := "NO";
        EMR_WIDTH       : integer := 67;
        INIT_EMR        : string  := "NO";
        LPM_TYPE        : string  := "ALT_FAULT_INJECTION";
        EMR_ARRAY_SIZE  : integer := 128;
        INSTANTIATE_PR_BLOCK: integer := 1;
        DATA_REG_WIDTH  : integer := 16
    );
    port(
        system_error    : in     vl_logic;
        pr_ready        : in     vl_logic;
        system_reset    : out    vl_logic;
        pr_request      : out    vl_logic;
        emr_data        : in     vl_logic_vector;
        error_scrubbed  : out    vl_logic;
        user_intosc     : out    vl_logic;
        pr_ext_request  : in     vl_logic;
        pr_error        : in     vl_logic;
        emr_valid       : in     vl_logic;
        crc_error       : in     vl_logic;
        error_injected  : out    vl_logic;
        pr_data         : out    vl_logic_vector;
        pr_clk          : out    vl_logic;
        pr_done         : in     vl_logic
    );
end alt_fault_injection;
