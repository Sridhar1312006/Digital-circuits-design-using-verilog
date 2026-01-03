`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 16:55:33
// Design Name: 
// Module Name: tb_piso
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

module tb_piso;
  reg clk, reset, load;
  reg [3:0] din;
  wire dout;

  piso uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0; reset = 1; load = 0; din = 4'b0000;
    #10 reset = 0;

    load = 1; din = 4'b1011; #10;
    load = 0;

    #50 $finish;
  end
endmodule

