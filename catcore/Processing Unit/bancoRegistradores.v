module bancoRegistradores (write_reg, read1, read2, data, D1, D2, SWR, controleEscrita, controleD2, controleJAL, clock, clockAuto);
	input [4:0] read1;
	input [4:0] read2;
	input [4:0] write_reg;
	input [31:0] data;
	input clock, controleEscrita, controleD2, controleJAL;
	input clockAuto;
	
	reg [31:0] registradores[31:0];

	output reg [31:0] D1;
	output reg [31:0] D2;
	output reg [31:0] SWR;
	
	integer flag = 1;
	
	always @ (posedge clock) begin
		if(controleEscrita == 1) registradores[write_reg] = data;
		if(flag == 1) begin
			registradores[27] = 0; // $dl
			registradores[28] = 48; // $sp
			registradores[29] = 49; // $gp
			registradores[30] = 0; // $ap
			registradores[31] = 1; // $RTRUE
			flag = 0;
		end
		
	end
	
	always @ (posedge clockAuto) begin
		D1 <= controleJAL == 1 ? registradores[30] : registradores[read1];
		D2 <= controleD2 == 1 ? registradores[read2] : registradores[write_reg];
		SWR <= registradores[write_reg];
	end 
/*
	assign D1 = controleJAL == 1 ? registradores[30] : registradores[read1];
	assign D2 = controleD2 == 1 ? registradores[read2] : registradores[write_reg];
	assign SWR = registradores[write_reg];*/
endmodule 