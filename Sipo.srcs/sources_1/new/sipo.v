`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 15:50:02
// Design Name: 
// Module Name: sipo
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

module sipo (
  input clk, rst, din,
  output reg [3:0] q
);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 4'b0000;
    else
      q <= {q[2:0], din}; // shift left, serial in
  end
endmodule

//Dataflow Modelling//
/*module sipo_dataflow (
  input clk, reset, d_in,
  output [3:0] q
);
  reg [3:0] temp;
  assign q = temp; // parallel output

  always @(posedge clk or posedge reset) begin
    if (reset)
      temp <= 4'b0000;
    else
      temp <= {temp[2:0], d_in}; // shift left
  end
endmodule */

//Gate level modelling //
/*module dff (input clk, reset, d, output reg q);
  always @(posedge clk or posedge reset) begin
    if (reset) q <= 0;
    else q <= d;
  end
endmodule

module sipo_structural (
  input clk, reset, d_in,
  output [3:0] q
);
  wire q0, q1, q2, q3;

  dff dff0(clk, reset, d_in, q0);
  dff dff1(clk, reset, q0, q1);
  dff dff2(clk, reset, q1, q2);
  dff dff3(clk, reset, q2, q3);

  assign q = {q3, q2, q1, q0}; // parallel output
endmodule */