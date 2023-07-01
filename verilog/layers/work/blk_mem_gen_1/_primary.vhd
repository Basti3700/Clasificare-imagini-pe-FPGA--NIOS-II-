library verilog;
use verilog.vl_types.all;
entity blk_mem_gen_1 is
    port(
        address         : in     vl_logic_vector(12 downto 0);
        clken           : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(15 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end blk_mem_gen_1;