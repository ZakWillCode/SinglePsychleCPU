module mux_4to1 
 ( 
	input 	[7:0] 	A,		//   
	input 	[7:0] 	B,		// 
	input	[7:0]	C,
	input	[7:0]	D,

	input	[1:0]	sel,
  
	output	[7:0] 	out
 ); 
  
	assign out = sel[1] ? (sel[0] ? D : C) : (sel[0] ? B : A);
endmodule
