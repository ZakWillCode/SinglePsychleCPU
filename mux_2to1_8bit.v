module mux_2to1_8bit 
 ( 
	input  	[7:0] A,		//   
	input  	[7:0] B,		// 

	input		sel,		// input select from sel_mux
  
	output [7:0]	out
 ); 
  
	assign out = sel ? A : B;	//if sel =1, A  
  					//if sel =0, B 
endmodule
