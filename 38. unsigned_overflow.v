// Problem 38: Detect Unsigned Overflow
// Detect overflow for 32-bit unsigned addition A + B.

module unsigned_overflow (
    input [31:0] a,
    input [31:0] b,
    output overflow
);

    // Your code here
    wire [31:0] sum;
    wire       carry;
    assign {carry, sum} = a + b;

    assign overflow = carry;
endmodule
