module deslocamento_2 (entrada, saida);
	
	// input 
	input [31:0] entrada;
	
	// output
	output [31:0] saida;
	
	assign saida = entrada << 2;
endmodule 