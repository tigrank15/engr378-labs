module s_s_display(sw, en, result);

	input [3:0] sw;
	input en;
	output reg [6:0] result;

	always @(*) begin
		if (~en) result = 7'b1111111;
		else begin
			case (sw)
				4'b0000:	result = 7'b0000001; // 0
				4'b0001:	result = 7'b1001111; // 1
				4'b0010:	result = 7'b0010010; // 2
				4'b0011:	result = 7'b0000110; // 3
				4'b0100:	result = 7'b1001100; // 4
				4'b0101:	result = 7'b0100100; // 5
				4'b0110:	result = 7'b0100000; // 6
				4'b0111:	result = 7'b0001111; // 7
				4'b1000:	result = 7'b0000000; // 8
				4'b1001:	result = 7'b0000100; // 9
				4'b1010:	result = 7'b0001000; // A
				4'b1011:	result = 7'b1100000; // B
				4'b1100:	result = 7'b0110001; // C
				4'b1101:	result = 7'b1000010; // D
				4'b1110:	result = 7'b0110000; // E
				4'b1111:	result = 7'b0111000; // F
			endcase
		end
	end

endmodule
