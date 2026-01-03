`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 12:27:17
// Design Name: 
// Module Name: USR
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

module usr (
  input clk, input rst,
  input [1:0] mode,
  input [3:0] par_in,
  input si_left, si_right,
  output reg [3:0] q
);

always @(posedge clk or posedge rst) begin
  if (rst)
    q <= 4'b0000;
  else begin
    case (mode)
      2'b00: q <= q;                        // Hold
      2'b01: q <= {si_right, q[3:1]};       // Shift Right
      2'b10: q <= {q[2:0], si_left};        // Shift Left
      2'b11: q <= par_in;                   // Parallel Load
    endcase
  end
end
endmodule

//Data Flow Modelling //
/*module usr_dataflow (
  input clk, input rst,
  input [1:0] mode,
  input [3:0] par_in,
  input si_left, si_right,
  output reg [3:0] q
);

wire [3:0] d;

assign d = (mode==2'b00)? q :                   
           (mode==2'b01)? {si_right, q[3:1]} :  
           (mode==2'b10)? {q[2:0], si_left} :   
           par_in;                              

always @(posedge clk or posedge rst)
  if (rst) q <= 4'b0000;
  else q <= d;

endmodule */

//Gate Level Modelling //
/*module usr_gate (
  input clk, input rst,
  input [1:0] mode,
  input [3:0] par_in,
  input si_left, si_right,
  output reg [3:0] q
);

wire [3:0] d;

// Bit 3 (MSB)
assign d[3] = (mode==2'b00)? q[3] :   
              (mode==2'b01)? si_right : 
              (mode==2'b10)? q[2] :     
              par_in[3];                

// Bit 2
assign d[2] = (mode==2'b00)? q[2] :
              (mode==2'b01)? q[3] :
              (mode==2'b10)? q[1] :
              par_in[2];

// Bit 1
assign d[1] = (mode==2'b00)? q[1] :
              (mode==2'b01)? q[2] :
              (mode==2'b10)? q[0] :
              par_in[1];

// Bit 0 (LSB)
assign d[0] = (mode==2'b00)? q[0] :
              (mode==2'b01)? q[1] :
              (mode==2'b10)? si_left :
              par_in[0];

always @(posedge clk or posedge rst)
  if (rst) q <= 4'b0000;
  else q <= d;

endmodule */