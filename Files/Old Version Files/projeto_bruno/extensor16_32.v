module extensor16_32 (entrada, saida);

	// input
	input [15:0] entrada;
	
	// output
	output [31:0] saida;

	assign saida = {16'b0000000000000000, entrada};
endmodule 