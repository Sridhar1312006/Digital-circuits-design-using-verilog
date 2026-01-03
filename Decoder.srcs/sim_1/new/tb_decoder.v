`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 11:30:15
// Design Name: 
// Module Name: tb_decoder
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
module tb_decoder;
  reg [1:0] A;
  wire [3:0] Y;

  decoder uut(.A(A), .Y(Y));

  initial begin
    $monitor("Time=%0t | A=%b -> Y=%b", $time, A, Y);

    A = 2'b00; #10;
    A = 2'b01; #10;
    A = 2'b10; #10;
    A = 2'b11; #10;

// invalid input
    A = 2'bxx; #10;

    $finish;
  end
endmodule
