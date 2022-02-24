module d_latch_tb();
	
	reg G, D;
	wire Q, Q_bar;
	
	d_latch DUT(.G(G), .D(D), .Q(Q), .Q_bar(Q_bar));
	
	initial begin
		// Enable G, D = 0, expected Q = 0
		G = 1'b1;
		D = 1'b0;
		
		#10;
		
		// Enable G, D = 1, expected Q = 1
		D = 1'b1;
		
		#10;
		
		// Disable G, D = 0, expeted Q = 1	
		G = 1'b0;
		D = 1'b0;
		
		#10;
		
		// Disable G, D = 1, expected Q = 1
		D = 1'b1;
		
		#10;
		$stop;
		
	end
	
endmodule