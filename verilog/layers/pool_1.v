`timescale 1ns / 1ps


// Definition of parameters and macros
`define CONV1_DEEP 6         // Number of channels in the first convolutional layer
`define POOL1_INPUT 28       // Input size for the first pooling layer
`define POOL1_OUTPUT 14      // Output size for the first pooling layer
`define POOL1_SIZE 2         // Pooling size for the first pooling layer
`define DATA_SIZE 16         // Size of data in bits

// Module for the first pooling layer
module pool_1(
    clk, rst, pool_1_en, result_bram_douta,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    pool_1_finish
    );
    input clk;                                // Clock signal
    input rst;                                // Reset signal
    input pool_1_en;                          // Enable signal for the first pooling layer
    input [`DATA_SIZE-1:0] result_bram_douta; // Data output from result BRAM
    output reg result_bram_ena;               // Enable signal for result BRAM
    output reg result_bram_wea;               // Write enable signal for result BRAM
    output reg [12:0] result_bram_addra;       // Address signal for result BRAM
    output reg [`DATA_SIZE-1:0] result_bram_dina; // Data input for result BRAM
    output reg pool_1_finish;                  // Finish signal for the first pooling layer
    
    reg [4*`DATA_SIZE-1:0] din;                 // Input data
    wire [`DATA_SIZE-1:0] dout;                 // Output data from the max pooling operation
    
    reg [`DATA_SIZE-1:0] result;                // Result data
    
    // Instantiate the max pooling module
    max_pool pool_1_mp(
        .din(din),
        .dout(dout)
    );
    
    reg [4:0] state;                             // State variable
    
    // State parameters
    parameter S_IDLE         = 5'b10000,
              S_CHECK        = 5'b01000,
              S_LOAD_DATA    = 5'b00100,
              S_POOLING      = 5'b00010,
              S_STORE_RESULT = 5'b00001;
              
    // Variables for counting and addressing
    integer count = 0,
            circle = 0,
            channel = 0,
            row = 0,
            column = 0,
            data_begin = 0;
            
    // Base addresses for result BRAMs
    parameter conv1_result_base = 0,
              pool1_result_base = 4704;
    
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            // Reset conditions
            state <= S_IDLE;
            result_bram_ena <= 1'b0;
            result_bram_wea <= 1'b0;
        end
        else
        begin
            if(pool_1_en == 1'b1)
            begin
                case(state)
                    S_IDLE:
                    begin
                        // Initialization for a new pooling operation
                        channel <= 0;
                        circle <= 0;
                        row <= 0;
                        column <= 0;
                        din <= 0;
                        result <= 0;
                        pool_1_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        // Check if all pooling operations are complete
                        if(channel == `CONV1_DEEP)
                        begin
                            // Finish conditions
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            pool_1_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            // Move to loading data for pooling
                            circle <= 0;
                            count <= 0;
                            state <= S_LOAD_DATA;
                        end
                    end
                    S_LOAD_DATA:
                    begin
                        // Load data for pooling
                        if(count < `POOL1_SIZE * `POOL1_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                // Enable result BRAM read and set address
                                result_bram_ena <= 1'b1;
                                result_bram_addra <= conv1_result_base + channel * `POOL1_INPUT * `POOL1_INPUT + (2 * row + (count / `POOL1_SIZE)) * `POOL1_INPUT + 2 * column + count % `POOL1_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                // Load data into input
                                data_begin = `DATA_SIZE * (`POOL1_SIZE * `POOL1_SIZE - count) - 1;
                                din[data_begin-:`DATA_SIZE] <= result_bram_douta;
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
                            // Finished loading data, move to pooling
                            circle <= 0;
                            count <= 0;
                            result_bram_ena <= 1'b0;
                            state <= S_POOLING;
                        end
                    end
                    S_POOLING:
                    begin
                        // Perform pooling operation
                        result <= dout;
                        circle <= 0;
                        state <= S_STORE_RESULT;
                    end
                    S_STORE_RESULT:
                    begin
                        // Store the result of pooling
                        if(circle == 0)
                        begin
                            // Enable result BRAM write and set address and data
                            result_bram_ena <= 1'b1;
                            result_bram_wea <= 1'b1;
                            result_bram_addra <= pool1_result_base + channel * `POOL1_OUTPUT * `POOL1_OUTPUT + row * `POOL1_OUTPUT + column;
                            result_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            // Disable result BRAM write and move to the next position
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == `POOL1_OUTPUT - 1)
                            begin
                                if(row == `POOL1_OUTPUT - 1)
                                begin
                                    // Move to the next channel
                                    channel <= channel + 1;
                                end
                                row <= (row + 1) % `POOL1_OUTPUT;
                            end
                            column <= (column + 1) % `POOL1_OUTPUT;
                            state <= S_CHECK;
                        end
                        else
                        begin
                            circle <= circle + 1;
                        end
                    end
                    default:
                    begin
                        // Default case, return to idle state and disable result BRAM access
                        state <= S_IDLE;
                        result_bram_ena <= 1'b0;
                        result_bram_wea <= 1'b0;
                    end
                endcase
            end
        end
    end
    
endmodule
