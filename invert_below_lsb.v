// Problem 9: Invert Below LSB
// Invert all bits below the lowest set bit. The LSB itself and above are unchanged.

module invert_below_lsb (
    input [31:0] in,
    output [31:0] out
);

 assign out = in | (in - 1);
endmodule
