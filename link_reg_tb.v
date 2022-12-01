 `timescale 1ps / 1ps  

module link_reg_tb;
	//Inputs
	reg[7:0] lr_in;
	reg lr_en, clk, rst;

	//Outputs
	wire[7:0] LR;
	
link_reg uut(
		.lr_in(lr_in),
		.lr_en(lr_en),
		.rst(rst),
		.clk(clk),
		.LR(LR)
);
    initial begin
		lr_in = 8'b00001111;
		lr_en = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; lr_en = 1'b1;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1; lr_in = 8'b11110000;
		#100;
		clk = 1'b0;
		#100;
    end
endmodule