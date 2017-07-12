module MUX_1 (entrada_RT, entrada_RD, saida, controle /*Controle MUX1*/);

	// input
	input [4:0] entrada_RT;
	input [4:0] entrada_RD;
	input controle;
	
	// output 
	output reg [4:0] saida;
	
	always @ (*) begin
		
		case(controle)
			1'b0: saida = entrada_RT;
			1'b1: saida = entrada_RD;
		endcase
	end
endmodule 