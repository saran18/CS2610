`timescale 1ns / 1ps

module unsign();
	reg [7:0] op1,op2;
	wire [7:0] result;
	wire of;
	unsigned_mult uut (op1,op2,result,of);
	initial begin
		$dumpfile ("unsigned.vcd");
		$dumpvars (0,unsign);
		op1 = 8'b00101010; 
		op2 = 8'b00000100; #20;
		op1 = 8'b00000010; 
		op2 = 8'b01001100; #20;
		op1 = 8'b10000000; 
		op2 = 8'b00000100; #20;
		
		$display ("Test Completed");
	end
endmodule