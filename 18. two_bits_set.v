// Problem 18: Detect Exactly Two Bits Set
// Output 1 if exactly two bits are high in the input.

module two_bits_set (
    input [31:0] in,
    output two_set
);


  
    // Your code here

    wire [31:0] lsb_removed;
    assign lsb_removed = ((in) & (in - 1));
    
    power_of_two p0 (.in(lsb_removed), .is_pow2(two_set));

endmodule



module power_of_two (
    input [31:0] in,
    output is_pow2
);

    // Your code here
    wire [31:0] in_sub;

    assign in_sub = in - 1'b1;
    assign is_pow2 = ((in & in_sub)==0)&&(|in == 1);
endmodule
