`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 10:16:35
// Design Name: 
// Module Name: fa
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

module fa(input a, b, cin, output reg sum, cout);
  always @ (a, b, cin) begin
    sum   = a ^ b ^ cin;
    cout = (a & b) | (b & cin) | (a & cin);
  end
endmodule

//Dataflow Modelling //
/* 
module fa(
  input a, b, cin,
  output sum, cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule */

//Gate level modelling //
/* module full_adder_gate(input A, B, Cin, output Sum, Carry);
  wire s1, c1, c2;
  xor (s1, A, B);
  xor (Sum, s1, Cin);
  and (c1, A, B);
  and (c2, s1, Cin);
  or  (Carry, c1, c2);
endmodule */

