`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 17:01:41
// Design Name: 
// Module Name: mux
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
module mux (
  input a, b, c, d,       
  input [1:0] sel,       
  output reg y            
);
  always @(*) begin
    case (sel)
      2'b00: y = a;
      2'b01: y = b;
      2'b10: y = c;
      2'b11: y = d;
    endcase
  end
endmodule

//Dataflow Modelling //
/* module MUX_dataflow (
  input a, b, c, d,
  input [1:0] sel,
  output y
);
  assign y = (sel == 2'b00) ? a :
             (sel == 2'b01) ? b :
             (sel == 2'b10) ? c :
                              d;
endmodule  */

//Gate level Modelling //
/* module MUX_gate (
  input a, b, c, d,
  input [1:0] sel,
  output y
);
  wire s0n, s1n;
  wire a1, b1, c1, d1;

  not (s0n, sel[0]);
  not (s1n, sel[1]);

  and (a1, a, s0n, s1n);
  and (b1, b, sel[0], s1n);
  and (c1, c, s0n, sel[1]);
  and (d1, d, sel[0], sel[1]);

  or  (y, a1, b1, c1, d1);
endmodule */
