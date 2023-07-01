module tops (
input clk,
input [1:0] address,
input chipselect,
input reset_n,
input write,
//input read,
input [7:0] writedata,
output logic [7:0] dataread
);
//logic [7:0] resultt;
logic [3:0] max_index_p;
logic [3:0] x7seg_data;
logic       start;
logic [4:0] graph;
//logic 		rst;

x7seg_dec x7seg_dec(
    .D(x7seg_data),
    .a_to_g(dataread)
);	
	always @ ( posedge clk or negedge reset_n )
	begin
	//rst <= ~start;
		if ( reset_n == 1'b0 )
		begin
			graph <= 5'b0;
			start <= 1'b0;
			//rst	  <= 1'b1;
			//dataread <= 8'b0;
		end
		else if ( chipselect && write )
		begin
			case ( address )
				0 			: graph <= writedata[4:0];
				1 			: start <= writedata[0];
				//2			: rst   <= writedata[0];
				
			endcase
		end

		else
		begin
			graph <= graph;
			start <= start;
			//rst   <= rst;
			//dataread <=  dataread;
			
		end
	end

lenet_top lenet_top(
    .clk(clk),
    .rst(~start),
    .start(start),
    .graph(graph),
    //.lenet_finish(lenet_finish),
    .max_index(max_index_p),
    .result()
);

x7seg_scan x7seg_scan(
    .sys_clk(clk),
    .sys_rst_n(~start),
    .graph(graph),
    .max_index(max_index_p),
    .x7seg_data(x7seg_data)
  
);
endmodule