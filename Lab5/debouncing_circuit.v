module debouncing_circuit(KEY, CLK, KEY_DEBOUNCED);

	input KEY, CLK;
	output KEY_DEBOUNCED;
	
	wire Q0, Q1, Q2;

	d_ff d0(KEY, CLK, Q0);
	d_ff d1(Q0, CLK, Q1);
	d_ff d2(Q1, CLK, Q2);
	
	assign KEY_DEBOUNCED = Q0 | Q1 | Q2;
	
//	//assign Q2_bar = ~Q2;
//	assign SYNC_PRESS = ~Q1 & Q2;

	
	
endmodule