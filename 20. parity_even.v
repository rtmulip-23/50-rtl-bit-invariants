// Problem 20: Detect Even Parity
// Output 1 if the number of set bits is even.

module parity_even (
    input [31:0] in,
    output is_even
);

    // Your code here
    assign is_even = ~(^in);

endmodule
