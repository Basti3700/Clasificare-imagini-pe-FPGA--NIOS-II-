`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// 
// Design Name: 
// Module Name: multi_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define LENGTH 5
`define WIDTH 5
`define DATA_SIZE 16

module multi_add(
    matrix1, matrix2, bias, dout
    );
    // Inputs
    input signed [`DATA_SIZE*`LENGTH*`WIDTH-1:0] matrix1;
    input signed [`DATA_SIZE*`LENGTH*`WIDTH-1:0] matrix2;
    input signed[`DATA_SIZE-1:0] bias;

    // Output
    output [`DATA_SIZE-1:0] dout;
    
    // Internal registers and wires
    reg [2*`DATA_SIZE-1:0] temp;
    reg sign;
    reg signed [`DATA_SIZE-1:0] item1;
    reg signed [`DATA_SIZE-1:0] item2;
    reg signed [2*(`DATA_SIZE-1)-1:0] midvalue;
    reg [`DATA_SIZE-1:0] result;

    integer i = 0;
    integer data_begin = 0;
    
    // Assigning the output
    assign dout = result;
    
    // Combinational logic
    always@(*)
    begin
        // Initializing registers and wires
        temp = 16'b0;
        sign = 1'b0;
        item1 = 16'b0;
        item2 = 16'b0;
        midvalue = 16'b0;

        // Iterating over the matrices
        for(i = 0; i < `LENGTH*`WIDTH; i = i + 1)
        begin
            // Determining the starting index for the current data chunk
            data_begin = `DATA_SIZE * (`LENGTH * `WIDTH - i) - 1;

            // Extracting data from matrix1 and matrix2
            item1 = matrix1[data_begin-:`DATA_SIZE];
            item2 = matrix2[data_begin-:`DATA_SIZE];

            // Checking for unknown values (all 'x')
            // and replacing them with zeros
            if (item1 === 16'bxxxxxxxxxxxxxxxx)
                item1 = 0;
            if (item2 === 16'bxxxxxxxxxxxxxxxx)
                item2 = 0;

            // Performing multiplication and shifting right by 8 bits
            midvalue = ({{8{item1[`DATA_SIZE-1]}},item1[`DATA_SIZE-1:0]} * {{8{item2[`DATA_SIZE-1]}},item2[`DATA_SIZE-1:0]}) >>> 8;

            // Accumulating intermediate results
            temp = temp + midvalue;
        end

        // Adding bias to the accumulated result
        result = temp + bias;
    end
endmodule
