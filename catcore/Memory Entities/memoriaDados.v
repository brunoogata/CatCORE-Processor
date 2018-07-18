module memoriaDados (endereco, data, saida, controle_escrita /* Controle de Escrita e Leitura */, clock, clockAuto);
	input [31:0] endereco;
	input [31:0] data;
	input controle_escrita, clock;
	input clockAuto;
	
	reg [31:0] registradores[49:0];

	output reg [31:0] saida;
	
	always @ (posedge clock) begin
		if(controle_escrita == 1) begin 
			registradores[endereco] = data;
		end
		
	end
	always @ (posedge clockAuto) begin
		saida <= registradores[endereco];
	end
	
	//assign saida = registradores[endereco];
endmodule 