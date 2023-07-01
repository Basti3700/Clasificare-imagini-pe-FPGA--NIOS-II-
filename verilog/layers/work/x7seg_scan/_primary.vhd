library verilog;
use verilog.vl_types.all;
entity x7seg_scan is
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        graph           : in     vl_logic_vector(4 downto 0);
        max_index       : in     vl_logic_vector(3 downto 0);
        x7seg_data      : out    vl_logic_vector(3 downto 0);
        an              : out    vl_logic_vector(7 downto 0)
    );
end x7seg_scan;
