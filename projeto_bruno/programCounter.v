module programCounter(proximo_endereco, endereco_atual, clock, reset, halt);
	
	// input 
	input [31:0] proximo_endereco;
	input clock, reset, halt;
	
	// output
	output reg [31:0] endereco_atual;
	
	// registradores
	//reg [31:0] registrador_pc;
	
	
	always @ (posedge clock) begin
	
		if(reset) begin
			endereco_atual = 0;
		end
		else if(halt) begin
		
		end
		else begin
			endereco_atual = proximo_endereco;
		end
	end 
endmodule 