module SC_CPU_TL(

	input [7:0] IN_PORT, //Input and Output 8bit portions
	output[7:0] OUT_PORT,

	input clk,rst //clk and rst for FPGA integration

);

	//internal wires between modules. 
	wire [15:0] inst;	
	wire [7:0] pc, pc_plus2, pc_in, LR;
	wire [7:0] reg_data1, reg_data2;
	wire [7:0] result, wt_out, mem_data;
	wire [7:0] reg_data_in;
	wire [7:0] wb_out;
	wire [3:0] alu_sel;
	wire [1:0] pc_sel, wb_sel;
	wire wb_demux_sel, br_sel, wt_sel;
	wire lr_en, reg_en, mem_en;
	wire z, n;
	wire br_mux;
	
	//Controller 
	controller u_cont (
		.inst(inst),
		.br_mux(br_mux),
		.alu_op(alu_sel),
		.pc_sel(pc_sel),
		.wb_sel(wb_sel),
		.wb_demux_sel(wb_demux_sel),
		.wt_sel(wt_sel),
		.br_sel(br_sel),
		.lr_en(lr_en),
		.reg_en(reg_en),
		.mem_en(mem_en)
	);
	
	//Program counter
	pc u_pc (
		.clk(clk),
		.rst(rst),
		.pc_in(pc_in),
		.pc_out(pc)
	);
	
	//Program counter plus 2
	pc_add u_pc_add (
		.pc_out(pc),
		.pc_plus2(pc_plus2)
	);
	
	//Instruction memory
	inst_mem u_im (
		.pc(pc),
		.inst(inst)
	);
	
	//Register file
	register u_rf (
		.clk(clk),
		.rst(rst),
		.inst(inst),
		.data(reg_data_in),
		.reg_en(reg_en),
		.reg_data1(reg_data1),
		.reg_data2(reg_data2)
	);
	
	//ALU
	ALU u_alu(
		.clk(clk),
		.rst(rst),
		.sel(alu_sel),
		.in_A(reg_data1),
		.in_B(reg_data2),
		.N(n),
		.Z(z),
		.result(result)
	);
	
	//Data memory
	data_mem u_dm (
		.clk(clk),
		.rst(rst),
		.inst(inst),
		.result(wt_out),
		.mem_en(mem_en),
		.data(mem_data)
	);
	
	//Link register
	link_reg u_lr (
		.clk(clk),
		.rst(rst),
		.lr_en(lr_en),
		.lr_in(pc_plus2),
		.LR(LR)
	);
	
	//Writeback multiplexor 4 to 1
	mux_4to1 u_wb_m (
		.A(wt_out),
		.B(IN_PORT),
		.C(inst[7:0]),
		.D(mem_data),
		.sel(wb_sel),
		.out(wb_out)
	);
	
	//Writeback demultiplexor 1 to 2
	demux_1to2 u_wb_d (
		.A(reg_data_in),
		.B(OUT_PORT),
		.sel(wb_demux_sel),
		.in(wb_out)
	);

	//Writeto multiplexor 1 to 2
	mux_2to1_8bit u_wt_m (
		.A(result),
		.B(reg_data1),
		.out(wt_out),
		.sel(wt_sel)
	);
	
	//Branch multiplexor
	mux_2to1 u_br_m (
		.A(z),
		.B(n),
		.sel(br_sel),
		.out(br_mux)
	);
	
	//Program counter multiplexor 4 to 1
	mux_4to1 u_pc_m (
		.A(pc_plus2),
		.B(LR),
		.C(inst[7:0]),
		.D(),
		.sel(pc_sel),
		.out(pc_in)
	);
endmodule