library verilog;
use verilog.vl_types.all;
entity altera_iopll_rotation_lcells is
    generic(
        pll_type        : string  := "Arria 10"
    );
    port(
        cntsel_user     : in     vl_logic_vector(3 downto 0);
        cntsel_physical : out    vl_logic_vector(3 downto 0)
    );
end altera_iopll_rotation_lcells;
