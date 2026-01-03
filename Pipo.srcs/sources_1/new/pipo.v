module pipo(
  input clk, rst, load,
  input [3:0] din,
  output reg [3:0] q
);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 4'b0000;
    else if (load)
      q <= din;  
  end
endmodule

/*module pipo_dataflow (
  input clk, reset, load,
  input [3:0] d_in,
  output [3:0] q
);
  reg [3:0] temp;
  assign q = temp; // parallel output

  always @(posedge clk or posedge reset) begin
    if (reset)
      temp <= 4'b0000;
    else if (load)
      temp <= d_in; // load parallel data
  end
endmodule */

/*module dff (input clk, reset, d, output reg q);
  always @(posedge clk or posedge reset) begin
    if (reset) q <= 0;
    else q <= d;
  end
endmodule

module pipo_structural (
  input clk, reset, load,
  input [3:0] d_in,
  output [3:0] q
);
  wire q0, q1, q2, q3;

  dff dff0(clk, reset, load ? d_in[0] : q0, q0);
  dff dff1(clk, reset, load ? d_in[1] : q1, q1);
  dff dff2(clk, reset, load ? d_in[2] : q2, q2);
  dff dff3(clk, reset, load ? d_in[3] : q3, q3);

  assign q = {q3, q2, q1, q0}; // parallel output
endmodule*/