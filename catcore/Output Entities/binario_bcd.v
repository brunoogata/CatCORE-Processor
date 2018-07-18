module binario_bcd(binario, unidade, dezena, centena, milhar, d_milhar, c_milhar, milhao, d_milhao);

	input [31:0] binario;
	
	output reg [3:0] unidade, dezena, centena, milhar, d_milhar, c_milhar, milhao, d_milhao;
	
	integer i;
	
	always @ (binario) begin
		unidade = 4'b0;
		dezena = 4'b0;
		centena = 4'b0;
		milhar = 4'b0;
		d_milhar = 4'b0;
		c_milhar = 4'b0;
		milhao = 4'b0;
		d_milhao = 4'b0;
		
		for(i = 31; i >= 0; i = i - 1) begin
			if(unidade >= 5)
				unidade = unidade + 3;
			if(dezena >= 5)
				dezena = dezena + 3;
			if(centena >= 5)
				centena = centena + 3;
			if(milhar >= 5)
				milhar = milhar + 3;
			if(d_milhar >= 5)
				d_milhar = d_milhar + 3;
			if(c_milhar >= 5)
				c_milhar = c_milhar + 3;
			if(milhao >= 5)
				milhao = milhao + 3;
			if(d_milhao >= 5)
				d_milhao = d_milhao + 3;	
				
			d_milhao = d_milhao << 1; 
			d_milhao[0] = milhao[3];
			milhao = milhao << 1;
			milhao[0] = c_milhar[3];
			c_milhar = c_milhar << 1;
			c_milhar[0] = d_milhar[3];
			d_milhar = d_milhar << 1;
			d_milhar[0] = milhar[3];
			milhar = milhar << 1;
			milhar[0] = centena[3];
			centena = centena << 1;
			centena[0] = dezena[3];
			dezena = dezena << 1;
			dezena[0] = unidade[3];
			unidade = unidade << 1;
			unidade[0] = binario[i];
		end
	end
	
endmodule 