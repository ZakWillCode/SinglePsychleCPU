`timescale 1ns / 1ns
 
 module cpu_tb();    
	reg 		clk;
	reg		rst;	 
	reg 	[7:0] 	in;
	wire	[7:0] 	out;

SC_CPU_TL uut
(
	.clk(clk),
	.rst(rst),
	.OUT_PORT(out),
	.IN_PORT(in)
);

	initial begin
		clk	= 0;
		rst	= 1;
		in	= 4'hF;
	end
	
	always begin
		#10; clk = ~clk;
	end
endmodule