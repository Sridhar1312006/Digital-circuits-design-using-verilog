`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 10:20:47
// Design Name: 
// Module Name: tb_fa
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
module tb_fa;
  reg a, b, cin;
  wire sum, cout;

  fa uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    $display("A = %b B = %b Cin = %b | SUM = %b COUT = %b ",a,b,cin,sum,cout);
    a=0; b=0; cin=0; #10;
    a=0; b=1; cin=0; #10;
    a=1; b=0; cin=0; #10;
    a=1; b=1; cin=0; #10;
    a=0; b=0; cin=1; #10;
    a=0; b=1; cin=1; #10;
    a=1; b=0; cin=1; #10;
    a=1; b=1; cin=1; #10;
    $finish;
  end
endmodule

