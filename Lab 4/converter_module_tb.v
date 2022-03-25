module converter_module_tb();
	
	reg [3:0] sw;
	reg [2:0] btn;
	wire [6:0] mode, MSB, LSB; 

	converter_module DUT(.sw(sw), .btn(btn), .mode(mode), .MSB(MSB), .LSB(LSB));

	initial begin
		sw = 0000;
		btn = 011;
		
		

	end

endmodule