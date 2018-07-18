module memoriaInstrucao(endereco_instrucao, instrucao, clock, endereco, clockAuto);
	input [31:0] endereco_instrucao;
	input clock, clockAuto;

	reg [31:0] registradores_instrucao[230:0]; 
	
	output reg [31:0] instrucao;
	output reg [31:0] endereco;
	
	always @ (posedge clock) begin
registradores_instrucao[ 0 ] =  32'b000000_00000000000000000000000000 ;
registradores_instrucao[ 1 ] =  32'b11111100000000000000000000100001 ;
registradores_instrucao[ 2 ] =  32'b000000_00000000000000000000000000 ;
registradores_instrucao[ 3 ] =  32'b01000111100111000000000000000010 ;
registradores_instrucao[ 4 ] =  32'b01111000000111000000000000000000 ;
registradores_instrucao[ 5 ] =  32'b01111000001111000000000000000001 ;
registradores_instrucao[ 6 ] =  32'b01100100010000000000000000000000 ;
registradores_instrucao[ 7 ] =  32'b01111100011111000000000000000000 ;
registradores_instrucao[ 8 ] =  32'b10111000100000110001000000000000 ;
registradores_instrucao[ 9 ] =  32'b01011100100111110000000000001111 ;
registradores_instrucao[ 10 ] =  32'b01111100101111000000000000000001 ;
registradores_instrucao[ 11 ] =  32'b01010011011001010000000000000000 ;
registradores_instrucao[ 12 ] =  32'b01111100110111100000000000000000 ;
registradores_instrucao[ 13 ] =  32'b01000111110111100000000000000001 ;
registradores_instrucao[ 14 ] =  32'b01101000110000000000000000000000 ;
registradores_instrucao[ 15 ] =  32'b000000_00000000000000000000000000 ;
registradores_instrucao[ 16 ] =  32'b01111100111111000000000000000001 ;
registradores_instrucao[ 17 ] =  32'b01111101000111000000000000000000 ;
registradores_instrucao[ 18 ] =  32'b10101101001001110100000000000000 ;
registradores_instrucao[ 19 ] =  32'b01111101010111000000000000000000 ;
registradores_instrucao[ 20 ] =  32'b10101001011010010101000000000000 ;
registradores_instrucao[ 21 ] =  32'b01111101100111000000000000000001 ;
registradores_instrucao[ 22 ] =  32'b10000101101011000101100000000000 ;
registradores_instrucao[ 23 ] =  32'b01010000000011010000000000000000 ;
registradores_instrucao[ 24 ] =  32'b01111100001111000000000000000000 ;
registradores_instrucao[ 25 ] =  32'b01000011110111100000000000000001 ;
registradores_instrucao[ 26 ] =  32'b01100000000000000000000000000010 ;
registradores_instrucao[ 27 ] =  32'b01010001110110110000000000000000 ;
registradores_instrucao[ 28 ] =  32'b01000011100111000000000000000010 ;
registradores_instrucao[ 29 ] =  32'b01010011011011100000000000000000 ;
registradores_instrucao[ 30 ] =  32'b01111101111111100000000000000000 ;
registradores_instrucao[ 31 ] =  32'b01000111110111100000000000000001 ;
registradores_instrucao[ 32 ] =  32'b01101001111000000000000000000000 ;
registradores_instrucao[ 33 ] =  32'b000000_00000000000000000000000000 ;
registradores_instrucao[ 34 ] =  32'b01000111100111000000000000000011 ;
registradores_instrucao[ 35 ] =  32'b01100110000000000000000001111100 ;
registradores_instrucao[ 36 ] =  32'b01111010000111000000000000000000 ;
registradores_instrucao[ 37 ] =  32'b01100110001000000000000000100000 ;
registradores_instrucao[ 38 ] =  32'b01111010001111000000000000000001 ;
registradores_instrucao[ 39 ] =  32'b01111100000111000000000000000001 ;
registradores_instrucao[ 40 ] =  32'b01111100001111000000000000000000 ;
registradores_instrucao[ 41 ] =  32'b01000011110111100000000000000001 ;
registradores_instrucao[ 42 ] =  32'b01100000000000000000000000000010 ;
registradores_instrucao[ 43 ] =  32'b01010010010110110000000000000000 ;
registradores_instrucao[ 44 ] =  32'b01000011100111000000000000000010 ;
registradores_instrucao[ 45 ] =  32'b01111010010111000000000000000010 ;
registradores_instrucao[ 46 ] =  32'b01111110011111000000000000000010 ;
registradores_instrucao[ 47 ] =  32'b11100010011000000000000000000000 ;
registradores_instrucao[ 48 ] =  32'b01111110100111100000000000000000 ;
registradores_instrucao[ 49 ] =  32'b01000111110111100000000000000001 ;
registradores_instrucao[ 50 ] =  32'b01101010100000000000000000000000 ;
registradores_instrucao[ 51 ] =  32'b111110_00000000000000000000000000 ;

	end 
	
	always @ (posedge clockAuto) begin
		instrucao <= registradores_instrucao[endereco_instrucao];	
		endereco <= endereco_instrucao + 1;
	end
	
endmodule 
	