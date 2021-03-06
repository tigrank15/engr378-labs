module top(A, B, S1, S0, Cin, F, Cout);

	input [3:0] A, B;
	input Cin, S1, S0;
	output [3:0] F;
	output Cout;
	
	wire [3:0] out_carry;
	
	full_adder bit_0(.A(A[0]), .B(B[0]), .S1(S1), .S0(S0), .Cin(Cin), .F(F[0]), .Cout(out_carry[0]));
	full_adder bit_1(.A(A[1]), .B(B[1]), .S1(S1), .S0(S0), .Cin(out_carry[0]), .F(F[1]), .Cout(out_carry[1]));
	full_adder bit_2(.A(A[2]), .B(B[2]), .S1(S1), .S0(S0), .Cin(out_carry[1]), .F(F[2]), .Cout(out_carry[2]));
	full_adder bit_3(.A(A[3]), .B(B[3]), .S1(S1), .S0(S0), .Cin(out_carry[2]), .F(F[3]), .Cout(out_carry[3]));
	
	assign Cout = out_carry[3];

endmodule