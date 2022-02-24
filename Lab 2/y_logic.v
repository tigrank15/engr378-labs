module y_logic(S0, B, Y);

	input S0, B;
	output Y;
	
	assign Y = S0 ^ B;

endmodule