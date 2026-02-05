// Problem 19: Detect Odd Parity
// Output 1 if the number of set bits is odd.

module parity_odd (
    input [31:0] in,
    output is_odd
);

    // Your code here

    assign is_odd = ^in;

endmodule
