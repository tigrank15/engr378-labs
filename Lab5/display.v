module display(digit, result);

	input [3:0] digit;
	output reg [6:0] result;
	//reg [6:0] result_int;
	
	always @(*) begin
		case(digit)
				4'd0:	result = 7'b1000000; // 0
				4'd1:	result = 7'b1111001; // 1
				4'd2:	result = 7'b0100100; // 2
				4'd3: result = 7'b0110000; // 3
				4'd4: result = 7'b0011001; // 4
				4'd5: result = 7'b0010010; // 5
				4'd6: result = 7'b0000010; // 6
				4'd7: result = 7'b1111000; // 7
				4'd8: result = 7'b0000000; // 8
				4'd9: result = 7'b0010000; // 9
				default: result = 7'b1111111; // off
		endcase
	
	end
	

endmodule