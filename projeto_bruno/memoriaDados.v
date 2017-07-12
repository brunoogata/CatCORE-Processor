module memoriaDados (endereco, dado_wrt, saida_dado, controle /* Controle de Escrita e Leitura */, clock);
	
	// input
	input [31:0] endereco;
	input [31:0] dado_wrt;
	input controle, clock;
	
	// registradores
	reg [31:0] registradores_dados[20:0];
	
	
	// output
	output [31:0] saida_dado;
	
	always @ (posedge clock) begin
	
		if(controle == 1) begin // Controle = 1 => Escreve <<>> Controle = 0 => Le, apenas
			registradores_dados[endereco] = dado_wrt;
		end
	end
	
	assign saida_dado = registradores_dados[endereco];
endmodule 