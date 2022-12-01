module controller (

	input [15:0] inst,
	input 		 br_mux,
	
	output reg [3:0] alu_op,
	output reg [1:0] pc_sel, wb_sel,
	output reg 		 wb_demux_sel, br_sel, wt_sel, lr_en, reg_en, mem_en

);
	
	//Setup temporary registers 
	reg [3:0] temp_op;
	reg 	  temp_brx;

	always @(*)
	
	//
	// Table of bits
	//
	// pc_sel, 00 = PC+2, 11 = PC+2, 01 = LR, 10 = ea  
	// wb_sel, 00 = result, 01 = in.port, 10 = imm, 11 = M[ea]
	// wb_demux_sel, 0 = R[ra], 1 = out.port
	// br_sel, 0 = Z, 1 = N
	// 
	
	begin
	
		temp_op  = inst[15:12];
		temp_brx = inst[11];
		
		case (temp_op)
			4'b0000: begin //NOP, no writeback, alu nop, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0001: begin //ADD, writeback to reg, alu add, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0010: begin //SUB, writeback to reg, alu sub, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0011: begin //NAND, writeback to reg, alu nand, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0100: begin //SHL, writeback to reg, alu shl, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0101: begin //SHR, writeback to reg, alu shr, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0110: begin //OUT, writeback to out.port, alu out, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b1;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b0111: begin //IN, writeback to reg, alu in, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b10;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b1000: begin //MOV, writeback to reg, alu mov, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b1001: begin //BR, no writeback, alu nop, ea
				alu_op 		 <= 4'b0000;
				
				pc_sel 		 <= 2'b10;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				br_sel 		 <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b1010: begin //BR.Z / BR.N, no writeback, leave alu, brx in, path Z or N, read BRmux, select PC+2 or ea
				
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
				
				if (!temp_brx) begin
					br_sel 		 <= 1'b0;
				end
				else begin
					br_sel 		 <= 1'b1;
				end
				
				if (!br_mux) begin 
					pc_sel 		 <= 2'b00;
				end 
				else begin
					pc_sel 		 <= 2'b10;
				end 
				
			end
			4'b1011: begin //BR.SUB, no writeback, alu nop, enable lr, select ea
				alu_op 		 <= 4'b0000;
				
				pc_sel 		 <= 2'b10;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b0;
				br_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b1;
				mem_en		 <= 1'b0;
			end
			4'b1100: begin //RETURN, no writeback, alu nop, disable lr, select lr
				alu_op 		 <= 4'b0000;
				
				pc_sel 		 <= 2'b01;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b0;
				br_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b1101: begin //LOAD, write M[ea] to data, alu nop, PC+2
				alu_op 		 <= 4'b0000;
				
				pc_sel 		 <= 2'b00;
				wb_sel 		 <= 2'b11;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b0;
				br_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			4'b1110: begin //STORE, write to mem, alu nop, PC+2
				alu_op 		 <= temp_op;
				
				pc_sel 		 <= 2'b00;
				wb_sel 		 <= 2'b00;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b1;
				br_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b1;
			end
			4'b1111: begin //LOADIMM, write to data, alu nop, PC+2
				alu_op 		 <= 4'b0000;
				
				pc_sel 		 <= 2'b00;
				wb_sel 		 <= 2'b10;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b0;
				br_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b1;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
			default: begin
				alu_op 		 <= 4'b0;
				
				pc_sel 		 <= 2'b0;
				wb_sel 		 <= 2'b0;
				wb_demux_sel <= 1'b0;
				wt_sel 		 <= 1'b0;
				br_sel 		 <= 1'b0;
				
				reg_en		 <= 1'b0;
				lr_en		 <= 1'b0;
				mem_en		 <= 1'b0;
			end
		endcase
	
	end
endmodule
		

