module mode_display(btn, result);

	input [2:0] btn;
	output reg [6:0] result;

	always @(*) begin
		case (btn)
			3'b011:	result = 7'b1001000; // H
			3'b101:	result = 7'b1100000; // b
			3'b110:	result = 7'b1000010; // d
			default: result = 7'b1111111; // off
		endcase
	end

endmodule
