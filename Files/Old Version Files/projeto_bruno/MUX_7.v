module MUX_7 (binario, saida, controle);

	// input
	input [31:0] binario;
	input controle;
	
	// output 
	output reg [31:0] saida;
	
	always @ (*) begin
		
		case(controle)
			1'b0: saida = 32'b00000000000000000000000000000000;
			1'b1: saida = binario;
		endcase
	end
endmodule 