module x_logic(A, S1, S0, X);

	input A, S1, S0;
	output X;
	
	assign X = (~S1 && A) || (S1 && ~S0 && ~A);
	
endmodule