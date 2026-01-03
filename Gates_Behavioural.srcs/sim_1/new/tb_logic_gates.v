`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2025 11:27:43
// Design Name: 
// Module Name: tb_logic_gates
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


// AND gate module


module tb_logic_gates;
    reg a, b;
    wire y;

    Logic_Gates uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $display("Time | a | b | y");
        $monitor("%0t | %b | %b | %b", $time, a, b, y);

        a = 0; b = 0; #5;
        a = 0; b = 1; #5;
        a = 1; b = 0; #5;
        a = 1; b = 1; #5;

        $finish; 
    end
endmodule

