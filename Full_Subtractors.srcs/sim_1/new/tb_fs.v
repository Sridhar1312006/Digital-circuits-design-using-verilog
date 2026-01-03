`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 10:46:21
// Design Name: 
// Module Name: tb_fs
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

module tb_fs;
  reg a, b, bin;
  wire diff, borrow;

  fs uut(.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));

  initial begin
    $display("A = %b B = %b Bin = %b | Diff = %b Borrow = %b ",a,b,bin,diff,borrow);
    a=0; b=0; bin=0; #10;
    a=0; b=1; bin=0; #10;
    a=1; b=0; bin=0; #10;
    a=1; b=1; bin=0; #10;
    a=0; b=0; bin=1; #10;
    a=0; b=1; bin=1; #10;
    a=1; b=0; bin=1; #10;
    a=1; b=1; bin=1; #10;
    $finish;
  end
endmodule
