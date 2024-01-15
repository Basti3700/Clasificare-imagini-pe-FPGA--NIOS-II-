library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_phase_detector is
    port(
        reset           : in     vl_logic;
        phasedone       : in     vl_logic;
        clk             : in     vl_logic_vector(2 downto 0);
        up              : out    vl_logic;
        down            : out    vl_logic;
        dftout          : out    vl_logic_vector(11 downto 0)
    );
end fiftyfivenm_phase_detector;
