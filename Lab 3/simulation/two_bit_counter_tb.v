module two_bit_coutner_tb();
	
	reg clk;
	reg reset;
	wire [1:0] count;

	two_bit_counter DUT(.clk(clk), .reset(reset), .count(count));

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		reset = 0;
		
		#10;
		reset = 1;

		#10;
		reset = 0;

		
		#70;

	end

	
	

endmodule
