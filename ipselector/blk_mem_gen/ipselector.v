module ipselector (
	input [1:0] address,
	input chipselect,
	input clk,
	input read,
	input reset_n,
	input write,
	input [15:0] writedata,
	output reg [15:0] readdata
	
);

	reg [15:0] mem1, mem2, mem3;		// To hold the Data
	//reg [15:0] mem4, mem5, mem6;
	
	always @ ( posedge clk or negedge reset_n )
	begin
		if ( reset_n == 1'b0 )
		begin
			mem1 <= 15'b0;
			mem2 <= 15'b0;
			mem3 <= 15'b0;
			readdata <= 15'b0;
		end
		else if ( chipselect && write )
		begin
			case ( address )
				0 			: mem1 <= writedata;
				1 			: mem2 <= writedata;
				2 			: mem3 <= writedata;
			endcase
		end
		else if ( chipselect && read )
		begin
			case ( address )
				0 : readdata <= mem1;
				1 : readdata <= mem2;
				2 : readdata <= mem3;
			endcase
		end
		else
		begin
			mem1 <= mem1;
			mem2 <= mem2;
			mem3 <= mem3;
			readdata <= 15'b0;
		end
	end
	
	
	  blk_mem_gen_0 memweights (
      .clka(clk),    // input wire clka
     // .ena(bias_weights_bram_ena),      // input wire ena
      //.wea(bias_weights_bram_wea),      // input wire [0 : 0] wea
      //.addra(bias_weights_bram_addra),  // input wire [18 : 0] addra
      //.dina(bias_weights_bram_dina),    // input wire [`DATA_SIZE - 1 : 0] dina
      .douta(mem1)  // output wire [`DATA_SIZE - 1 : 0] douta
    );
    
    blk_mem_gen_1 memresult (
      .clka(clk),    // input wire clka
     // .ena(result_bram_ena),      // input wire ena
      //.wea(result_bram_wea),      // input wire [0 : 0] wea
      //.addra(result_bram_addra),  // input wire [12 : 0] addra
     // .dina(result_bram_dina),    // input wire [`DATA_SIZE - 1 : 0] dina
      .douta(mem2)  // output wire [`DATA_SIZE - 1 : 0] douta
    );
    
    blk_mem_gen_2 meminput (
      .clka(clk),    // input wire clka
     // .ena(input_bram_ena),      // input wire ena
      //.wea(input_bram_wea),      // input wire [0 : 0] wea
      //.addra(input_bram_addra),  // input wire [12 : 0] addra
      //.dina(input_bram_dina),    // input wire [`DATA_SIZE - 1 : 0] dina
      .douta(mem3)  // output wire [`DATA_SIZE - 1 : 0] douta
    );
endmodule 
