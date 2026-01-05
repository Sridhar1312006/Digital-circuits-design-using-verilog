`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 20:27:05
// Design Name: 
// Module Name: tb_dup
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

module tb_dup;
    reg clk, reset;
    wire [3:0] q;

    d_up uut (
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
        #50;
        reset = 0;

        #25; //By setting this timing seconds,we can set like mod counter,now this circuit will give up to 3 states[0,1,2])

        $finish;
    end
endmodule
