library verilog;
use verilog.vl_types.all;
entity fc_1 is
    generic(
        S_IDLE          : integer := 64;
        S_CHECK         : integer := 32;
        S_LOAD_WEIGHTS  : integer := 16;
        S_LOAD_BIAS     : integer := 8;
        S_LOAD_DATA     : integer := 4;
        S_MULTI_ADD     : integer := 2;
        S_STORE_RESULT  : integer := 1;
        conv3_result_base: integer := 7880;
        fc1_weights_base: integer := 50692;
        fc1_bias_base   : integer := 61192;
        fc1_result_base : integer := 8000
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        fc_1_en         : in     vl_logic;
        bias_weights_bram_douta: in     vl_logic_vector(15 downto 0);
        result_bram_douta: in     vl_logic_vector(15 downto 0);
        bias_weights_bram_ena: out    vl_logic;
        bias_weights_bram_addra: out    vl_logic_vector(15 downto 0);
        result_bram_ena : out    vl_logic;
        result_bram_wea : out    vl_logic;
        result_bram_addra: out    vl_logic_vector(12 downto 0);
        result_bram_dina: out    vl_logic_vector(15 downto 0);
        fc_1_finish     : out    vl_logic
    );
end fc_1;
