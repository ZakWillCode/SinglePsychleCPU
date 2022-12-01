module ALU(

	input [7:0] in_A, in_B,
	input [3:0] sel,
	input rst, clk,
	
	output reg N, Z,
	output reg [7:0] result
	
);

	always @(*)
	begin
		case (sel)
			4'b0000: ; //NOP
			4'b0001: //ADD
				result <= (in_A + in_B);
			4'b0010: //SUB
				result <= (in_A - in_B);
			4'b0011: //NAND
				result <= ~(in_A & in_B);
			4'b0100: //SHL
				result <= in_A << 1;
			4'b0101: //SHR
				result <= in_A >> 1;
			4'b0110: //OUT
				result <= in_A;
			4'b0111: //IN
				result <= 8'b0;
			4'b1000:   //MOV
				result <= in_B;
			default: ;
		endcase
	end
	
	always @(posedge clk or posedge rst) begin
		
		if (rst) begin //Reset
			N <= 1'b0;
			Z <= 1'b0;
		end

		if (result < 0) begin //Check negative
			N <= 1'b1;
		end 
		else begin
			N <= 1'b0;
		end
			
		if (result == 0) begin //Check positive
			Z <= 1'b1;
		end 
		else begin
			Z <= 1'b0;
		end

	end
endmodule