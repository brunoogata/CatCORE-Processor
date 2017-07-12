module MUX_2 (entrada_dadoRT, entrada_extendido, saida, controle);

	// input
	input [31:0] entrada_dadoRT;
	input [31:0] entrada_extendido;
	input controle;
	
	// output 
	output reg [31:0] saida;
	
	always @ (*) begin
		
		case(controle)
			1'b0: saida = entrada_dadoRT;
			1'b1: saida = entrada_extendido;
		endcase
	end
endmodule 