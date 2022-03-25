module converter_module(sw, btn, mode, MSB, LSB);
	
	input [3:0] sw;
	input [2:0] btn;
	output [6:0] mode, MSB, LSB;

	reg en_msb, en_lsb;
	reg [3:0] sw_int_msb;
	reg [3:0] sw_int_lsb;

	always @(*) begin
		case (btn)
			3'b011:	begin
					en_msb = 0;
					en_lsb = 1;
					sw_int_lsb = sw;

				end

			3'b101: begin
					en_msb = 0;
					en_lsb = 1;

					if (sw >= 4'b1001)
						sw_int_lsb = 4'b1001;
				end

			3'b110: begin
					en_msb = 1;
					en_lsb = 1;

					if (sw > 4'b1001) begin
						sw_int_lsb = sw % 4'b1010;
						sw_int_msb = sw / 4'b1010;
					end

					else begin
						sw_int_lsb = sw;
						sw_int_msb = 4'b0000;
					
					end
				end

			default: begin
					en_msb = 0;
					en_lsb = 0;
				end
		endcase
	end

	mode_display d_mode(.btn(btn), .result(mode));
	s_s_display d_msb(.sw(sw_int_msb), .en(en_msb), .result(MSB));
	s_s_display d_lsb(.sw(sw_int_lsb), .en(en_lsb), .result(LSB));

endmodule
