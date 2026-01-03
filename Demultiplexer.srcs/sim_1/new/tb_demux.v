`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 17:40:03
// Design Name: 
// Module Name: tb_demux
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
module tb_demux1to4;
  reg din;
  reg [1:0] sel;
  wire y0, y1, y2, y3;

  demux uut(.din(din), .sel(sel), .y0(y0), .y1(y1), .y2(y2), .y3(y3));

  initial begin
    $monitor("Time=%0t | sel=%b din=%b -> y0=%b y1=%b y2=%b y3=%b",
              $time, sel, din, y0, y1, y2, y3);

    din = 1;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    din = 0;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    $finish;
  end
endmodule
