`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2026 19:18:35
// Design Name: 
// Module Name: sr_up
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

module sr_up (
    input clk, reset,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;          
        else begin
            q <= q + 1;           
        end
    end
endmodule

//Gate level Modeling //
/* 
module sr_up (
    input clk, reset,
    output [3:0] q
);
    wire en0 = 1'b1;
    wire en1 = q[0];
    wire en2 = q[1] & q[0];
    wire en3 = q[2] & q[1] & q[0];

    wire s0 = ~q[0] & en0, r0 = q[0] & en0;
    wire s1 = ~q[1] & en1, r1 = q[1] & en1;
    wire s2 = ~q[2] & en2, r2 = q[2] & en2;
    wire s3 = ~q[3] & en3, r3 = q[3] & en3;

    sr_ff u0 (.s(s0), .r(r0), .clk(clk), .reset(reset), .q(q[0]));
    sr_ff u1 (.s(s1), .r(r1), .clk(clk), .reset(reset), .q(q[1]));
    sr_ff u2 (.s(s2), .r(r2), .clk(clk), .reset(reset), .q(q[2]));
    sr_ff u3 (.s(s3), .r(r3), .clk(clk), .reset(reset), .q(q[3]));
endmodule */


