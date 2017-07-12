module sete_segmentos(numero, A, B, C, D, E, F, G, clock, controle);
	
	input clock, controle;
	input [3:0] numero;
	
	output A, B, C, D, E, F, G;
	
	reg [6:0] resultado;
	
	always @ (posedge clock) begin
		if(controle) begin
			case(numero)
				4'b0000: resultado = 7'b1111110;
				4'b0001: resultado = 7'b0110000;
				4'b0010: resultado = 7'b1101101;
				4'b0011: resultado = 7'b1111001;
				4'b0100: resultado = 7'b0110011;
				4'b0101: resultado = 7'b1011011;
				4'b0110: resultado = 7'b1011111;
				4'b0111: resultado = 7'b1110000;
				4'b1000: resultado = 7'b1111111;
				4'b1001: resultado = 7'b1111011;
				default: resultado=  7'b0000000;//0000001
			endcase
		end
		else begin
			resultado = 7'b0000001;
		end
	end
	
	assign {A, B, C, D, E, F, G} = ~resultado;

endmodule 