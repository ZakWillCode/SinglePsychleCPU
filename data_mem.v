 module data_mem  
 (  
	input 		clk,
	input 		rst,
		  
	input [15:0]		inst,  	// address input, shared by read and write port

	input [7:0]		result,  	// write ports
	input			mem_en,  

	output reg [7:0]	data  		// read port
 );  

	integer i;  
	
	reg [7:0]  ea;
	reg [7:0] ram [255:0]; 

	initial begin

		for(i=0;i<256;i=i+1) begin 
			ram[i] <= 16'd0;  
		end	
		
	end  

	always @(posedge clk or posedge rst) begin 
			
		ea = inst[7:0]; //Get ea from instruction
		
		if (mem_en) ram[ea] <= result; //For write data only
		
		if (rst) begin
			for(i=0;i<256;i=i+1) begin 
				ram[i] <= 16'd0;  
			end	
		end
			
	end     

	always @(*) begin

		ea = inst[7:0]; //Get ea from instruction

		data <= ram[ea]; // output ram data
		
	end

 endmodule   
