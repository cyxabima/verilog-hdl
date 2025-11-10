module full_adder (
    input a,b,cin,
    output sum, cout
);
    assign sum =  a^b^cin;
    assign cout =  ((a^b) &cin) | (a&b);
endmodule


module rippleParallelAdder (
    input [3:0] a, 
    input [3:0] b,
    input cin,
    output [3:0] sum, 
    output cout
);
    
    wire [2:0]carry;
    full_adder FA0(a[0], b[0],cin, sum[0], carry[0]);
    full_adder FA1(a[1], b[1],cin, sum[1], carry[1]);
    full_adder FA2(a[2], b[2],cin, sum[2], carry[2]);
    full_adder FA3(a[3], b[3],cin, sum[3], cout);
endmodule