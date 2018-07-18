module memoriaInstrucao(endereco, instrucao, clock);

	// input
	input [31:0] endereco;
	input clock;

	// registradores
	reg [31:0] registradores_instrucao[70:0]; 
	
	// output
	output [31:0] instrucao;
	
	// inicializador
	
	always @ (posedge clock) begin
	
			/* add
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b01111100000000010000000000000111; // LW R$1 ADDRESS 7
			registradores_instrucao[2] = 32'b10000000000000010001000000000000; // ADD R$0 R$1 R$2  
			*/
			
			/* addi 
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b010000_00000_00001_0000000000001110; // ADDI R$0 R$1 IMED 14 
			*/

			/* sw
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b01111100000000010000000000000111; // LW R$1 ADDRESS 7
			registradores_instrucao[2] = 32'b10000000000000010001000000000000; // ADD R$0 R$1 R$2
			registradores_instrucao[3] = 32'b01111000000000100000000000000010; // SW R$2 ADDRESS 2 
			registradores_instrucao[4] = 32'b01111100000000000000000000000010; // LW R$0 ADDRESS 2
			*/
			
			/* beq
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b01111100000000010000000000000111; // LW R$1 ADDRESS 7
			registradores_instrucao[2] = 32'b01011000000000010000000000010000; // BEQ R$0 R$1 ADDRESS 16
			registradores_instrucao[16] = 32'b01111100000000000000000000001000; // LW R$0 ADDRESS 8
			*/
			
			/* jump
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b01111100000000010000000000000111; // LW R$1 ADDRESS 7
			registradores_instrucao[2] = 32'b10000000000000010001000000000000; // ADD R$0 R$1 R$2
			registradores_instrucao[3] = 32'b11111100000000000000000000000000; // JUMP ADDRESS 0
			*/
			
			/* nop
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b01111100000000010000000000000111; // LW R$1 ADDRESS 7
			registradores_instrucao[2] = 32'b10000000000000010001000000000000; // ADD R$0 R$1 R$2  
			registradores_instrucao[3] = 32'b00000000000000000000000000000000; // NOP
			*/
			
			/* halt
			registradores_instrucao[0] = 32'b01111100000000000000000000000101; // LW R$0 ADDRESS 5
			registradores_instrucao[1] = 32'b01111100000000010000000000000111; // LW R$1 ADDRESS 7
			registradores_instrucao[2] = 32'b10000000000000010001000000000000; // ADD R$0 R$1 R$2  
			registradores_instrucao[3] = 32'b11111000000000000000000000000000; // HALT
			*/
			
			/*
			registradores_instrucao[0] = 32'b011111_00000_00000_0000000000000010; // LW R$0 ADDRESS 2
			registradores_instrucao[1] = 32'b011111_00000_00001_0000000000000011; // LW R$1 ADDRESS 3 
			registradores_instrucao[2] = 32'b011111_00000_00011_0000000000000101; // LW R$3 ADDRESS 5
			registradores_instrucao[3] = 32'b100000_00000_00001_00001_00000000000; // ADD R$0 R$1 R$1
			registradores_instrucao[4] = 32'b111000_00000_00001_0000000000000000; // OPT R$1
			registradores_instrucao[5] = 32'b010111_00001_00011_0000000000000011; // BNQ R$1 R$3 ADDRESS 3
			registradores_instrucao[6] = 32'b111000_00000_00001_0000000000000000; // OPT R$1
			registradores_instrucao[7] = 32'b11111000000000000000000000000000; // HALT
			*/
			
			/* Fibonacci
			registradores_instrucao[0] = 32'b011111_00000_00000_0000000000000001; // LW R$0 ADDRESS 1 // a = 0
			registradores_instrucao[1] = 32'b011111_00000_00001_0000000000000010; // LW R$1 ADDRESS 2 // b = 1
			//registradores_instrucao[2] = 32'b011111_00000_00111_0000000000000011; // LW R$7 ADDRESS 3 // n = 5
			registradores_instrucao[2] = 32'b000111_00000_00111_0000000000000000; // IN R$0 SWITCH 7
			registradores_instrucao[3] = 32'b111000_00000_00111_0000000000000000; // OPT R$0
			registradores_instrucao[4] = 32'b011111_00000_01000_0000000000000001; // LW R$8 ADDRESS 1 // i = 0
			registradores_instrucao[5] = 32'b010001_00111_00111_0000000000000010; 
			registradores_instrucao[6] = 32'b010000_01000_01000_0000000000000001; // ADDI R$8 R$8 IMED 1 // i + 1
			registradores_instrucao[7] = 32'b100000_00000_00001_00010_00000000000; // ADD R$0 R$1 R$2 // aux = a + b
			registradores_instrucao[8] = 32'b100101_00001_00000_00000_00000000000; // EQUAL R$1 R$0 // a = b
			registradores_instrucao[9] = 32'b100101_00010_00000_00001_00000000000; // EQUAL R$2 R$1 // b = aux
			registradores_instrucao[10] = 32'b111000_00000_00010_0000000000000000; // OPT R$2
			registradores_instrucao[11] = 32'b010111_01000_00111_0000000000000100; // BNQ R$8 R$7 ADDRESS 4 // i != n
			registradores_instrucao[12] = 32'b111000_00000_00010_0000000000000000; // OPT R$2
			//registradores_instrucao[9] = 32'b011110_00000_00010_0000000000000111; // SW R$2 ADDRESS 7 
			//registradores_instrucao[10] = 32'b011111_00000_01111_0000000000000111; // LW R$15 ADDRESS 7
			*/
			
			/* Input
			registradores_instrucao[0] = 32'b00000000000000000000000000000000; // NOP
			registradores_instrucao[1] = 32'b000111_00000_00000_0000000000000000; // IN R$0 SWITCH 7
			registradores_instrucao[2] = 32'b111000_00000_00000_0000000000000000; // OPT R$0
			registradores_instrucao[3] = 32'b000111_00000_00001_0000000000000000; // IN R$1 SWITCH 3
			registradores_instrucao[4] = 32'b111000_00000_00001_0000000000000000; // OPT R$1
			registradores_instrucao[5] = 32'b100000_00000_00001_00010_00000000000; // ADD R$0 R$1 R$2
			registradores_instrucao[6] = 32'b011110_00000_00010_0000000000000111; // SW R$2 ADDRESS 7 
			registradores_instrucao[7] = 32'b011111_00000_01111_0000000000000111; // LW R$15 ADDRESS 7
			registradores_instrucao[8] = 32'b111000_00000_01111_0000000000000000; // OPT R$15
			*/
			
			// IN R$0 SWITCH
			// OPT R$0
			// LDI R$1 IMED 0 // a = 0
			// LDI R$2 IMED 1 // b = 1
			// LDI R$7 IMED 0 // i = 0
			// BEQ R$0 R$2 GO TO LINHA X
			// SUBI R$0 R$0 IMED 2
			// ADD R$1 R$2 R$3 // aux = a + b LINHA Y
			// MOV R$2 R$1 // a = b
			// MOV R$3 R$2 // b = aux
			// BNQ R$0 R$7 GO TO LINHA Y
			// OPT R$3
			// JUMP HALT
			// LINHA  X -> OPT R$1
			//registradores_instrucao[0] = 32'b011001_00000_00010_0000000011000010; // LDI
			/**/
			/*
			registradores_instrucao[0] = 32'b000111_00000_00000_0000000000000000; // IN R$0 SWITCH 7
			registradores_instrucao[1] = 32'b111000_00000_00000_0000000000000000; // OPT R$0
			registradores_instrucao[2] = 32'b011001_00000_00001_0000000000000000; // LOADI R$1 IMED 0
			registradores_instrucao[3] = 32'b011001_00000_00010_0000000000000001; // LOADI R$2 IMED 1
			registradores_instrucao[4] = 32'b011001_00000_00111_0000000000000000; // LOADI R$7 IMED 0
			registradores_instrucao[5] = 32'b111000_00000_00001_0000000000000000; // OPT R$1
			registradores_instrucao[6] = 32'b111000_00000_00010_0000000000000000; // OPT R$2
			registradores_instrucao[7] = 32'b111000_00000_00111_0000000000000000; // OPT R$7
			registradores_instrucao[8] = 32'b010110_00000_00010_0000000000010010; // BEQ R$0 R$2 
			registradores_instrucao[9] = 32'b010001_00000_00000_0000000000000010; // SUBI R$0 R$0 IMED 2
			registradores_instrucao[10] = 32'b100000_00001_00010_00011_00000000000; // ADD R$1 R$2 R$3
			registradores_instrucao[11] = 32'b100101_00010_00001_0000000000000000; // MOV R$2 R$1 
			registradores_instrucao[12] = 32'b100101_00011_00010_0000000000000000; // MOV R$3 R$2
			registradores_instrucao[13] = 32'b100001_00111_00111_0000000000000001; // ADDI R$7 R$7 IMED 1
			registradores_instrucao[14] = 32'b111000_00000_00011_0000000000000000; // OPT R$3
			registradores_instrucao[15] = 32'b010111_00000_00111_0000000000001010; // BNQ R$0 R$7
			registradores_instrucao[16] = 32'b111000_00000_00011_0000000000000000; // OPT R$3
			registradores_instrucao[17] = 32'b111111_00000000000000000000010011; // JUMP ADDRESS 14
			registradores_instrucao[18] = 32'b111000_00000_00001_0000000000000000; // OPT R$1
			registradores_instrucao[19] = 32'b111110_00000_00000_0000000000000000; // HALT
			*/
			/*
			registradores_instrucao[0] = 32'b011001_00000_00001_0000000000000000; // LOADI R$1 IMED 0
			registradores_instrucao[1] = 32'b011001_00000_00000_0000000000000001; // LOADI R$0 IMED 1
			registradores_instrucao[2] = 32'b010110_00000_00001_0000000000000100;
			registradores_instrucao[3] = 32'b111000_00000_00000_0000000000000000;
			registradores_instrucao[4] = 32'b111000_00000_00001_0000000000000001;
			*/
			/*
			registradores_instrucao[0] = 32'b000111_00000_00000_0000000000000000; // IN R$0 SWITCH 7
			registradores_instrucao[1] = 32'b111000_00000_00000_0000000000000000; // OPT R$0
			registradores_instrucao[2] = 32'b011001_00000_00001_0000000000000000; // LOADI R$1 IMED 0
			registradores_instrucao[3] = 32'b011001_00000_00010_0000000000000001; // LOADI R$2 IMED 1
			registradores_instrucao[4] = 32'b011001_00000_00111_0000000000000000; // LOADI R$7 IMED 0
			registradores_instrucao[5] = 32'b111000_00000_00001_0000000000000000; // 
			registradores_instrucao[6] = 32'b111000_00000_00010_0000000000000000;
			registradores_instrucao[7] = 32'b111000_00000_00111_0000000000000000;
			registradores_instrucao[8] = 32'b010000_00111_00111_0000000000000001; // ADDI r7 + 1
			registradores_instrucao[9] = 32'b111000_00000_00111_0000000000000000;
			registradores_instrucao[10] = 32'b010111_00111_00000_0000000000000100;
			*/
			
			/* Fibonacci
			registradores_instrucao[0] = 32'b000111_00000_00000_0000000000000000; // IN r0
			registradores_instrucao[1] = 32'b111000_00000_00000_0000000000000000; // OPT
			registradores_instrucao[2] = 32'b011001_00000_00001_0000000000000000; // LOADI R$1 IMED 0
			registradores_instrucao[3] = 32'b011001_00000_00010_0000000000000000; // LOADI r2 IMED 0 // a = 0
			registradores_instrucao[4] = 32'b011001_00000_00011_0000000000000001; // LOADI r3 IMED 1 // B = 1
			registradores_instrucao[5] = 32'b010110_00000_00011_0000000000001100; // BEQ r0 r3 linha 12
			registradores_instrucao[6] = 32'b010001_00000_00000_0000000000000001; // SUBI r0 r0 IMED 1
			registradores_instrucao[7] = 32'b100000_00010_00011_00100_00000000000; // ADD r2 r3 r4 // aux = a + b
			registradores_instrucao[8] = 32'b100101_00011_00010_0000000000000000; // MOV r3 r2 // a = b
			registradores_instrucao[9] = 32'b100101_00100_00011_0000000000000000; // MOV r4 r3 // b = aux
			registradores_instrucao[10] = 32'b010000_00001_00001_0000000000000001; // ADDI r1 1
			registradores_instrucao[11] = 32'b111000_00000_00100_0000000000000000; // OPT r4
			registradores_instrucao[12] = 32'b010111_00000_00001_0000000000000110; // BNQ r0 r1 ad 6
			registradores_instrucao[13] = 32'b111111_00000_00000_0000000000001101; // JUMP
			registradores_instrucao[14] = 32'b011001_00000_00100_0000000000000001; // LOADI r4 IMED 1
			registradores_instrucao[15] = 32'b011110_00000_00100_0000000000000001; // SW r4 address 1
			registradores_instrucao[16] = 32'b011111_00000_00111_0000000000000001; // LW r7 address 1
			registradores_instrucao[17] = 32'b111000_00000_00111_0000000000000000; // OPT r7
			*/
			
			/*Extra*/
			registradores_instrucao[0] = 32'b000000_00000_00000_0000000000000000; // NOP
			registradores_instrucao[1] = 32'b011001_00000_00001_0000000000000001; // LOADI r1 1
			registradores_instrucao[2] = 32'b011001_00000_00010_0000000000000001; // LOADI r2 1
			registradores_instrucao[3] = 32'b011001_00000_00000_0000000000000000; // LOADI r0 0
			registradores_instrucao[4] = 32'b011001_00000_00101_0000000000000001; // LOADI r5 1
			registradores_instrucao[5] = 32'b111111_00000_00000_0000000000001000; //JUMP 8
			registradores_instrucao[6] = 32'b100001_00001_00010_00001_00000000000; // SUB r1 r2 r1
			registradores_instrucao[7] = 32'b010000_00000_00000_0000000000000001; // ADDI r0 r0 1
			registradores_instrucao[8] = 32'b100010_00001_00010_00011_00000000000; // AND r1 r2 r3
			registradores_instrucao[9] = 32'b100011_00001_00010_00011_00000000000; // OR r1 r2 r4
			registradores_instrucao[10] = 32'b111000_00000_00011_0000000000000000; // OPT r3
			registradores_instrucao[11] = 32'b111000_00000_00100_0000000000000000; // OPT r4 
			registradores_instrucao[12] = 32'b010111_00000_00101_0000000000000110; // BNQ r0 r5 
			registradores_instrucao[13] = 32'b100100_00001_00010_00001_00000000000; // SLT r1 r2 r1
			registradores_instrucao[14] = 32'b100001_00010_00001_00010_00000000000; // SUB r2 r1 r2
			registradores_instrucao[15] = 32'b100010_00001_00010_00011_00000000000; // AND r1 r2 r3
			registradores_instrucao[16] = 32'b100011_00001_00010_00011_00000000000; // OR r1 r2 r4
			registradores_instrucao[17] = 32'b111000_00000_00011_0000000000000000; // OPT r3
			registradores_instrucao[18] = 32'b111000_00000_00100_0000000000000000; // OPT r4 
			registradores_instrucao[19] = 32'b100001_00001_00101_00001_00000000000; // SUB r1 r5 r1;
			registradores_instrucao[20] = 32'b100010_00001_00010_00011_00000000000; // AND r1 r2 r3
			registradores_instrucao[21] = 32'b100011_00001_00010_00011_00000000000; // OR r1 r2 r4
			registradores_instrucao[22] = 32'b111000_00000_00011_0000000000000000; // OPT r3
			registradores_instrucao[23] = 32'b111000_00000_00100_0000000000000000; // OPT r4 
	end 
	
	assign instrucao = registradores_instrucao[endereco];	
endmodule 
	