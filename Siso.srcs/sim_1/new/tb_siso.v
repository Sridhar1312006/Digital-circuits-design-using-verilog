`timescale 1ns/1ps
module tb_siso;
  reg clk, reset, din;
  wire dout;

  siso uut (.clk(clk), .reset(reset), .din(din), .dout(dout));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $monitor("Time=%0t | din=%b | dout=%b | shift_reg=%b",
              $time, din, dout, uut.shift_reg);

    clk = 0; reset = 1; din = 0;
    #10 reset = 0;

    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    #50 $finish;
  end
endmodule