// Problem 6: Lowest Set Bit Mask
// Generate a mask with only the lowest set bit of 'in' set. (e.g., 0010100 -> 0000100)

module lsb_mask (
    input [31:0] in,
    output [31:0] mask
);

    // Your code here

    assign mask = (in&((~in + 1)));

endmodule


