module tops (
input clk,
input [1:0] address,
input chipselect,
input reset_n,
input write,
//input read,
input [7:0] writedata,


//output logic [7:0] an,
output logic [7:0] dataread
//output logic lenet_finish,
//output logic c1_finish,
//output logic c2_finish,
//output logic c3_finish,
//output logic f4_finish,
//output logic f5_finish
//output logic [2:0] led_rgb
);
//logic [7:0] resultt;
logic [3:0] max_index_p;
logic [3:0] x7seg_data;
//logic [1:0] right;
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
		//else if ( chipselect && read )
	//	begin
		//	case ( address )
			//	0 :  dataread <=  graph;
			//	1 :  dataread <=  dataread;
				//2 :  a_to_g <=  rst;
				
			//endcase
		//end
		else
		begin
			graph <= graph;
			start <= start;
			//rst   <= rst;
			//dataread <=  dataread;
			
		end
	end
//logic [2:0] led_rgb;


lenet_top lenet_top(
    .clk(clk),
    .rst(~start),
    .start(start),
    .graph(graph),
    //.lenet_finish(lenet_finish),
    .max_index(max_index_p),
    .result()
    //.c1_finish(c1_finish),
    //.c2_finish(c2_finish),
    //.c3_finish(c3_finish),
    //.f4_finish(f4_finish),
    //.f5_finish(f5_finish),
   // .right(right)
);

//x7seg_dec x7seg_dec(
 //   .D(x7seg_data),
 //   .a_to_g(resultt)
// );

x7seg_scan x7seg_scan(
    .sys_clk(clk),
    .sys_rst_n(~start),
    .graph(graph),
    .max_index(max_index_p),
    .x7seg_data(x7seg_data)
   // .an(an)
);



//assign led_rgb[0] = (right == 2'b00) ? 1 : 0;
//assign led_rgb[1] = (right == 2'b01) ? 1 : 0;
//assign led_rgb[2] = (right == 2'b10) ? 1 : 0;


endmodule