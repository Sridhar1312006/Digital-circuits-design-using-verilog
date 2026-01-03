`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 17:27:50
// Design Name: 
// Module Name: demux
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
module demux (
  input din,
  input [1:0] sel,
  output reg y0, y1, y2, y3
);
  always @(*) begin
    y0 = 0; y1 = 0; y2 = 0; y3 = 0;

    case (sel)
      2'b00: y0 = din;
      2'b01: y1 = din;
      2'b10: y2 = din;
      2'b11: y3 = din;
    endcase
  end
endmodule

//Dataflow Modelling //
/* module demux1to4_dataflow (
  input din,
  input [1:0] sel,
  output y0, y1, y2, y3
);
  assign y0 = (~sel[1] & ~sel[0]) ? din : 0;
  assign y1 = (~sel[1] &  sel[0]) ? din : 0;
  assign y2 = ( sel[1] & ~sel[0]) ? din : 0;
  assign y3 = ( sel[1] &  sel[0]) ? din : 0;
endmodule */

//Gate level Modelling //
/* module demux1to4_gate (
  input din,
  input [1:0] sel,
  output y0, y1, y2, y3
);
  wire s0n, s1n;

  not (s0n, sel[0]);
  not (s1n, sel[1]);

  and (y0, din, s0n, s1n);   
  and (y1, din, sel[0], s1n); 
  and (y2, din, s0n, sel[1]); 
  and (y3, din, sel[0], sel[1]); 
endmodule */