module demux_1to2(

	input sel,
	input [7:0] in,

	output reg [7:0] A, B

);
	
	always @(*) begin
		if (!sel) begin
			A <= in;
			B <= 8'b0;
		end
		else begin
			A <= 8'b0;
			B <= in;
		end
	end

endmodule