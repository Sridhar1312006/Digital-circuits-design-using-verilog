`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 05:42:08
// Design Name: 
// Module Name: tb_jkup
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

module tb_jkup;
    reg clk, reset;
    wire [3:0] q;

    jk_up uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | reset=%b | q=%b", $time, reset, q);
        reset = 1;
        #10; reset = 0;
        #200;
        reset = 1;
        #10; reset = 0;
        clk = 1;
        #50;
        clk = 0;
        #100;
        $stop;
    end  
endmodule
