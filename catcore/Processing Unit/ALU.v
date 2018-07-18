module ALU (dado1, dado2, saida, controle /*ALU Control*/, sinal_ZERO, sinal_NEG, clockAuto);
	input [31:0] dado1;
	input [31:0] dado2;
	input [3:0] controle;
	input clockAuto;
	output reg [31:0] saida;
	output reg sinal_ZERO, sinal_NEG;
	
	always @ (controle or dado1 or dado2) begin 
		case(controle[3:0])
			4'b0000: saida = dado1 + dado2;	// ADD
			4'b0001: saida = dado1 - dado2;	// SUB
			4'b0010: saida = dado1 & dado2;  	// AND
			4'b0011: saida = dado1 | dado2;	// OR 
			4'b0100: saida = dado1; 		// MOV
			4'b0101: saida = dado1 >> 1;		// SHIFT RIGHT 1
			4'b0110: saida = dado1 < dado2 ? 1 : 0; 							// SET LESS THAN
			4'b0111: saida = ~dado1;				// NOT
			4'b1000: saida = dado1 * dado2;
			4'b1001: saida = dado1 / dado2;
			4'b1010: saida = dado1 > dado2 ? 1 : 0;
			4'b1011: saida = dado1 <= dado2 ? 1 : 0;
			4'b1100: saida = dado1 >= dado2 ? 1 : 0;
			4'b1101: saida = dado1 == dado2 ? 1 : 0;
		endcase
	end
	
	always @ (posedge clockAuto) begin
		sinal_ZERO <= (saida == 0);
		sinal_NEG <= (($signed(saida) < 0));
	end/*
	assign sinal_ZERO = (saida == 0);
	assign sinal_NEG = (($signed(saida) < 0));*/
endmodule 