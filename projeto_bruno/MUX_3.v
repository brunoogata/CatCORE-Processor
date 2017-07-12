module MUX_3 (saida_memoria, resultado_alu, extendido, saida, controle);

	// input
	input [31:0] saida_memoria;
	input [31:0] resultado_alu;
	input [31:0] extendido;
	input [1:0] controle;
	
	// output 
	output reg [31:0] saida;
	
	always @ (*) begin
		
		case(controle) 
			default: saida = resultado_alu;
			2'b01: saida = saida_memoria;
			2'b10: saida = extendido;
			
		endcase 
	end
endmodule 