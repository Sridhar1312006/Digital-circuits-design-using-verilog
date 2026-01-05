`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 19:50:36
// Design Name: 
// Module Name: d_up
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
module d_up (
    input clk, reset,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= q + 1;
    end
endmodule 

//Dataflow modeling//
/*
module sync_up_counter_df (
    input clk, reset,
    output reg [3:0] q
);
    wire [3:0] next_q;

    assign next_q = q + 1;

    always @(posedge clk or posedge reset)
        if (reset) q <= 4'b0000;
        else q <= next_q;
endmodule */

//Gate level Modelling//
/*
module d_up (
    input clk, reset,
    output [3:0] q
);
    wire [3:0] d;

    assign d[0] = ~q[0];
    assign d[1] = q[1] ^ q[0];
    assign d[2] = q[2] ^ (q[1] & q[0]);
    assign d[3] = q[3] ^ (q[2] & q[1] & q[0]);

    dff d0 (d[0], clk, reset, q[0]);
    dff d1 (d[1], clk, reset, q[1]);
    dff d2 (d[2], clk, reset, q[2]);
    dff d3 (d[3], clk, reset, q[3]);
endmodule

module dff (input d, input clk, input reset, output reg q);
    always @(posedge clk or posedge reset)
        if (reset) q <= 0;
        else q <= d;
endmodule */
