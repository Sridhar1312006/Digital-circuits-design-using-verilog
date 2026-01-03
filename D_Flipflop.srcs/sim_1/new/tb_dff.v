`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 21:08:15
// Design Name: 
// Module Name: tb_dff
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

`timescale 1ns/1ps
module tb_dff;
  reg d, clk;
  wire q;

  dff uut (.d(d), .clk(clk), .q(q));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time=%0t | D=%b Q=%b", $time, d, q);

    d=0; #10;
    d=1; #10;
    d=0; #10;
    d=1; #20;
    $finish;
  end
endmodule