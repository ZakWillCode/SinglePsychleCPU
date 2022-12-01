`timescale 1ns / 1ns
 
 module inst_mem_tb();    
	reg 	[7:0]	pc;
	wire	[15:0] 	inst;

inst_mem uut
(
	.pc(pc),
	.inst(inst)
);

	integer i;
	initial begin
		for (i=0;i<50;i=i+2) begin
			pc <= i;
			#100;
		end
	end

endmodule