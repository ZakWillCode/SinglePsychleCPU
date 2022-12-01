module inst_mem (

	input [7:0] pc,

	output reg [15:0] inst
	
);
	integer i;
	reg [7:0] inst_data[255:0];

	initial begin 
		//Hardcode instructions for testing with FPGA
		//Instructions are stored as a set of 2 individual bytes which will then be decoded
		//first initialize the array
		for (i=0;i<256;i=i+1) begin
			inst_data[i] = 0;
		end
		
		inst_data[0] = 		8'b11110000;
		inst_data[1] = 		8'b00001111; //LOADIMM 15 -> Ra = 0
		inst_data[2] = 		8'b11110100;
		inst_data[3] = 		8'b00000001; //LOADIMM 1 -> Ra = 1
		inst_data[4] = 		8'b00000000;
		inst_data[5] = 		8'b00000000; //NOP
		inst_data[6] = 		8'b11100000;
		inst_data[7] = 		8'b00001000; //STORE Ra = 0 (15) -> M[8]
		inst_data[8] = 		8'b10110000;
		inst_data[9] = 		8'b00000000; //BR.SUB
		inst_data[10] = 	8'b10101000;
		inst_data[11] = 	8'b00000000; //BR.N brx = 1 if (i=0) branch
		inst_data[12] = 	8'b01100000;
		inst_data[13] = 	8'b00000000; //OUT Ra = 0
		inst_data[14] =		8'b00100001;
		inst_data[15] = 	8'b00000000; //SUB Ra = 0, Rb = 1 (i-1) for 15
		inst_data[16] = 	8'b10010000;
		inst_data[17] = 	8'b00000101; //BR to BR.N
		inst_data[18] = 	8'b00000000;
		inst_data[19] = 	8'b00000000; //NOP
		inst_data[20] = 	8'b11010000;
		inst_data[21] = 	8'b00001000; //LOAD M[8] (15) -> Ra = 0
		inst_data[22] = 	8'b00010000;
		inst_data[23] = 	8'b00000000; //ADD Ra = 0 + Ra = 0 (15+15) = 30 or shift right 1
		inst_data[24] = 	8'b01000000;
		inst_data[25] = 	8'b00000000; //SHL Ra = 0 (30*2) = 60
		inst_data[26] = 	8'b01010000;
		inst_data[27] = 	8'b00000000; //SHR Ra = 0 (60/2) = 30
		inst_data[28] = 	8'b01010000;
		inst_data[29] = 	8'b00000000; //SHR Ra = 0 (30/2) = 15
		inst_data[30] = 	8'b01100000;
		inst_data[31] = 	8'b00000000; //OUT
		inst_data[32] = 	8'b00110011;
		inst_data[33] = 	8'b00000000; //NAND Ra = 0, Rb = 3 00001111 NAND 00000000 = 11111111
		inst_data[34] = 	8'b01100000;
		inst_data[35] = 	8'b00000000; //OUT
		inst_data[36] = 	8'b11010000;
		inst_data[37] = 	8'b00000000; //LOAD M[8] (15) -> Ra = 0
		inst_data[38] = 	8'b11000000;
		inst_data[39] = 	8'b00000000; //RETURN
	end

	always @(*) begin
		inst <= {inst_data[pc],inst_data[pc+1]};
	end
endmodule