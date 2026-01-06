`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2026 20:05:39
// Design Name: 
// Module Name: tb_srup
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


`timescale 1ns/1ps

module tb_srup;
    reg clk;
    reg reset;
    wire [3:0] q;

    sr_up uut (.clk(clk), .reset(reset), .q(q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | reset=%b | q=%b", $time, reset, q);

        reset = 1;
        #20;
        reset = 0;

        #200;

        clk = 1;
        #100;
        clk  = 0;
        #20
        clk = 1;
        #200;

        $finish;
    end
endmodule

