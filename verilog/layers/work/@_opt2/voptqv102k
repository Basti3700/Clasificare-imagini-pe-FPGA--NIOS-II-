library verilog;
use verilog.vl_types.all;
entity lenet_top is
    generic(
        S_START         : integer := 256;
        S_CONV_1        : integer := 128;
        S_POOL_1        : integer := 64;
        S_CONV_2        : integer := 32;
        S_POOL_2        : integer := 16;
        S_CONV_3        : integer := 8;
        S_FC_1          : integer := 4;
        S_FC_2          : integer := 2
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        graph           : in     vl_logic_vector(4 downto 0);
        result          : out    vl_logic_vector(159 downto 0);
        lenet_finish    : out    vl_logic;
        max_index       : out    vl_logic_vector(3 downto 0);
        c2_finish       : out    vl_logic;
        c3_finish       : out    vl_logic;
        f4_finish       : out    vl_logic;
        f5_finish       : out    vl_logic;
        right           : out    vl_logic_vector(1 downto 0);
        c1_finish       : out    vl_logic
    );
end lenet_top;
