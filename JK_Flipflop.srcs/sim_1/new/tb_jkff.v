`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 07:50:50
// Design Name: 
// Module Name: tb_jkff
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
module tb_jkff;
  reg j, k, clk, reset;
  wire q;

  jk_ff DUT(.j(j), .k(k), .clk(clk), .q(q), .reset(reset));

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    j = 0; k = 0;
    #10 reset = 0;
  end

  initial begin
    #20;
    j = 0; k = 0; #10;
    j = 0; k = 1; #10;
    j = 1; k = 0; #10;
    j = 1; k = 1; #10;
    $finish;
  end
endmodule

