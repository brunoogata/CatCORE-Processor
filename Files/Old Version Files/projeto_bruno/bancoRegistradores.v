module bancoRegistradores (endereco_read1, endereco_read2, endereco_wrt, dado_wrt, saida_RD, saida_RS, saida_RT, controle /* Controle de Escrita */, clock);
	
	// input
	input [4:0] endereco_read1;
	input [4:0] endereco_read2;
	input [4:0] endereco_wrt;
	input [31:0] dado_wrt;
	input clock, controle;

	// registradores
	reg [31:0] registradores_banco[31:0];
	
	// output
	output [31:0] saida_RD;
	output [31:0] saida_RS;
	output [31:0] saida_RT;

	
	always @ (posedge clock) begin
		
		if(controle == 1) registradores_banco[endereco_wrt] = dado_wrt;
	end
	
	// Resultados Saidas
	assign saida_RD = registradores_banco[endereco_wrt];
	assign saida_RS = registradores_banco[endereco_read1];
	assign saida_RT = registradores_banco[endereco_read2];
endmodule 