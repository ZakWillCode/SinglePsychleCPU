module pc (
	
	input clk, rst,
	input [7:0] pc_in,

	output reg [7:0] pc_out

);
	initial begin
		pc_out <= 8'b0;
	end
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			pc_out <= 8'b0;
		end 
		else begin
			pc_out <= pc_in;
		end
	end
endmodule