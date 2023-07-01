library verilog;
use verilog.vl_types.all;
entity larger_index is
    generic(
        BIT_WIDTH       : integer := 8;
        NUM_INPUTS      : integer := 10;
        INDEX_WIDTH     : integer := 4
    );
    port(
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        idx1            : in     vl_logic_vector;
        idx2            : in     vl_logic_vector;
        larger_val      : out    vl_logic_vector;
        larger_idx      : out    vl_logic_vector
    );
end larger_index;
