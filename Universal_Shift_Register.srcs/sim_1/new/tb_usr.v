`timescale 1ns/1ps

module tb_usr;

  reg clk, rst;
  reg [1:0] mode;
  reg [3:0] par_in;
  reg si_left, si_right;
  wire [3:0] q;

  usr uut (
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .par_in(par_in),
    .si_left(si_left),
    .si_right(si_right),
    .q(q)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0; rst = 1; mode = 2'b00;
    par_in = 4'b0000; si_left = 0; si_right = 0;
    #10 rst = 0;

    par_in = 4'b1011; mode = 2'b11; #10;
    mode = 2'b00; #20;
    mode = 2'b01; si_right = 0; #40;
    mode = 2'b10; si_left = 1; #40;
    par_in = 4'b1100; mode = 2'b11; #10;

    #50 $finish;
  end

  initial begin
    $monitor("t=%0t mode=%b q=%b si_left=%b si_right=%b par_in=%b",
              $time, mode, q, si_left, si_right, par_in);
  end

endmodule