`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 21:24:56
// Design Name: 
// Module Name: tff
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
module tff(
input t,clk,
output reg q
    );
 initial q = 1'b0;
    always @(posedge clk)begin
        if(t) 
            q <= ~q; 
        else
            q <= q;
       
    end
endmodule

//Dataflow Modelling //
/* module tff(input t,clk,
            output reg q)
            assign q <= (t & clk) ? ~q : q;
            endmodule */
            
// Gatelevel Modelling //
/* module tff (
  input t, clk,
  output q, qb
);
  wire j, k;
  assign j = t;
  assign k = t;
 
  wire s, r;
  nand (s, j, clk, qb);
  nand (r, k, clk, q);
  nand (q, s, qb);
  nand (qb, r, q);
endmodule  */