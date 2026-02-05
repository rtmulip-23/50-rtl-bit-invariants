// Problem 35: Add Two Numbers (Carry Only)
// Compute only the carry bits generated at each position for A+B.

module add_carry_only (
    input [31:0] a,
    input [31:0] b,
    output [31:0] carries
);

    // Your code here

    assign carries = (a & b)<<1;
endmodule
