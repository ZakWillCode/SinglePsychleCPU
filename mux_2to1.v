module mux_2to1
 ( 
	input  	A,		//   
	input  	B,		// 

	input	sel,		// input select from sel_mux
  
	output  out
 ); 
  
	assign out = sel ? A : B;	//if sel =1, A  
  					//if sel =0, B 
endmodule
