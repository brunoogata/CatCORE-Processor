module unidadeControle(opcode, clock, controle_MUX4, controle_MUX3, /*controle_MUX6,*/ controle_MUXN, controle_ALU, controle_MUX2, controle_escrita_BR, controle_D2_BR, controle_escrita_memdados, controle_OPT, controleJAL, HALT, enter);
	input [5:0] opcode;
	input clock;
	input enter;
	
	output reg [2:0] controle_MUX4;
	output reg [1:0] controle_MUX3;
	output reg [1:0] controle_MUXN;
	output reg [3:0] controle_ALU;
	output reg controle_MUX2;
	output reg controle_escrita_BR;
	output reg controle_D2_BR;
	output reg controle_escrita_memdados;
	output reg controle_OPT;
	output reg controleJAL;
	output reg HALT;
	//output reg controle_MUX6;
	
	always @ (opcode or enter) begin 
		case(opcode) 
			6'b000111: begin // INPUT
				if(enter) begin
					HALT = 0;
					controle_MUX4 = 3'b000;
				end
				else if(clock) begin
					controle_MUX4 = 3'b000;
					controle_MUX3 = 2'b11;
					controle_MUXN = 2'bxx;
					controle_ALU = 4'bxxxx;
					controle_MUX2 = 1'bx;
					controle_escrita_BR = 1'b1;
					controle_escrita_memdados = 1'b0;
					controle_D2_BR = 1'bx;
					controleJAL = 1'b0;
					controle_OPT = 1'b0;
					HALT = 1'b1;
				end
			end
			6'b100000: begin  //ADD
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0000;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b100001: begin // SUB
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0001;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b101010: begin // MULT
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1000;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b101011: begin // DIV
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1001;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b011111: begin // LW
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b01;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b000;
				controle_MUX2 = 1'b1;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b0;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end	
			6'b011110: begin // SW
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'b01;
				controle_ALU = 4'b0000;
				controle_MUX2 = 1'b1;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b1;
				controle_D2_BR = 1'b0;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b010000: begin // ADDI
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0000;
				controle_MUX2 = 1'b1;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end	
			6'b010001: begin // SUBI
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0001;
				controle_MUX2 = 1'b1;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b100100: begin //SMLEQ
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1011;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b100101: begin // SML
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0110;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b100110: begin // LGREQ
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1100;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b100111: begin // LGR
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1010;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
			end
			6'b101110: begin // EQ
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1101;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b011001: begin // LOADI
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b10;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'bxxxx;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'bx;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b011101: begin // LWR
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b01;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0000;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b011100: begin // SWR
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'b01;
				controle_ALU = 4'b0000;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b1;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b111111: begin // JUMP
				controle_MUX4 = 3'b011;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'bxxxx;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'bx;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b010111: begin // BNE
				controle_MUX4 = 3'b010;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0001;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b0;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b111110: begin // HALT
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b1000;
				controle_MUX2 = 1'b0;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controleJAL = 1'b0;
				controle_D2_BR = 1'b1;
				HALT = 1'b1;
			
				if(enter) begin
					HALT = 0;
				end
			end
			6'b000000: begin // NOP
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'bxxxx;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'bx;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b010100: begin // MOV
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'b00;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'b0100;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b1;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b011000: begin // JAL
				controle_MUX4 = 3'b011;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'b00;
				controle_ALU = 4'b0100;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b1;
				controle_D2_BR = 1'b1;
				controleJAL = 1'b1;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
			6'b111000: begin //OUTPUT
				controle_MUX4 = 3'b000;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'bxxxx;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'bx;
				controleJAL = 1'b0;
				controle_OPT = 1'b1;
				HALT = 1'b0;
				
				if(enter) begin
					HALT = 0;
				end
			end
			6'b011010: begin //JR
				controle_MUX4 = 3'b100;
				controle_MUX3 = 2'bxx;
				controle_MUXN = 2'bxx;
				controle_ALU = 4'bxxxx;
				controle_MUX2 = 1'bx;
				controle_escrita_BR = 1'b0;
				controle_escrita_memdados = 1'b0;
				controle_D2_BR = 1'bx;
				controleJAL = 1'b0;
				controle_OPT = 1'b0;
				HALT = 1'b0;
			end
		endcase 
	end
endmodule 