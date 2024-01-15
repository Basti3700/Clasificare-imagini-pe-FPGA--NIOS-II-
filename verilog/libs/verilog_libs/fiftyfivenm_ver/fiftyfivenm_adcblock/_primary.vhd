library verilog;
use verilog.vl_types.all;
entity fiftyfivenm_adcblock is
    generic(
        clkdiv          : integer := 1;
        tsclkdiv        : integer := 0;
        tsclksel        : integer := 0;
        prescalar       : integer := 0;
        refsel          : integer := 0;
        pwd             : integer := 0;
        testbits        : integer := 0;
        device_partname_fivechar_prefix: string  := "10M08";
        is_this_first_or_second_adc: integer := 1;
        analog_input_pin_mask: integer := 0;
        reserve_block   : string  := "false";
        enable_usr_sim  : integer := 0;
        reference_voltage_sim: integer := 65536;
        simfilename_ch0 : string  := "simfilename_ch0";
        simfilename_ch1 : string  := "simfilename_ch1";
        simfilename_ch2 : string  := "simfilename_ch2";
        simfilename_ch3 : string  := "simfilename_ch3";
        simfilename_ch4 : string  := "simfilename_ch4";
        simfilename_ch5 : string  := "simfilename_ch5";
        simfilename_ch6 : string  := "simfilename_ch6";
        simfilename_ch7 : string  := "simfilename_ch7";
        simfilename_ch8 : string  := "simfilename_ch8";
        simfilename_ch9 : string  := "simfilename_ch9";
        simfilename_ch10: string  := "simfilename_ch10";
        simfilename_ch11: string  := "simfilename_ch11";
        simfilename_ch12: string  := "simfilename_ch12";
        simfilename_ch13: string  := "simfilename_ch13";
        simfilename_ch14: string  := "simfilename_ch14";
        simfilename_ch15: string  := "simfilename_ch15";
        simfilename_ch16: string  := "simfilename_ch16"
    );
    port(
        clkin_from_pll_c0: in     vl_logic;
        usr_pwd         : in     vl_logic;
        tsen            : in     vl_logic;
        chsel           : in     vl_logic_vector(4 downto 0);
        soc             : in     vl_logic;
        eoc             : out    vl_logic;
        dout            : out    vl_logic_vector(11 downto 0);
        clk_dft         : out    vl_logic
    );
end fiftyfivenm_adcblock;
