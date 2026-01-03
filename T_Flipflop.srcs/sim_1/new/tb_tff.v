`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 21:33:54
// Design Name: 
// Module Name: tb_tff
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
module tb_tff;
  reg t, clk;
  wire q;

  tff uut (.t(t), .clk(clk), .q(q));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time=%0t | T=%b Q=%b", $time, t, q);

    t=1; #20; 
    t=1; #50; 
    t=0; #20; 
    $finish;
  end
endmodule