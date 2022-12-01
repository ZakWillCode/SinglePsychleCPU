 `timescale 1ps / 1ps  

module register_tb;
	//Inputs
	reg[15:0] inst;
	reg[7:0] data;
	reg reg_en, clk, rst;

	//Outputs
	wire[7:0] reg_data1, reg_data2;
	
register uut(
        .inst(inst),
		.reg_en(reg_en),
		.reg_data1(reg_data1),
		.reg_data2(reg_data2),
		.rst(rst),
		.clk(clk),
		.data(data)
);
    initial begin
		inst = 16'b1111011000000000;
		reg_en = 1'b0;
		data = 8'b10101010;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; reg_en = 1'b1;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; reg_en = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1; inst = 16'b1111010000000000;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;inst = 16'b1111011000000000;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; rst = 1'b1;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; rst = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
    end
endmodule