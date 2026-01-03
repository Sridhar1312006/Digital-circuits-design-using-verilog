`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 09:27:52
// Design Name: 
// Module Name: ha
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


module ha(
input a,b,
output reg sum,carry
    );
    always @(a,b) begin 
        sum = a ^ b;
        carry = a * b;
    end 
endmodule

// Dataflow Modelling //
/* module ha(input a,b,
output sum,carry);

assign sum = a^b;
assign carry = a*b;

endmodule */

// Gate level Modelling //
/* module ha( input a,b,
output sum,carry)

xor(sum,a,b);
and(carry,a,b);
endmodule */
