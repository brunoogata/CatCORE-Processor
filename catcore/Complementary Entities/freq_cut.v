module freq_cut(clk_in,clk_out);

input clk_in;
output reg clk_out;
reg[24:0] clk_val;

always @ (posedge clk_in)
	begin
		clk_val <= clk_val + 1;
		if(clk_val == 1_0)
		begin
			clk_val <= 0;
			clk_out <= ~clk_out;
		end	
	end	
endmodule