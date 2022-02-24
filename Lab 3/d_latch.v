module d_latch(G, D, Q, Q_bar);

	input G, D;
	output Q, Q_bar;

	reg Q_int;
	
	always @(*) begin
		if (G)
			Q_int <= D;
	end
	
	assign Q = Q_int;
	assign Q_bar = ~Q;

endmodule