// ipselector_ipselector.v

// This file was auto-generated from altera_nios2_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 22.1 915

`timescale 1 ps / 1 ps
module ipselector_ipselector (
		input  wire        clk,                                 //                       clk.clk
		input  wire        reset_n,                             //                     reset.reset_n
		input  wire        reset_req,                           //                          .reset_req
		output wire [17:0] d_address,                           //               data_master.address
		output wire [3:0]  d_byteenable,                        //                          .byteenable
		output wire        d_read,                              //                          .read
		input  wire [31:0] d_readdata,                          //                          .readdata
		input  wire        d_waitrequest,                       //                          .waitrequest
		output wire        d_write,                             //                          .write
		output wire [31:0] d_writedata,                         //                          .writedata
		output wire        debug_mem_slave_debugaccess_to_roms, //                          .debugaccess
		output wire [17:0] i_address,                           //        instruction_master.address
		output wire        i_read,                              //                          .read
		input  wire [31:0] i_readdata,                          //                          .readdata
		input  wire        i_waitrequest,                       //                          .waitrequest
		input  wire [31:0] irq,                                 //                       irq.irq
		output wire        debug_reset_request,                 //       debug_reset_request.reset
		input  wire [8:0]  debug_mem_slave_address,             //           debug_mem_slave.address
		input  wire [3:0]  debug_mem_slave_byteenable,          //                          .byteenable
		input  wire        debug_mem_slave_debugaccess,         //                          .debugaccess
		input  wire        debug_mem_slave_read,                //                          .read
		output wire [31:0] debug_mem_slave_readdata,            //                          .readdata
		output wire        debug_mem_slave_waitrequest,         //                          .waitrequest
		input  wire        debug_mem_slave_write,               //                          .write
		input  wire [31:0] debug_mem_slave_writedata,           //                          .writedata
		output wire        dummy_ci_port                        // custom_instruction_master.readra
	);

	ipselector_ipselector_cpu cpu (
		.clk                                 (clk),                                 //                       clk.clk
		.reset_n                             (reset_n),                             //                     reset.reset_n
		.reset_req                           (reset_req),                           //                          .reset_req
		.d_address                           (d_address),                           //               data_master.address
		.d_byteenable                        (d_byteenable),                        //                          .byteenable
		.d_read                              (d_read),                              //                          .read
		.d_readdata                          (d_readdata),                          //                          .readdata
		.d_waitrequest                       (d_waitrequest),                       //                          .waitrequest
		.d_write                             (d_write),                             //                          .write
		.d_writedata                         (d_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (debug_mem_slave_debugaccess_to_roms), //                          .debugaccess
		.i_address                           (i_address),                           //        instruction_master.address
		.i_read                              (i_read),                              //                          .read
		.i_readdata                          (i_readdata),                          //                          .readdata
		.i_waitrequest                       (i_waitrequest),                       //                          .waitrequest
		.irq                                 (irq),                                 //                       irq.irq
		.debug_reset_request                 (debug_reset_request),                 //       debug_reset_request.reset
		.debug_mem_slave_address             (debug_mem_slave_address),             //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (debug_mem_slave_byteenable),          //                          .byteenable
		.debug_mem_slave_debugaccess         (debug_mem_slave_debugaccess),         //                          .debugaccess
		.debug_mem_slave_read                (debug_mem_slave_read),                //                          .read
		.debug_mem_slave_readdata            (debug_mem_slave_readdata),            //                          .readdata
		.debug_mem_slave_waitrequest         (debug_mem_slave_waitrequest),         //                          .waitrequest
		.debug_mem_slave_write               (debug_mem_slave_write),               //                          .write
		.debug_mem_slave_writedata           (debug_mem_slave_writedata),           //                          .writedata
		.dummy_ci_port                       (dummy_ci_port)                        // custom_instruction_master.readra
	);

endmodule
