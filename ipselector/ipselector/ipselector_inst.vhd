	component ipselector is
		port (
			button_rnd_export : in  std_logic                    := 'X'; -- export
			clk_clk           : in  std_logic                    := 'X'; -- clk
			seg7_out_export   : out std_logic_vector(7 downto 0)         -- export
		);
	end component ipselector;

	u0 : component ipselector
		port map (
			button_rnd_export => CONNECTED_TO_button_rnd_export, -- button_rnd.export
			clk_clk           => CONNECTED_TO_clk_clk,           --        clk.clk
			seg7_out_export   => CONNECTED_TO_seg7_out_export    --   seg7_out.export
		);

