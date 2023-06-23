`timescale 1ns / 1ps

module sign();
	reg [7:0] op1,op2;
	wire [7:0] result;
	wire of;
	signed_mult uut (op1,op2,result,of);
	initial begin
		$dumpfile ("signed.vcd");
		$dumpvars (0,sign);
		op1 = 8'b00001000; 
		op2 = 8'b00000100; #20;
		op1 = 8'b00010000; 
		op2 = 8'b11111100; #20;
		op1 = 8'b11111010; 
		op2 = 8'b00000100; #20;
        op1 = 8'b11111010; 
		op2 = 8'b11111001; #20;

        op1 = 8'b01111000; 
		op2 = 8'b01111001; #20;
        op1 = 8'b10001000; 
		op2 = 8'b01111001; #20;
		
		$display ("Test Completed");
	end
endmodule