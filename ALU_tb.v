 `timescale 1ps / 1ps  

module ALU_tb;
	//Inputs
	reg[7:0] in_A, in_B;
	reg[3:0] sel;
	reg clk, rst;

	//Outputs
	wire[7:0] result;
	wire Z, N;
	
ALU uut(
        .in_A(in_A),
	.in_B(in_B),                 
        .sel(sel),
        .rst(rst), 
        .clk(clk),
	.N(N),
	.Z(Z),
	.result(result)
);
    initial begin
		in_A = 8'b00001100;
		in_B = 8'b00001001;
		sel = 4'b0000;
		#10;
		clk = 1'b1; rst = 1'b1;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; rst = 1'b0;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0001;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0010;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0011;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0100;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0101;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0110;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b0111;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1; sel = 4'b1000;
		#10;
		clk = 1'b0;
		#10;
		clk = 1'b1;
		#10;
		clk = 1'b0;
    end
endmodule