module full_adder (
    input  a, b, cin,
    output sum, cout
);
    wire t;

    assign t    = a ^ b;
    assign sum  = t ^ cin;
    assign cout = (t & cin) | (a & b);
endmodule
