`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 10:02:32
// Design Name: 
// Module Name: tb_hs
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
module tb_hs;
  reg a, b;
  wire diff, borrow;

  hs uut(.a(a), .b(b), .diff(diff), .borrow(borrow));

  initial begin
    $monitor("A = %b  B = %b  | Diff = %b Borrow = %b", a, b, diff, borrow);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    $finish;
  end
endmodule

