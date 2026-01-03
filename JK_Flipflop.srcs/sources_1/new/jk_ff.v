`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 07:41:47
// Design Name: 
// Module Name: jk_ff
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
module jk_ff(
    input j, k, clk, reset,
    output reg q
);
  always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else 
        q <= (~j & ~k) ? q :
             (~j & k)  ? 1'b0 :
             (j & ~k)  ? 1'b1 :
                         ~q;
  end
endmodule

//Behavioral Modelling//
/* module JKFF_behavioral (
  input j, k, clk,
  output reg q
);
  always @(posedge clk) begin
    case ({j,k})
      2'b00: q <= q;       // hold
      2'b01: q <= 0;       // reset
      2'b10: q <= 1;       // set
      2'b11: q <= ~q;      // toggle
    endcase
  end
endmodule */

//Gate level Modelling //
/* module JKFF_structural (
  input j, k, clk,
  output q, qb
);
  wire s, r;
  nand (s, j, clk, qb);
  nand (r, k, clk, q);
  nand (q, s, qb);
  nand (qb, r, q);
endmodule */