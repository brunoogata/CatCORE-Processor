module somador2 (proximo_endereco, imediato_extendido, saida, clock);

	// input 
	input [31:0] proximo_endereco;
	input [31:0] imediato_extendido;
	input clock;
	
	// output
	output [31:0] saida; 
	
	assign saida = proximo_endereco + imediato_extendido;
endmodule 