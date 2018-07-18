module MUX_4 (PC, imediato_extendido, absoluto_jump, register_jump, saida, controle, sinal_ZERO);
	input [31:0] PC;
	input [31:0] imediato_extendido;
	input [31:0] absoluto_jump;
	input [31:0] register_jump;
	input [2:0] controle;
	input sinal_ZERO;

	output reg [31:0] saida;
	
	always @ (*) begin
		case(controle[2:0])
			3'b000: saida = PC + 1; // PC + 1
			3'b001: saida = sinal_ZERO == 1 ? imediato_extendido : (PC + 1);
			3'b010: saida = sinal_ZERO == 0 ? imediato_extendido : (PC + 1);
			3'b011: saida = absoluto_jump;
			3'b100: saida = register_jump;
			default: saida = PC + 1;
		endcase
	
	end
endmodule 