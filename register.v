module register  
 (  
	input		rst, 
	input 		clk, 
    
	input [15:0] 	inst,
	input 	[7:0]	data, 
	input 			reg_en,
        
	output reg [7:0]	reg_data1,
        
	output reg [7:0]	reg_data2 
 );  

	reg	[7:0]	reg_array [3:0];	//setup the registers
    	reg [1:0] 	ra, rb; 

	initial begin
		reg_array [0] <= 0;
		reg_array [1] <= 0;
		reg_array [2] <= 0;
		reg_array [3] <= 0;
	end
	
	always @ (negedge clk or posedge rst) begin 	//register needs this or it doesn't compile
		
		//Assign values
		ra = inst[11:10];
		rb = inst[9:8];
		
		
		if(rst) begin  				//resets registers
			reg_array[0] <= 8'b0;
			reg_array[1] <= 8'b0;
			reg_array[2] <= 8'b0;
			reg_array[3] <= 8'b0;
		end

	 	else begin							//if not reset, then write
	 		if(reg_en) begin  				//
				reg_array[ra] <= data;  	//writes new values to R[ra]
			end  
		end 

	end

	always @ (*) begin
		reg_data1 <= reg_array[ra];
		reg_data2 <= reg_array[rb];
	end	

endmodule  
