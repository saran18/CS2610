`timescale 1ns/1ns

module tb();
    reg [11:0] op1,op2;
    wire [11:0] c;

    fp_adder f1(op1,op2,c);
    initial begin
		$dumpfile ("tb.vcd");
		$dumpvars (0,tb);
		op1 = 12'b010011100000; 
		op2 = 12'b010000000000; #20;
		op1 = 12'b010011101000; 
		op2 = 12'b010000010000; #20;
		op1 = 12'b010011010000; 
		op2 = 12'b001110000000; #20;
		op1 = 12'b010011000000; 
		op2 = 12'b001110000000; #20;
		op1 = 12'b010000000000; 
		op2 = 12'b001110000000; #20;
        op2 = 12'b000010000000; 
		op1 = 12'b011000000000; #20;
		
		$display ("Test Completed");
	end
endmodule