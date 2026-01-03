`timescale 1ns/1ps
module tb_sipo;
  reg clk, rst, din;
  wire [3:0] q;

  sipo uut (.clk(clk), .rst(rst), .din(din), .q(q));

  always #5 clk = ~clk;

  initial begin
    clk = 0; rst = 1; din = 0;
    #10 rst = 0;

    // Shift in 4 bits
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    #50 $finish;
  end
endmodule