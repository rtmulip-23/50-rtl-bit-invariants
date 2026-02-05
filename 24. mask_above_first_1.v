// Problem 24: Mask Above First 1
// Return a mask with all 1s above the lowest set bit of 'in'.

module mask_above_first_1 (
    input [31:0] in,
    output [31:0] mask
);

    // Your code here
    assign mask = !in?32'b0: (~((in & (~in +1 ) | ((in & (~in + 1)))-1)));

endmodule
