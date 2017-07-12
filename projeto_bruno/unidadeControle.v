module unidadeControle(opcode, botao, clock, controle_BANCOREG, controle_MEMDADOS, controle_MUX1, controle_MUX2, controle_MUX3, controle_MUX4, controle_ALU, HALT, controle_MUX6, controle_OPT);
	
	input [5:0] opcode;
	input botao;
	input clock;
	
	output reg [1:0] controle_MUX4;
	output reg [1:0] controle_MUX3;
	output reg [2:0] controle_ALU;
	output reg controle_BANCOREG, controle_MEMDADOS, controle_MUX1, controle_MUX2, controle_MUX6, controle_OPT, HALT;
	
	always @ (opcode or botao) begin 
	
		case(opcode) 
			
			// ENTRADA, SAIDA E HALT
			6'b000111: begin // in
				if(botao) begin
					HALT = 0;
					controle_MUX4 = 2'b00;
				end
				else if (clock) begin 
					controle_BANCOREG = 1'b1;
					controle_ALU = 3'bxxx;
					controle_MEMDADOS = 1'b0;
					controle_MUX1 = 1'b0;
					controle_MUX2 = 1'bx;
					controle_MUX3 = 2'b10;
					controle_MUX4 = 2'b00;
					controle_MUX6 = 1'b1;
					controle_OPT = 1'b0;
					HALT = 1;
				end
				
			end
			6'b111000: begin // out
				controle_BANCOREG = 1'b0;
				controle_ALU = 3'bxxx;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'bx;
				controle_MUX2 = 1'bx;
				controle_MUX3 = 2'bxx;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'bx;
				controle_OPT = 1'b1;
				HALT = 0;
			end
			6'b000000: begin // nop
				controle_BANCOREG = 1'b0;
				controle_ALU = 3'bxxx;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'bx;
				controle_MUX2 = 1'bx;
				controle_MUX3 = 2'bxx;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'bx;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b111110: begin // HALT
				if(botao) begin
					HALT = 0;
					controle_MUX4 = 2'b00;
				end
				else if (clock) begin
					controle_BANCOREG = 1'b0;
					controle_ALU = 3'bxxx;
					controle_MEMDADOS = 1'b0;
					controle_MUX1 = 1'bx;
					controle_MUX2 = 1'bx;
					controle_MUX3 = 2'bxx;
					controle_MUX4 = 2'b11;
					controle_MUX6 = 1'bx;
					controle_OPT = 1'b0;
					HALT = 1;
				end
			end
			
			// OPERACOES
			6'b111111: begin // jump
				controle_BANCOREG = 1'b0;
				controle_ALU = 3'bxxx;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'bx;
				controle_MUX2 = 1'bx;
				controle_MUX3 = 2'bxx;
				controle_MUX4 = 2'b11;
				controle_MUX6 = 1'bx;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b100000: begin // add
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b000;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b1;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b010000: begin // addi
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b000;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b0;
				controle_MUX2 = 1'b1;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b100001: begin // sub
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b001;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b1;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b010001: begin // subi
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b001;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b0;
				controle_MUX2 = 1'b1;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b100010: begin // and
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b010;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b1;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			
			6'b100011: begin // or
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b011;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b1;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b100100: begin // slt
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b110;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b1;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b010100: begin // slti
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b110;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b0;
				controle_MUX2 = 1'b1;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b100101: begin // equal
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b100;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b0;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'b00;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b011111: begin // lw
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'b000;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b0;
				controle_MUX2 = 1'b1;
				controle_MUX3 = 2'b01;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b011110: begin // sw
				controle_BANCOREG = 1'b0;
				controle_ALU = 3'bxxx;
				controle_MEMDADOS = 1'b1;
				controle_MUX1 = 1'bx;
				controle_MUX2 = 1'bx;
				controle_MUX3 = 2'bxx;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b010110: begin // beq
				controle_BANCOREG = 1'b0;
				controle_ALU = 3'b001;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'bx;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'bxx;
				controle_MUX4 = 2'b01;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b010111: begin // bnq
				controle_BANCOREG = 1'b0;
				controle_ALU = 3'b001;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'bx;
				controle_MUX2 = 1'b0;
				controle_MUX3 = 2'bxx;
				controle_MUX4 = 2'b10;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
			6'b011001: begin // loadi
				controle_BANCOREG = 1'b1;
				controle_ALU = 3'bxxx;
				controle_MEMDADOS = 1'b0;
				controle_MUX1 = 1'b0;
				controle_MUX2 = 1'bx;
				controle_MUX3 = 2'b10;
				controle_MUX4 = 2'b00;
				controle_MUX6 = 1'b0;
				controle_OPT = 1'b0;
				HALT = 0;
			end
		endcase 
	end
	
endmodule 