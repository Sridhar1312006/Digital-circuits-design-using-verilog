`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 15:25:52
// Design Name: 
// Module Name: siso
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
module siso (
  input clk, reset, din,
  output wire dout
);
  reg [3:0] shift_reg;

  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_reg <= 4'b0000;
    else
      shift_reg <= {shift_reg[2:0], din};
  end

  assign dout = shift_reg[3];  // MSB as serial output
endmodule

//Dataflow Modelling//
/*module siso_dataflow (
  input clk, reset, d_in,
  output d_out
);
  reg [3:0] temp;
  assign d_out = temp[3];

  always @(posedge clk or posedge reset) begin
    if (reset)
      temp <= 4'b0000;
    else
      temp <= {temp[2:0], d_in};
  end
endmodule */

//Gatelevel Modelling//
/*module dff (input clk, reset, d, output reg q);
  always @(posedge clk or posedge reset) begin
    if (reset) q <= 0;
    else q <= d;
  end
endmodule

module siso_structural (
  input clk, reset, d_in,
  output d_out
);
  wire q0, q1, q2, q3;

  dff dff0(clk, reset, d_in, q0);
  dff dff1(clk, reset, q0, q1);
  dff dff2(clk, reset, q1, q2);
  dff dff3(clk, reset, q2, q3);

  assign d_out = q3; // serial output
endmodule */
