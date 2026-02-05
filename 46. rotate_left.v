// Problem 46: Rotate Left Variable
// Rotate 'in' left by 'amt'.

module rotate_left (
    input [31:0] in,
    input [4:0] amt,
    output [31:0] out
);

    // Your code here
    assign out = (in<<amt) | (in>>(32-amt));

endmodule
