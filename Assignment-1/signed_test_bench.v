`timescale 1ns/1ps

module test_bench_signed();

	// Test bench for the control_unit. 

	reg [15:0] a;
    reg [15:0] b;
    reg cin = 0;
    reg control = 0;
    reg sign = 0;
	wire [15:0] sum;
    wire cout;
    wire OF;

	CLA_16bit_h c(a,b,cin,control, sign,sum,cout, OF);

    // control_bit - 0 ,1
    // input - a,b,cin,control_bit
    // output - sum, cout

	initial begin

		$dumpfile("test_with_higher_order.vcd");
		$dumpvars(0,test_bench_signed);
        // unsigned
		a = 16'b0000000000000010; 
        b = 16'b0000000000000011; #20;
		a = 16'b1000000000000011; 
        b = 16'b1000000000000010; #20;
		a = 16'b1000000000001011; 
        b = 16'b0000000000000111; 
        control =1; #20;

        sign = 1;
        control = 0;
        // signed
        a = 16'b0000000000000010; 
        b = 16'b0000000000000011; #20;
		a = 16'b0100000000000011; 
        b = 16'b0100000000000010; #20;
        a = 16'b1111111111111101; 
        b = 16'b1111111111111110; #20;
        a = 16'b1000000000000110; 
        b = 16'b1000000000001101; #20;
        a = 16'b0000000000000110; 
        b = 16'b1111111111111101; #20;
        a = 16'b0000000000001101; 
        b = 16'b1111111111111111; 
        control = 1; #20;
        a = 16'b0110000000000110; 
        b = 16'b1000000000001101; 
        control = 1; #20;

	end

endmodule