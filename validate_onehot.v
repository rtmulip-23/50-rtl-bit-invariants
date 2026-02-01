// Problem 5: Validate One-Hot
// Check if the input is a valid one-hot vector (exactly one bit set).

module validate_onehot (
    input [31:0] in,
    output valid
);

    // Your code here
    assign valid = !in? 1'b0: !(in&(in-1));

endmodule
