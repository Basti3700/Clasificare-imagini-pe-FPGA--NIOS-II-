`timescale 1ns / 1ps


module blk_mem_gen_0(clka, ena, wea, addra, dina, douta);
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[15:0],dina[15:0],douta[15:0]" */
  input clka;
  input ena;
  input [0:0]wea;
  input [15:0]addra;
  input [15:0]dina;
  output [15:0]douta;
endmodule

