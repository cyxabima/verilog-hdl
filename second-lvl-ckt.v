module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n ); 
    
    wire and1,and2,z;
    assign and1 = a&b;
    assign and2 = c&d;
    assign z = and1 | and2;
    assign out =  z;
    assign out_n = ~z;

endmodule