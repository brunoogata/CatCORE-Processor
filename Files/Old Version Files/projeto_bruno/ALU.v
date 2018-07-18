module ALU (dado1, dado2, saida, controle /*ALU Control*/, sinal_ZERO, sinal_NEG);

	// input
	input [31:0] dado1;
	input [31:0] dado2;
	input [2:0] controle;
	
	// output
	output reg [31:0] saida;
	output sinal_ZERO, sinal_NEG;
	
	always @ (controle or dado1 or dado2) begin 
		
		case(controle[2:0])
			
			3'b000: saida = dado1 + dado2;	// ADD
			3'b001: saida = dado1 - dado2;	// SUB
			3'b010: saida = dado1 & dado2;  	// AND
			3'b011: saida = dado1 | dado2;	// OR 
			3'b100: saida = dado1; 		// MOV
			3'b101: saida = dado1 >> 1;		// SHIFT RIGHT 1
			3'b110: begin 							// SET LESS THAN
				if (dado1[31] != dado2[31]) begin
					if (dado1[31] > dado2[31]) begin
						saida = 1;
					end 
					else begin
						saida = 0;
					end
				end 
				else begin
					if (dado1 < dado2) begin
						saida = 1;
					end
					else begin
						saida = 0;
					end
				end
			end
			3'b111: saida = ~dado1;				// NOT
		endcase
	end
	
	assign sinal_ZERO = (saida == 0);
	assign sinal_NEG = (($signed(saida) < 0));
endmodule 