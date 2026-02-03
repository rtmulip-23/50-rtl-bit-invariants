// Problem 17: Detect Exactly One Bit Set
// Output 1 if exactly one bit is high (Same as power of two).

module one_bit_set (
    input [31:0] in,
    output one_set
);

    wire [31:0] in_sub;

    assign in_sub = in - 1'b1;
    assign one_set = ((in & in_sub)==0)&&(|in == 1);

endmodule
