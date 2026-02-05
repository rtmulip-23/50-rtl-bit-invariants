// Problem 40: Compare Without < or >
// Compare A and B using only bitwise logic and addition/subtraction. Output 1 if A > B.

module compare_no_op (
    input [31:0] a,
    input [31:0] b,
    output a_greater_b
);

    // Your code here

    wire [32:0] diff;

    assign diff = a - b;

    assign a_greater_b = |diff & ~diff[32];
    

endmodule
