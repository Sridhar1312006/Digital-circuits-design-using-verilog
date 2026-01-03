`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 10:45:47
// Design Name: 
// Module Name: fs
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
module fs(input a, b, bin, output reg diff, borrow);
  always @ (*) begin
    diff   = a ^ b ^ bin;
    borrow = (~a & bin) | (b & ~bin) | (~a & b);
  end
endmodule

//Dataflow Modelling //
/* module fs(input a, b, bin, output diff, borrow);
  assign diff   = a ^ b ^ bin;
  assign borrow = (~a & b) | (~a & bin) | (b & bin);
endmodule */

//Gate level Modelling //
/* module fs(input a, b, bin, output diff, borrow);
  wire d1, b1, b2, b3;

  // Difference
  xor (d1, a, b);
  xor (diff, d1, bin);

  // Borrow
  and (b1, ~a, b);
  and (b2, ~a, bin);
  and (b3, b, bin);
  or  (borrow, b1, b2, b3);
endmodule */