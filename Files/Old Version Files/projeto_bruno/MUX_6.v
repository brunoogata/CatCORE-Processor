module MUX_6 (instrucao, switch, saida, controle /*Controle MUX6*/);

	// input
	input [15:0] instrucao;
	input [15:0] switch;
	input controle;
	
	// output 
	output reg [15:0] saida;
	
	always @ (*) begin
		
		case(controle)
			1'b0: saida = instrucao;
			1'b1: saida = switch;
		endcase
	end
endmodule 