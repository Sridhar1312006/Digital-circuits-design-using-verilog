`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 05:29:17
// Design Name: 
// Module Name: jk_up
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
module jk_up(
    input reset, clk,
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


//Gate level Modelling //
/*
module jk_up (
    input clk, reset,
    output [3:0] q
);
    wire en1, en2, en3;

    assign en1 = q[0];
    assign en2 = q[1] & q[0];
    assign en3 = q[2] & q[1] & q[0];

    jkff u0 (.j(1'b1), .k(1'b1), .clk(clk), .reset(reset), .q(q[0]));
    jkff u1 (.j(en1),  .k(en1),  .clk(clk), .reset(reset), .q(q[1]));
    jkff u2 (.j(en2),  .k(en2),  .clk(clk), .reset(reset), .q(q[2]));
    jkff u3 (.j(en3),  .k(en3),  .clk(clk), .reset(reset), .q(q[3]));
endmodule

module jkff (
    input j, k, clk, reset,
    output q
);
    wire qbar;
    wire nand1_out, nand2_out, nand3_out, nand4_out;

    nand (nand1_out, j, clk, qbar);
    nand (nand2_out, k, clk, q);
    nand (nand3_out, nand1_out, reset, nand4_out);
    nand (nand4_out, nand2_out, reset, nand3_out);

    assign q    = nand3_out;
    assign qbar = nand4_out;
endmodule 
*/

