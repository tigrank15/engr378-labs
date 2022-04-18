module scoreboard(clk, reset, button1, button2, display_left, display_right);

	input clk, reset, button1, button2;
	output wire[6:0] display_left, display_right;
	reg[3:0] msd, lsd;
	reg[6:0] lookup_table[9:0];
	
	initial begin
		msd = 4'b0000;
		lsd = 4'b0000;
		
		lookup_table[0] = 7'b1000000;
		lookup_table[1] = 7'b1111001;
		lookup_table[2] = 7'b0100100;
		lookup_table[3] = 7'b0110000;
		lookup_table[4] = 7'b0011001;
		lookup_table[5] = 7'b0010010;
		lookup_table[6] = 7'b0000010;
		lookup_table[7] = 7'b1111000;
		lookup_table[8] = 7'b0000000;
		lookup_table[9] = 7'b0010000;
	end
		
	
	always @(posedge clk) begin
		if(button1 == 0) begin
			if(lsd < 4'b1001)
				lsd <= lsd+1;
			else begin
				if(msd < 4'b1001) begin
					lsd <= 4'b0000;
					msd <= msd + 1;
				end
			end
		end
		else if(button2 == 0) begin
			if(msd < 4'b1001)
				msd <= msd + 1;
		end
	end
	assign display_left = lookup_table[msd];
	assign display_right = lookup_table[lsd];
endmodule	