module wire(input in, output out);
    assign in = out;
endmodule


module top_module( 
    input a,b,c,
    output w,x,y,z );
    
    assign w =a, x=b, y=b, z=c;

endmodule