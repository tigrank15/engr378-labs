module single_pulser(KEY_DEBOUNCED, CLK, KEY_SYNC);
	
	input KEY_DEBOUNCED, CLK;
	output KEY_SYNC;
	
	wire Q0, Q1;
	
	d_ff d0(KEY_DEBOUNCED, CLK, Q0);
	d_ff d1(Q0, CLK, Q1);
	
	assign KEY_SYNC = ~(~Q0 & Q1);
	
endmodule