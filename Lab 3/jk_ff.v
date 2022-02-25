module jk_ff(j, k, clk, q, q_n);

	input j, k, clk;
	output q, q_n;
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
	assign q_n = ~q;

endmodule