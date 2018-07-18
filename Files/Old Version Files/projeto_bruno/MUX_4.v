module MUX_4 (entrada_pc, entrada_extendido, entrada_jump, saida, controle, sinal_ZERO);

	// input
	input [31:0] entrada_pc;
	input [31:0] entrada_extendido;
	input [27:0] entrada_jump;
	input [1:0] controle;
	input sinal_ZERO;

	// output 
	output reg [31:0] saida;
	
	always @ (*) begin
	
		case(controle[1:0])
		
			2'b00: saida = entrada_pc + 1; // PC + 1
			2'b01: begin // BRANCH ON EQUAL
				if(sinal_ZERO == 1) begin
					saida = entrada_extendido;
				end
				else begin
					saida = entrada_pc + 1; // PC + 1
				end
			end
			2'b10: begin // BRANCH NOT EQUAL
				if(sinal_ZERO == 0) begin
					saida = entrada_extendido;
				end
				else begin
					saida = entrada_pc + 1; // PC + 1
				end
			end
			2'b11: begin // JUMP
				saida = entrada_jump;	
			end
		endcase
	end
	
endmodule 