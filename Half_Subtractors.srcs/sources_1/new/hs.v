`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 09:59:03
// Design Name: 
// Module Name: hs
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

module hs(input a, b, output reg diff, borrow);
  always @ (*) begin
    diff   = a ^ b;
    borrow = (~a) & b;
  end
endmodule

//Dataflow Modelling //
/*  module hs(input a, b, output diff, borrow);
  assign diff   = a ^ b;
  assign borrow = (~ab) & b;
endmodule  */

//Gatelevel Modelling //
/* module hs(input a, b, output diff, borrow);
  xor (diff, a, b);
  not (Na, a);
  and (borrow, Na, b);
endmodule */