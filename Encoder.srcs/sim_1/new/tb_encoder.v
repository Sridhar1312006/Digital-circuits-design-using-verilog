
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 11:15:33
// Design Name: 
// Module Name: tb_encoder
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
module tb_encoder;
  reg [3:0] D;
  wire [1:0] Y;

  encoder uut(.D(D), .Y(Y));

  initial begin
    $monitor("Time=%0t | D=%b -> Y=%b", $time, D, Y);
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0100; #10;
    D = 4'b1000; #10;
//invalid 
    D = 4'b0000; #10;
    D = 4'b0011; #10;
    D = 4'b1111; #10;

    $finish;
  end
endmodule
