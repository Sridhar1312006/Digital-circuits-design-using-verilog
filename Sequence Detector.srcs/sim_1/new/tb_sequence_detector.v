`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 18:50:44
// Design Name: 
// Module Name: tb_sequence_detector
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
module tb_sequence_detector;
    reg in;
    reg clk;
    reg rst;
    wire out;

    sequence_detector uut( .in(in), .clk(clk), .rst(rst), .out(out) );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Starting Sequence Detector...");
        $monitor("Time=%t in=%b out=%b State=%b", $time, in, out, uut.current_state);

        rst = 1; #10;  
        rst = 0;       

        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #20;

        $finish;
    end
endmodule

