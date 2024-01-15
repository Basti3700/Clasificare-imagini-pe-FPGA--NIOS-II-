`timescale 1ns / 1ps

`define DATA_SIZE 16 

module max_pool(
    din, dout
    );
    input [4*`DATA_SIZE-1:0] din;
    output [`DATA_SIZE-1:0] dout;
    
    wire [`DATA_SIZE-1:0] max_1;
    wire [`DATA_SIZE-1:0] max_2;
    
    assign max_1 = ((din[4*`DATA_SIZE-1] == 1'b1) && (din[3*`DATA_SIZE-1] == 1'b0) || ((din[4*`DATA_SIZE-1] == din[3*`DATA_SIZE-1]) && (din[4*`DATA_SIZE-1:3*`DATA_SIZE] < din[3*`DATA_SIZE-1:2*`DATA_SIZE]))) ? din[3*`DATA_SIZE-1:2*`DATA_SIZE] : din[4*`DATA_SIZE-1:3*`DATA_SIZE];
    
    assign max_2 = ((max_1[`DATA_SIZE-1] == 1'b1) && (din[2*`DATA_SIZE-1] == 1'b0) || ((max_1[`DATA_SIZE-1] == din[2*`DATA_SIZE-1]) && (max_1 < din[2*`DATA_SIZE-1:`DATA_SIZE]))) ? din[2*`DATA_SIZE-1:`DATA_SIZE] : max_1;
    
    assign dout = ((max_2[`DATA_SIZE-1] == 1'b1) && (din[`DATA_SIZE-1] == 1'b0) || ((max_2[`DATA_SIZE-1] == din[`DATA_SIZE-1]) && (max_2 < din[`DATA_SIZE-1:0]))) ? din[`DATA_SIZE-1:0] : max_2;
    
endmodule
