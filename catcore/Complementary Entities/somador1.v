module somador1(endereco_atual, saida);
	
	// input
	input [31:0] endereco_atual;
	
	// output 
	output [31:0] saida;
	
	assign saida = endereco_atual + 1;
endmodule 
	