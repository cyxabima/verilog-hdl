module shifter8Bits(input shiftType, input num, output out);
    parameter k = 3;
    wire [2:0]shiftType;
    wire [7:0]num;
    reg [7:0]out;


    always @(num or shiftType) begin
        case (shiftType)
            3'b000:  out = num>>k;
            3'b001:  out = num<<k;
            3'b010:  out = num>>>k;
            3'b011:  out = num<<k;
            3'b100: out = {num[k-1:0],num[7:k]};
            3'b101: out = {num[8-k:0],num[7:8-k]};
            default: out = 8'b0;
        endcase
    end

endmodule




module shifter8Bits #(
    // Parameter definition is outside the port list, before it
    parameter k = 3
)(
    // Port definitions include direction (input/output) and type/width
    input wire [2:0] shiftType,  // Input: 3 bits wide
    input wire [7:0] num,        // Input: 8 bits wide
    output reg [7:0] out         // Output: 8 bits wide, declared as 'reg' because it is assigned in an 'always' block
);

    // The internal variable declarations for shiftType and num are removed 
    // because they are now defined as ports above.
    // The 'out' register declaration is also removed as it is defined as an output port.

    always @(num or shiftType) begin
        case (shiftType)
            3'b000:  out = num >> k; // Logical Right Shift
            3'b001:  out = num << k; // Logical Left Shift
            3'b010:  out = num >>> k; // Arithmetic Right Shift
            3'b011:  out = num << k; // Logical Left Shift (Same as 001)
            3'b100:  out = {num[k-1:0], num[7:k]}; // Rotate Left
            3'b101:  out = {num[8-k:0], num[7:8-k]}; // Rotate Right
            default: out = 8'b0;
        endcase
    end

endmodule