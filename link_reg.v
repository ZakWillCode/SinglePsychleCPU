module link_reg 					
 (    
	input		rst,
	input 		clk,
       
	input 		lr_en, 		// write port  
	input 		[7:0]	lr_in,  
        
	output 	reg [7:0]	LR		//read port
 );  
 
	always @ (negedge clk or posedge rst) begin 	

		if(rst) begin  				//resets registers
		LR <= 8'b0;
		end

		else begin					
			if(lr_en) begin  	
				LR <= lr_in;  	//writes new values to link_reg
			end  
		end  
	end

endmodule
