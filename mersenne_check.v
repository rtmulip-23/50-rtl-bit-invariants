// Problem 10: Check if 2^n - 1
// Output 1 if the input is of the form 2^n - 1 (a sequence of 1s starting from LSB).

module mersenne_check (
    input [31:0] in,
    output is_mersenne
);

    // Your code here

    assign is_mersenne = !in? 1'b0: !(in & (in + 1));
endmodule
