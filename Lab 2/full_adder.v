module full_adder(A, B, S1, S0, Cin, F, Cout);

	input A, B, Cin, S1, S0;
	output F, Cout;
	
	wire in_x;
	wire in_y;
	
	x_logic x(.A(A), .S1(S1), .S0(S0), .X(in_x));
	y_logic y(.S0(S0), .B(B), .Y(in_y));
	
	assign {Cout, F} = in_x + in_y + Cin;

endmodule