 `timescale 1ps / 1ps  

module controller_tb;
	//Inputs
	reg [15:0] inst;
	reg  	   br_mux;

	//Outputs
	wire [3:0] alu_op;
	wire [1:0] pc_sel, wb_sel;
	wire 	   wb_demux_sel, br_sel, lr_en, reg_en, mem_en;
	
controller uut(
        .inst(inst),             
        .br_mux(br_mux),
		
        .alu_op(alu_op), 
        .pc_sel(pc_sel),
		.wb_sel(wb_sel),
		.wb_demux_sel(wb_demux_sel),
		.br_sel(br_sel),
		.lr_en(lr_en),
		.reg_en(reg_en),
		.mem_en(mem_en)
);
    initial begin
		br_mux = 1'b1;
		#100;
		inst = 16'b0000000000000000;
		#100;
		inst = 16'b0001000000000000;
		#100;
		inst = 16'b0010000000000000;
		#100;
		inst = 16'b0011000000000000;
		#100;
		inst = 16'b0100000000000000;
		#100;
		inst = 16'b0101000000000000;
		#100;
		inst = 16'b0110000000000000;
		#100;
		inst = 16'b0111000000000000;
		#100;
		inst = 16'b1000000000000000;
		#100;
		inst = 16'b1001000000000000;
		#100;
		inst = 16'b1010000000000000;
		#100;
		inst = 16'b1011000000000000;
		#100;
		inst = 16'b1100000000000000;
		#100;
		inst = 16'b1101000000000000;
		#100;
		inst = 16'b1110000000000000;
		#100;
		inst = 16'b1111000000000000;
		#100;
    end
endmodule