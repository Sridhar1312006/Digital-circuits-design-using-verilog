`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 11:11:11
// Design Name: 
// Module Name: encoder
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

module encoder(input [3:0] D, output reg [1:0] Y);
  always @(*) begin
    case (D)
      4'b0001: Y = 2'b00;
      4'b0010: Y = 2'b01;
      4'b0100: Y = 2'b10;
      4'b1000: Y = 2'b11;
      default: Y = 2'bxx; 
    endcase
  end
endmodule

// Dataflow Modelling //
/* module encoder_dataflow(input [3:0] D, output [1:0] Y);
  assign Y[1] = D[2] | D[3];
  assign Y[0] = D[1] | D[3];
endmodule */

//Gate level Modelling //
/*module encoder_gate(input [3:0] D, output [1:0] Y);
  or (Y[1], D[2], D[3]);   // MSB
  or (Y[0], D[1], D[3]);   // LSB
endmodule */