// Problem 36: Add Two Numbers (No Carry)
// Compute the sum A+B excluding carry propagation (essentially XOR).

module add_no_carry (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum_no_carry
);

    // Your code here
    assign sum_no_carry = a ^ b;

endmodule
