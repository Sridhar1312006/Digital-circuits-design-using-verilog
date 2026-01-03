`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 11:27:55
// Design Name: 
// Module Name: decoder
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
module decoder(input [1:0] A, output reg [3:0] Y);
  always @(*) begin
    case (A)
      2'b00: Y = 4'b0001;
      2'b01: Y = 4'b0010;
      2'b10: Y = 4'b0100;
      2'b11: Y = 4'b1000;
      default: Y = 4'b0000;
    endcase
  end
endmodule

//Dataflow Modelling //
/* module decoder_dataflow(input [1:0] A, output [3:0] Y);
  assign Y = (A == 2'b00) ? 4'b0001 :
             (A == 2'b01) ? 4'b0010 :
             (A == 2'b10) ? 4'b0100 :
             (A == 2'b11) ? 4'b1000 : 4'b0000;
endmodule */

//Gatelevel Modelling //
/* module decoder_gate(input [1:0] A, output [3:0] Y);
  assign Y[0] = ~A[1] & ~A[0];
  assign Y[1] = ~A[1] &  A[0];
  assign Y[2] =  A[1] & ~A[0];
  assign Y[3] =  A[1] &  A[0];
endmodule */