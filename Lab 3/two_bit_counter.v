module two_bit_counter(clk, reset, count);

	input clk, reset;
	output [1:0] count;

	jk_ff ff_a(.j(~reset & count[0]), .k(reset | count[0]), .clk(clk), .q(count[1]));
	jk_ff ff_b(.j(~reset), .k(1'b1), .clk(clk), .q(count[0]));

	//assign #10 clk = ~clk;


endmodule