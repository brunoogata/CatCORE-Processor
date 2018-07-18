module MUX_3 (saida_memoria, resultado_ula, imediato_extendido, switch_extendido, saida, controle);
	input [31:0] saida_memoria;
	input [31:0] resultado_ula;
	input [31:0] imediato_extendido;
	input [31:0] switch_extendido;
	input [1:0] controle;

	output reg [31:0] saida;
	
	always @ (*) begin
		case(controle) 
			2'b00: saida = resultado_ula;
			2'b11: saida = switch_extendido;
			2'b01: saida = saida_memoria;
			2'b10: saida = imediato_extendido;
		endcase 
	end
endmodule 