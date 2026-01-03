`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 08:15:38
// Design Name: 
// Module Name: sr_ff
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


module sr_ff(
    input s,r,clk,
    output reg q
    );
  always @(posedge clk) begin
    case({s,r})
        2'b00 : q <= q;
        2'b01 : q <= 1'b0;
        2'b10 : q <= 1'b1;
        2'b11 : q <= 1'bx;
    endcase
  end
endmodule

// Dataflow Modelling //
/* module SRFF_dataflow (
  input s, r, clk,
  output q
);
  assign q = (s & clk) ? 1 :
             (r & clk) ? 0 : q;
endmodule */

//Gate level Modelling //
/* module SRFF_structural (
  input s, r, clk,
  output q, qb
);
  wire n1, n2;
  nand (n1, s, clk, qb);
  nand (n2, r, clk, q);
  nand (q, n1, qb);
  nand (qb, n2, q);
endmodule */