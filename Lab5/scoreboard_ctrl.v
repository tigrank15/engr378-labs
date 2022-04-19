module scoreboard_ctrl(clk, inc1, inc10, rst, seg7disp1, seg7disp0);

	input clk, rst, inc1, inc10;
	output [6:0] seg7disp1, seg7disp0;
	
	reg state;
	reg [3:0] BCD1, BCD0;
	reg [27:0] rstcnt;
	reg [6:0] seg7Rom[0:9];
	
	wire inc1_debounced, inc10_debounced, rst_debounced;
	wire inc1_sync, inc10_sync;
	
	debouncing_circuit debounce1(inc1, clk, inc1_debounced);
	debouncing_circuit debounce10(inc10, clk, inc10_debounced);
	debouncing_circuit debounce_reset(rst, clk, rst_debounced);
	
	single_pulser pulse1(inc1_debounced, clk, inc1_sync);
	single_pulser pulse10(inc10_debounced, clk, inc10_sync);
	
	initial begin
		BCD1 = 4'b0000;
		BCD0 = 4'b0000;
		rstcnt = 0;
		state = 0;
		
		seg7Rom[0] = 7'b1000000;
		seg7Rom[1] = 7'b1111001;
		seg7Rom[2] = 7'b0100100;
		seg7Rom[3] = 7'b0110000;
		seg7Rom[4] = 7'b0011001;
		seg7Rom[5] = 7'b0010010;
		seg7Rom[6] = 7'b0000010;
		seg7Rom[7] = 7'b1111000;
		seg7Rom[8] = 7'b0000000;
		seg7Rom[9] = 7'b0010000;
	end
	
	always @(posedge clk) begin
		//if (~inc1_sync | ~inc10_sync) begin
		case (state)
			0:	begin
					BCD1 <= 4'b0000;
					BCD0 <= 4'b0000;
					rstcnt <= 0;
					state <= 1;
				end
				
			1:	begin
					if (rst_debounced == 1'b0) begin
							if (rstcnt == 150000000) 
								state <= 0;
							else
								rstcnt <= rstcnt + 1;
					end
					
					else if (inc1_sync == 1'b0 && inc10_sync == 1'b1) begin
						rstcnt <= 0;
						if (BCD0 < 4'b1001)
							BCD0 <= BCD0 + 1;
						else if (BCD1 < 4'b1001) begin
							BCD1 <= BCD1 + 1;
							BCD0 <= 4'b0000;
						end
					end
					
					else if (inc1_sync == 1'b1 && inc10_sync == 1'b0) begin
						rstcnt <= 0;
						if (BCD1 <= 4'b1000)
							BCD1 <= BCD1 + 1;
//						else if (BCD1 > 4'b0000) begin
//							BCD1 <= BCD1 - 1;
//							BCD0 <= 4'b1001;
//						end
					end
					
					else if (inc1_sync == 1'b0 && inc10_sync == 1'b0)
						rstcnt <= 0;
				end
		endcase
		//end
	
	
	end
	
	assign seg7disp0 = seg7Rom[BCD0];
	assign seg7disp1 = seg7Rom[BCD1];
	
endmodule