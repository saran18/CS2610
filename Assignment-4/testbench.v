`timescale 1ns/1ns

module tb();
    reg [11:0] op1,op2;
    wire [11:0] c;
    wire of;
    fp_multiplier fp1(op1,op2,of,c);
    initial begin
        $dumpfile ("tb.vcd");
		$dumpvars (0,tb);
		op1 = 12'b010001000000; 
		op2 = 12'b010011000000; #20;

		op1 = 12'b110001000000; 
		op2 = 12'b010011000000; #20;

		op1 = 12'b010010000000; 
		op2 = 12'b001110000000; #20;

		op1 = 12'b001110000000; 
		op2 = 12'b110010000000; #20;

		op1 = 12'b011000000000; 
		op2 = 12'b011010000000; #20;
        
        op1 = 12'b000010000000; 
		op2 = 12'b000110000000; #20;
		
		$display ("Test Completed");
	end
endmodule