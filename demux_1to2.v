module demux_1to2(

	input sel,
	input [7:0] in,

	output[7:0] A, B

);
	assign A = sel ? 8'b0 : in;
	assign B = sel ? in : 8'b0;
	

endmodule