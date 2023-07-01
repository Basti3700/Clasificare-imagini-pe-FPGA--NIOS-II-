module data_nios (
	input address,
	input chipselect,
	input clk,
	input read,
	input reset_n,
	input write,
	input [7:0] writedata,
	output reg [7:0] readdata
	
);
wire mem;

	reg [4:0] mem1;		// To hold the Data
	//reg [15:0] mem4, mem5, mem6;
	
	always @ ( posedge clk or negedge reset_n )
	begin
		if ( reset_n == 1'b0 )
		begin
			mem1 <= 5'b0;
			
			readdata <= 8'b0;
		end
		else if ( chipselect && write )
		begin
			case ( address )
				0 			: mem1 <= writedata[4:0];
				1 			: mem1 <= 5'b1;
				
			endcase
		end
		else if ( chipselect && read )
		begin
			case ( address )
				0 : readdata <= mem1;
				1 : readdata <= mem1;
				
			endcase
		end
		else
		begin
			mem1 <= mem1;
			
			readdata <= 8'b0;
		end
	end
	
	
	
	 // blk_mem_gen_0 memweights (
      //.clka(clk),    // input wire clka
     // .ena(bias_weights_bram_ena),      // input wire ena
      //.wea(bias_weights_bram_wea),      // input wire [0 : 0] wea
      //.addra(bias_weights_bram_addra),  // input wire [18 : 0] addra
      //.dina(bias_weights_bram_dina),    // input wire [`DATA_SIZE - 1 : 0] dina
     // .douta(mem1)  // output wire [`DATA_SIZE - 1 : 0] douta
    //);
    
  //  blk_mem_gen_1 memresult (
     // .clka(clk),    // input wire clka
     // .ena(result_bram_ena),      // input wire ena
      //.wea(result_bram_wea),      // input wire [0 : 0] wea
      //.addra(result_bram_addra),  // input wire [12 : 0] addra
     // .dina(result_bram_dina),    // input wire [`DATA_SIZE - 1 : 0] dina
   //   .douta(mem2)  // output wire [`DATA_SIZE - 1 : 0] douta
    //);
    
   // blk_mem_gen_2 meminput (
     // .clka(clk),    // input wire clka
     // .ena(input_bram_ena),      // input wire ena
      //.wea(input_bram_wea),      // input wire [0 : 0] wea
      //.addra(input_bram_addra),  // input wire [12 : 0] addra
      //.dina(input_bram_dina),    // input wire [`DATA_SIZE - 1 : 0] dina
     // .douta(mem3)  // output wire [`DATA_SIZE - 1 : 0] douta
    //);
endmodule 