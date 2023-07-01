`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// 
// Design Name: 
// Module Name: relu_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define DATA_SIZE 16

module relu_1(
    din, dout
    );
    input [`DATA_SIZE-1:0] din;
    output [`DATA_SIZE-1:0] dout;
    
    assign dout = (din[`DATA_SIZE-1] == 1'b1) ? 16'b0 : din;
endmodule
