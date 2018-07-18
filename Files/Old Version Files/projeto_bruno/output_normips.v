module output_normips (binario, unidade, dezena, centena, milhar, d_milhar, c_milhar, milhao, d_milhao, clock, controle);
	input clock, controle;
	input [31:0] binario;
	
	reg [31:0] aux_binario;
	
	output [6:0] unidade, dezena, centena, milhar, d_milhar, c_milhar, milhao, d_milhao;
	
	wire [3:0] bin_unidade, bin_dezena, bin_centena, bin_milhar, bin_dmilhar, bin_cmilhar, bin_milhao, bin_dmilhao;

	binario_bcd binario_bcd(binario, bin_unidade, bin_dezena, 
									bin_centena, bin_milhar, bin_dmilhar, 
									bin_cmilhar, bin_milhao, bin_dmilhao);
	
	sete_segmentos displayA(bin_unidade, unidade[0], unidade[1], 
									unidade[2], unidade[3], unidade[4], 
									unidade[5], unidade[6], clock, controle);
											
	sete_segmentos displayB(bin_dezena, dezena[0], dezena[1],
									dezena[2], dezena[3], dezena[4],
									dezena[5], dezena[6], clock, controle);
	
	sete_segmentos displayC(bin_centena, centena[0], centena[1],
									centena[2], centena[3], centena[4],
									centena[5], centena[6], clock, controle);
	
	sete_segmentos displayD(bin_milhar, milhar[0], milhar[1],
									milhar[2], milhar[3], milhar[4],
									milhar[5], milhar[6], clock, controle);
	
	sete_segmentos displayE(bin_dmilhar, d_milhar[0], d_milhar[1],
									d_milhar[2], d_milhar[3], d_milhar[4],
									d_milhar[5], d_milhar[6], clock, controle);
									
	sete_segmentos displayF(bin_cmilhar, c_milhar[0], c_milhar[1],
									c_milhar[2], c_milhar[3], c_milhar[4],
									c_milhar[5], c_milhar[6], clock, controle);
									
	sete_segmentos displayG(bin_milhao, milhao[0], milhao[1],
									milhao[2], milhao[3], milhao[4],
									milhao[5], milhao[6], clock, controle);
									
	sete_segmentos displayH(bin_dmilhao, d_milhao[0], d_milhao[1],
									d_milhao[2], d_milhao[3], d_milhao[4],
									d_milhao[5], d_milhao[6], clock, controle);
	
endmodule 