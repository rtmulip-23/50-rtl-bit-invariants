// Problem 37: Detect Signed Overflow
// Detect overflow for 32-bit signed addition A + B.

module signed_overflow (
    input [31:0] a,
    input [31:0] b,
    output overflow
);

    // Your code here

    wire [31:0] sum;
    assign sum = a + b;

    assign overflow = ~(a[31]^b[31]) & !(a[31]==sum[31]);

endmodule
