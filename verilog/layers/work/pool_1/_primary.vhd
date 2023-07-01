library verilog;
use verilog.vl_types.all;
entity pool_1 is
    generic(
        S_IDLE          : integer := 16;
        S_CHECK         : integer := 8;
        S_LOAD_DATA     : integer := 4;
        S_POOLING       : integer := 2;
        S_STORE_RESULT  : integer := 1;
        conv1_result_base: integer := 0;
        pool1_result_base: integer := 4704
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pool_1_en       : in     vl_logic;
        result_bram_douta: in     vl_logic_vector(15 downto 0);
        result_bram_ena : out    vl_logic;
        result_bram_wea : out    vl_logic;
        result_bram_addra: out    vl_logic_vector(12 downto 0);
        result_bram_dina: out    vl_logic_vector(15 downto 0);
        pool_1_finish   : out    vl_logic
    );
end pool_1;
