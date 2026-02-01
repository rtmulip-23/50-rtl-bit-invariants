// Problem 3: Detect Power of Two
// Output 1 if the input is a power of two (has exactly one bit set).

module power_of_two (
    input [31:0] in,
    output is_pow2
);

    // Your code here
    wire [31:0] in_sub;

    assign in_sub = in - 1'b1;
    assign is_pow2 = ((in & in_sub)==0)&&(|in == 1);
endmodule
