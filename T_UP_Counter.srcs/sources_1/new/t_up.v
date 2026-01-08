`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 05:32:06
// Design Name: 
// Module Name: t_up
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
module t_up(
    input clk,
    input reset,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;      
        end else begin
            q <= q + 1;         
        end
    end
endmodule


//Gate level Modeling //
/* module t_up(
    input clk, reset,
    output [3:0] q
);
    wire t0, t1, t2, t3;

    assign t0 = 1'b1;

    // t1 = q0
    buf b1 (t1, q[0]);

    // t2 = q1 & q0
    and a2 (t2, q[1], q[0]);

    // t3 = q2 & q1 & q0
    and a3 (t3, q[2], q[1], q[0]);

    tff u0 (.t(t0), .clk(clk), .reset(reset), .q(q[0]));
    tff u1 (.t(t1), .clk(clk), .reset(reset), .q(q[1]));
    tff u2 (.t(t2), .clk(clk), .reset(reset), .q(q[2]));
    tff u3 (.t(t3), .clk(clk), .reset(reset), .q(q[3]));
endmodule */
