module MUX_2 (D2, imediato_extendido, saida, controle);
	input [31:0] D2;
	input [31:0] imediato_extendido;
	input controle;

	output reg [31:0] saida;
	
	always @ (*) begin
		case(controle)
			1'b0: saida = D2;
			1'b1: saida = imediato_extendido;
		endcase
	end
endmodule 