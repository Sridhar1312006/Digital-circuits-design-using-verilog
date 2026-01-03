`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 16:28:29
// Design Name: 
// Module Name: tb_pipo
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
// `timescale 1ns/1ps
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module tb_pipo;
  reg clk, rst, load;
  reg [3:0] din;
  wire [3:0] q;

  // DUT instance
  pipo uut (.clk(clk), .rst(rst), .din(din), .q(q), .load(load));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $dumpfile("pipo_tb.vcd");   // for GTKWave
    $dumpvars(0, tb_pipo);
    $monitor("Time=%0t | load=%b | din=%b | q=%b",
              $time, load, din, q);

    clk = 0; rst = 1; load = 0; din = 4'b0000;
    #10 rst = 0;

    // Load parallel data
    load = 1; din = 4'b1010; #10;
    load = 0; #10;

    load = 1; din = 4'b1100; #10;
    load = 0; #10;

    load = 1; din = 4'b1111; #10;
    load = 0; #10;

    #50 $finish;
  end
endmodule
 
 