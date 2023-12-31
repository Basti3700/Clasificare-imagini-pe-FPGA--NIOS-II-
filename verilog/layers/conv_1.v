`timescale 1ns / 1ps

`define INPUT_NODE 1024
`define IMAGE_SIZE 32
`define NUM_CHANNELS 1
`define CONV1_DEEP 6
`define CONV1_SIZE 5
`define CONV1_OUTPUT 28
`define DATA_SIZE 16

module conv_1(
    clk, rst, conv_1_en, bias_weights_bram_douta, input_bram_douta, graph,
    bias_weights_bram_ena, bias_weights_bram_addra,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    input_bram_ena, input_bram_addra,
    conv_1_finish
    );
    input clk;
    input rst;
    input conv_1_en;
    input [`DATA_SIZE-1:0] bias_weights_bram_douta;
    input [`DATA_SIZE-1:0] input_bram_douta;
    input [4:0] graph;
    output reg bias_weights_bram_ena;
    output reg [15:0] bias_weights_bram_addra;
    output reg result_bram_ena;
    output reg result_bram_wea;
    output reg [12:0] result_bram_addra;
    output reg [`DATA_SIZE-1:0] result_bram_dina;
    output reg input_bram_ena;
    output reg [13:0] input_bram_addra;
    output reg conv_1_finish;
    
    // Variables for loop control
    integer filter = 0,
            channel = 0,
            row = 0,
            column = 0,
            count = 0;
    
    // Internal registers and wires
    reg [`DATA_SIZE*`CONV1_SIZE*`CONV1_SIZE-1:0] matrix1;
    reg [`DATA_SIZE*`CONV1_SIZE*`CONV1_SIZE-1:0] matrix2;
    reg [`DATA_SIZE-1:0] bias;
    wire [`DATA_SIZE-1:0] dout;
    reg [`DATA_SIZE-1:0] result;
    wire [`DATA_SIZE-1:0] relu_result;
    
    // Instantiating submodules
    multi_add conv_1_ma(
        .matrix1(matrix1),
        .matrix2(matrix2),
        .bias(bias),
        .dout(dout)
    );
    relu_1 ma_relu(
        .din(result),
        .dout(relu_result)
    );
    
    // State machine states
    reg [6:0] state;
    
    parameter S_IDLE          = 7'b1000000,
              S_CHECK         = 7'b0100000,
              S_LOAD_WEIGHTS  = 7'b0010000,
              S_LOAD_BIAS     = 7'b0001000,
              S_LOAD_DATA     = 7'b0000100,
              S_CONVOLUTE     = 7'b0000010,
              S_STORE_RESULT  = 7'b0000001;
    
    // Variables for loop control and addressing
    integer data_begin = 0;
    integer circle = 0;
    
    // Base addresses for weight, bias, and result memories
    parameter conv1_weights_base = 0,
              conv1_bias_base = 150,
              conv1_result_base = 0;
    
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            bias_weights_bram_ena <= 1'b0;
            result_bram_ena <= 1'b0;
            result_bram_wea <= 1'b0;
            input_bram_ena <= 1'b0;
        end
        else
        begin
            if(conv_1_en == 1'b1)
            begin
                case(state)
                    S_IDLE:
                    begin
                        // Initialization for a new convolution operation
                        filter <= 0;
                        channel <= 0;
                        row <= 0;
                        column <= 0;
                        matrix1 <= 0;
                        matrix2 <= 0;
                        bias <= 0;
                        result <= 0;
                        conv_1_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        // Check if the current convolution operation is complete
                        if((filter * `NUM_CHANNELS + channel) == `CONV1_DEEP * `NUM_CHANNELS)
                        begin
                            // All convolutions are complete
                            bias_weights_bram_ena <= 1'b0;
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            input_bram_ena <= 1'b0;
                            conv_1_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            // Start loading weights
                            circle <= 0;
                            count <= 0;
                            result <= 0;
                            state <= S_LOAD_WEIGHTS;
                        end
                    end
                    S_LOAD_WEIGHTS:
                    begin
                        // Load convolution weights
                        if(count < `CONV1_SIZE*`CONV1_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                // Enable weight memory read and set address
                                bias_weights_bram_ena <= 1'b1;
                                bias_weights_bram_addra <= conv1_weights_base + count + (filter * `NUM_CHANNELS + channel) * `CONV1_SIZE*`CONV1_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                // Load weight values into matrix2
                                data_begin = `DATA_SIZE * (`CONV1_SIZE * `CONV1_SIZE - count) - 1;
                                matrix2[data_begin-:`DATA_SIZE] <= bias_weights_bram_douta;
                                count <= count + 1;
                                circle <= 0;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            // Finished loading weights, move to loading bias
                            circle <= 0;
                            count <= 0;
                            bias_weights_bram_ena <= 1'b0;
                            state <= S_LOAD_BIAS;
                        end
                    end
                    S_LOAD_BIAS:
                    begin
                        // Load bias values
                        if(circle == 0)
                        begin
                            // Enable bias memory read and set address
                            bias_weights_bram_ena <= 1'b1;
                            bias_weights_bram_addra <= conv1_bias_base + filter;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            // Load bias value into bias register
                            bias <= bias_weights_bram_douta;
                            circle <= 0;
                            bias_weights_bram_ena <= 1'b0;
                            state <= S_LOAD_DATA;
                        end
                        else
                        begin
                            circle <= circle + 1;
                        end
                    end
                    S_LOAD_DATA:
                    begin
                        // Load input data
                        if(count < `CONV1_SIZE * `CONV1_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                // Enable input memory read and set address
                                input_bram_ena <= 1'b1;
                                input_bram_addra <= graph * `INPUT_NODE + (row + count / `CONV1_SIZE) * `IMAGE_SIZE + column + count % `CONV1_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                // Load input data values into matrix1
                                data_begin = `DATA_SIZE * (`CONV1_SIZE * `CONV1_SIZE - count) - 1;
                                matrix1[data_begin-:`DATA_SIZE] <= input_bram_douta;
                                count <= count + 1;
                                circle <= 0;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            // Finished loading input data, move to convolution
                            circle <= 0;
                            count <= 0;
                            input_bram_ena <= 1'b0;
                            state <= S_CONVOLUTE;
                        end
                    end
                    S_CONVOLUTE:
                    begin
                        // Perform convolution operation
                        result <= result + dout;
                        circle <= 0;
                        if(channel == `NUM_CHANNELS - 1)
                        begin
                            // Finished convolutions for the current channel
                            channel <= (channel + 1) % `NUM_CHANNELS;
                            state <= S_STORE_RESULT;
                        end
                        else
                        begin
                            // Move to loading weights for the next channel
                            state <= S_LOAD_WEIGHTS;
                            channel <= (channel + 1) % `NUM_CHANNELS;
                        end
                    end
                    S_STORE_RESULT:
                    begin
                        // Store the result of the convolution
                        if(circle == 0)
                        begin
                            // Enable result memory write and set address and data
                            result_bram_ena <= 1'b1;
                            result_bram_wea <= 1'b1;
                            result_bram_addra <= conv1_result_base + filter * `CONV1_OUTPUT * `CONV1_OUTPUT + row * `CONV1_OUTPUT + column;
                            result_bram_dina <= relu_result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            // Disable result memory write and move to the next position
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == `CONV1_OUTPUT - 1)
                            begin
                                if(row == `CONV1_OUTPUT - 1)
                                begin
                                    // Finished all convolutions for the current filter
                                    filter <= filter + 1;
                                end
                                row <= (row + 1) % `CONV1_OUTPUT;
                            end
                            column <= (column + 1) % `CONV1_OUTPUT;
                            state <= S_CHECK;
                        end
                        else
                        begin
                            circle <= circle + 1;
                        end
                    end
                    default:
                    begin
                        // Default case, return to idle state and disable all memory accesses
                        state <= S_IDLE;
                        bias_weights_bram_ena <= 1'b0;
                        result_bram_ena <= 1'b0;
                        result_bram_wea <= 1'b0;
                        input_bram_ena <= 1'b0;
                    end
                endcase
            end
        end
    end
    
endmodule