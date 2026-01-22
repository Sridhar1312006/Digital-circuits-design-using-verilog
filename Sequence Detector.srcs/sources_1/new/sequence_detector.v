`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 18:49:36
// Design Name: 
// Module Name: sequence_detector
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
module sequence_detector(
    input clk,
    input rst,
    input in,
    output reg out
);

parameter S0=2'b00,
          S1=2'b01,
          S2=2'b10,
          S3=2'b11;

reg [1:0] current_state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst)
        current_state <= S0;
    else
        current_state <= next_state;
end

always @(*) begin
    case (current_state)
        S0: next_state = (in) ? S1 : S0;
        S1: next_state = (in) ? S1 : S2;
        S2: next_state = (in) ? S3 : S0;
        S3: next_state = (in) ? S1 : S0;
        default: next_state = S0;
    endcase
end


always @(*) begin
    case (current_state)
        S3: out = (in) ? 1 : 0;  
        default: out = 0;
    endcase
end

endmodule
