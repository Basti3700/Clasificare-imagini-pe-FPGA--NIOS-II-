library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_unvm is
    generic(
        device_id       : string  := "02";
        init_filename_sim: string  := "";
        identifier      : string  := "dummy";
        part_name       : string  := "dummy";
        is_dual_boot    : string  := "false";
        is_eram_skip    : string  := "false";
        is_compressed_image: string  := "false";
        init_filename   : string  := "dummy";
        min_valid_addr  : integer := 1;
        max_valid_addr  : integer := 1;
        min_ufm_valid_addr: integer := 1;
        max_ufm_valid_addr: integer := 1;
        addr_range1_end_addr: integer := 1;
        addr_range2_end_addr: integer := 1;
        addr_range1_offset: integer := 1;
        addr_range2_offset: integer := 1;
        addr_range3_offset: integer := 1;
        reserve_block   : string  := "false"
    );
    port(
        arclk           : in     vl_logic;
        arshft          : in     vl_logic;
        drclk           : in     vl_logic;
        drshft          : in     vl_logic;
        drdin           : in     vl_logic;
        nprogram        : in     vl_logic;
        nerase          : in     vl_logic;
        nosc_ena        : in     vl_logic;
        par_en          : in     vl_logic;
        xe_ye           : in     vl_logic;
        se              : in     vl_logic;
        ardin           : in     vl_logic_vector(22 downto 0);
        busy            : out    vl_logic;
        osc             : out    vl_logic;
        bgpbusy         : out    vl_logic;
        se_pass         : out    vl_logic;
        sp_pass         : out    vl_logic;
        drdout          : out    vl_logic_vector(31 downto 0)
    );
end fiftyfivenm_unvm;
