`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 05:39:51
// Design Name: 
// Module Name: tb_tup
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

module tb_tup;
    reg clk;
    reg reset;
    wire [3:0] q;

    t_up uut (.clk(clk), .reset(reset), .q(q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | reset=%b | q=%b", $time, reset, q);

        reset = 1;
        #20;
        reset = 0;
        #20;

        clk = 1;
        #200;
        clk = 0;
        #30;
        clk = 1;
        #50;
        #200;

        $finish;
    end
endmodule

