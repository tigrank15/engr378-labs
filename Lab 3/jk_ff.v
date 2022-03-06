module jk_ff(j, k, clk, q);

	input j, k, clk;
	output q;
	reg q_int;

	always @(posedge clk)
	begin
	
		if(j == 0 & k == 0)
			q_int <= q;
			
		else if(j == 0 & k == 1)
			q_int <= 0;
			
		else if(j == 1 & k == 0)
			q_int <= 1;
			
		else
			q_int <= ~q;
	
	end
	assign q = q_int;
	

endmodule