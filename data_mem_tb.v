 `timescale 1ps / 1ps  

module data_mem_tb;
	//Inputs
	reg[15:0] inst;
	reg[7:0] result;
	reg mem_en, clk;

	//Outputs
	wire[7:0] data;
	
data_mem uut(
        .inst(inst),
		.result(result),
		.mem_en(mem_en),
		.clk(clk),
		.data(data)
);
    initial begin
		inst = 16'b1111010000000001;
		mem_en = 1'b0;
		result = 8'b10101010;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; mem_en = 1'b1;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0; mem_en = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1; inst = 16'b1111010000001110;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;
		#100;
		clk = 1'b0;
		#100;
		clk = 1'b1;inst = 16'b1111010000001100;
		#100;
		clk = 1'b0;
		#100;
    end
endmodule