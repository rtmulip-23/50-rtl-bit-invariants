// Problem 41: Binary to Gray Code
// Convert 32-bit Binary to Gray Code.

module bin_to_gray (
    input [31:0] bin,
    output [31:0] gray
);

    // Your code here

    assign gray = bin ^ (bin>>1);


endmodule
