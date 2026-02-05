// Problem 39: Absolute Value
// Compute absolute value of signed 32-bit input.

module abs_value (
    input signed [31:0] in,
    output [31:0] out
);


assign out = in[31]? -in: in;

endmodule
