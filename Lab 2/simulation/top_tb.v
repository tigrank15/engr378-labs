module top_tb();
	
	reg [3:0] a, b; 
	reg cin, s1, s0;
	wire cout;
	wire [3:0] f;
	
	top DUT(.A(a), .B(b), .S1(s1), .S0(s0), .Cin(cin), .F(f), .Cout(cout));

	initial
		begin
			// Case 1: S1 = 0, S0 = 0, Cin = 0, F = A + B 
			// Expected output F = 1111
			s1 = 0;
			s0 = 0;
			cin = 0;

			a = 4'b0101;
			b = 4'b1010;

			#10
			// Case 2: S1 = 0, S0 = 1, Cin = 0, F = A + ~B
			// Expected output F = 0101
			s1 = 0;
			s0 = 1;
			
			a = 4'b0101;
			b = 4'b1111;
			#10

			// Case 3: S1 = 1; S0 = 0, Cin = 0, F = ~A + B
			// Expected output F = 0101
			s1 = 1;
			s0 = 0;
			
			a = 4'b1111;
			b = 4'b0101;
			#10

			// Case 4: S1 = 1, S0 = 1, Cin = 0, F = ~B
			// Expected output F = 1111
			s1 = 1;
			s0 = 1;

			b = 4'b0;
			#10

			// Case 5: S1 = 0, S0 = 0, Cin = 1, F = A + B + 1
			// Expected output F = 0000, Cout = 1
			s1 = 0;
			s0 = 0;
			cin = 1;
			
			a = 4'b0;
			b = 4'b1111;
			#10

			// Case 6: S1 = 0, S0 = 1, Cin = 1, F = A + ~B + 1
			// Expected output F = 1110, Cout = 1
			s1 = 0;
			s0 = 1;

			a = 4'b1111;
			b = 4'b0001;
			#10

			// Case 7: S1 = 1, S0 = 0, Cin = 1, F = ~A + B + 1
			// Expected output F = 1110, Cout = 1
			s1 = 1;
			s0 = 0;
			
			a = 4'b0001;
			b = 4'b1111;
			#10

			// Case 8: S1 = 1, S0 = 1, Cin = 1, F = ~B + 1
			// Expected output F = 1111, Cout = 0
			s1 = 1;
			s0 = 1;

			b = 4'b0001;
			#10
			$stop;
		end
endmodule
