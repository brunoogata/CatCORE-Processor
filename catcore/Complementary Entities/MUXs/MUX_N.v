module MUX_N (endereco_instrucao, SWR, D1, imediato_extendido, /*resultado_ula,*/ saida, controle);
	input [31:0] endereco_instrucao;
	input [31:0] SWR;
	input [31:0] D1;
	input [31:0] imediato_extendido;
	input [1:0] controle;

	output reg [31:0] saida;
	
	always @ (*) begin
		case(controle[1:0])
			2'b00: saida = endereco_instrucao;
			2'b01: saida = SWR;
			2'b10: saida = D1;
			2'b11: saida = imediato_extendido;
		endcase
	end
endmodule 