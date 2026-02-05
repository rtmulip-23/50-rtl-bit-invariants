// Problem 47: Rotate Right Variable
// Rotate 'in' right by 'amt'.

module rotate_right (
    input [31:0] in,
    input [4:0] amt,
    output [31:0] out
);

    // Your code here

    assign out = (in>>amt | in << 32-amt);
endmodule
