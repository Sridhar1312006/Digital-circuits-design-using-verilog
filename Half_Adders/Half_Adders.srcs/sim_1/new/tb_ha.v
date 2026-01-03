`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 09:37:29
// Design Name: 
// Module Name: tb_ha
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

module tb_ha;
  reg a, b;
  wire sum, carry;

  ha uut(.a(a), .b(b), .sum(sum), .carry(carry));

  initial begin
    $monitor("A = %b  B = %b  | SUM = %b CARRY = %b", a, b, sum, carry);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    $finish;
  end
endmodule

