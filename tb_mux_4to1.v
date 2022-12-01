`timescale 1ns / 1ns
 
 module tb_mux_4to1();    
	reg 		clk;
	reg 	[7:0] 	A;		 
	reg 	[7:0] 	B;	
	reg 	[7:0] 	C;		 
	reg 	[7:0] 	D;	  
	reg		[1:0] sel;	
	wire	[7:0] 	out;

mux_4to1 uut
(
	.A(A),
	.B(B),
	.C(C),
	.D(D),
	.sel(sel),
	.out(out)
);

	initial begin
		clk	= 0;
		A 	= 16'd1;
		B 	= 16'd2;
		C	= 16'd3;
		D = 0;
		sel 	= 00;		//output A
		#30
		sel 	= 01;		//output B
		#30
		sel 	= 10;		//output C
		#30
		sel 	= 11;		//output D
		#30
	end
endmodule