// Problem 34: Saturating Decrement
// Decrement 'in' by 1. If 0, stay at 0.

module sat_dec (
    input [31:0] in,
    output [31:0] out
);

    // Your code here
    assign out = |in?(in-1): 1'b0;


endmodule
