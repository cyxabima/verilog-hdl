module full_subtractor (
    input  a, b, bin,
    output diff, bout
);
    wire t1, t2, t3;

    assign diff = a ^ b ^ bin;                  // difference
    assign t1   = ~a & b;                       // borrow when a < b
    assign t2   = b & bin;                      // borrow from previous stage
    assign t3   = ~a & bin;                     // borrow when a=0 and bin=1
    assign bout = t1 | t2 | t3;                 // total borrow out
endmodule
