`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 08:21:12
// Design Name: 
// Module Name: tb_srff
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
`timescale 1ns / 1ps

module tb_srff;
  reg s, r, clk;
  wire q;

  sr_ff uut ( .q(q), .s(s), .r(r), .clk(clk) );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time = %0t | S = %b R = %b Q = %b", $time, s, r, q);

    s = 0; r = 0; #10;
    s = 0; r = 1; #10;
    s = 1; r = 0; #10;
    s = 1; r = 1; #10;

    $finish;
  end
endmodule
