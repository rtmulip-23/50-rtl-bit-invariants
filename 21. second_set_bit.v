// Problem 21: Index of Second Set Bit
// Return the index of the second lowest set bit. If <2 bits set, output 0 (or undefined).

module second_set_bit (
    input [31:0] in,
    output [4:0] index
);

    // Your code here

    wire [31:0] lsb_removed;

    assign lsb_removed = in & (in - 1);

    wire [4:0] ind1;
    wire two_set;

   

    lsb_index lo (.in(lsb_removed), .index(ind1));

    assign index = (!lsb_removed) ? 5'b0: ind1;




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


// Problem 11: Index of LSB
// Return the index (0-31) of the lowest set bit.

module lsb_index (
    input [31:0] in,
    output [4:0] index
);


    wire [31:0] lsb_mask ;

    assign lsb_mask = (in & (~in + 1));

    wire [31:0] checker_mask [4:0] ;

    assign checker_mask[0] = 32'b10101010101010101010101010101010;
    assign checker_mask[1] = 32'b11001100110011001100110011001100;
    assign checker_mask[2] = 32'b11110000111100001111000011110000;
    assign checker_mask[3] = 32'b11111111000000001111111100000000;
    assign checker_mask[4] = 32'b11111111111111110000000000000000;



    assign index = {(|(lsb_mask&checker_mask[4])), (|(lsb_mask&checker_mask[3])), (|(lsb_mask&checker_mask[2])), (|(lsb_mask&checker_mask[1])), (|(lsb_mask&checker_mask[0])) };


endmodule
