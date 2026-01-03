`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 17:03:51
// Design Name: 
// Module Name: tb_mux
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
module tb_mux;
  reg a, b, c, d;
  reg [1:0] sel;
  wire y;

  mux uut(.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));

  initial begin
    $monitor("Time=%0t | sel=%b | a=%b b=%b c=%b d=%b -> y=%b",
              $time, sel, a, b, c, d, y);

    a=0; b=1; c=0; d=1;
    sel=2'b00; #10;  
    sel=2'b01; #10;  
    sel=2'b10; #10;  
    sel=2'b11; #10;  

    a=1; b=0; c=1; d=0;
    sel=2'b00; #10;
    sel=2'b01; #10;
    sel=2'b10; #10;
    sel=2'b11; #10;

    $finish;
  end
endmodule
