`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 16:54:01
// Design Name: 
// Module Name: piso
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
module piso (
  input clk, reset, load,
  input [3:0] din,
  output dout
);
  reg [3:0] shift_reg;

  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_reg <= 4'b0000;
    else if (load)
      shift_reg <= din;           
    else
      shift_reg <= {shift_reg[2:0], 1'b0};
  end

  assign dout = shift_reg[3]; 
endmodule

//Dataflow Modelling //
/*module piso_dataflow (
  input clk, reset, load,
  input [3:0] d_in,
  output d_out
);
  reg [3:0] temp;
  assign d_out = temp[3];

  always @(posedge clk or posedge reset) begin
    if (reset)
      temp <= 4'b0000;
    else if (load)
      temp <= d_in;                // load parallel data
    else
      temp <= {temp[2:0], 1'b0};   // shift left
  end
endmodule */

//Gate level modelling //
/*module dff (input clk, reset, d, output reg q);
  always @(posedge clk or posedge reset) begin
    if (reset) q <= 0;
    else q <= d;
  end
endmodule

module piso_structural (
  input clk, reset, load,
  input [3:0] d_in,
  output d_out
);
  wire q0, q1, q2, q3;
  wire mux0, mux1, mux2, mux3;

  // MUX logic: choose between load data or shifted data
  assign mux0 = load ? d_in[0] : 1'b0;
  assign mux1 = load ? d_in[1] : q0;
  assign mux2 = load ? d_in[2] : q1;
  assign mux3 = load ? d_in[3] : q2;

  dff dff0(clk, reset, mux0, q0);
  dff dff1(clk, reset, mux1, q1);
  dff dff2(clk, reset, mux2, q2);
  dff dff3(clk, reset, mux3, q3);

  assign d_out = q3; // serial output
endmodule */
