`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 20:48:31
// Design Name: 
// Module Name: dff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module dff (
  input d, clk,
  output reg q
);
  always @(posedge clk)
    q <= d;
endmodule

// Dataflow Modelling //
/* module DFF_dataflow (
  input d, clk,
  output q
);
  assign q = (clk) ? d : q;
endmodule */

//Gatelevel Modelling //
/*module DFF_structural (
  input d, clk,
  output q, qb
);
  wire n1, n2;
  nand (n1, d, clk);
  nand (n2, ~d, clk);
  nand (q, n1, qb);
  nand (qb, n2, q);
endmodule */