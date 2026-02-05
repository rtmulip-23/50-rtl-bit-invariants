// Problem 33: Saturating Increment
// Increment 'in' by 1. If max value (all 1s), stay at max.

module sat_inc (
    input [31:0] in,
    output [31:0] out
);

    // Your code here
    assign out = &in?in: (in+1);

endmodule
