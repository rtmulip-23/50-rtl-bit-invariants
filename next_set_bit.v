// Problem 49: Next Set Bit
// Given a bit index 'start', find the index of the next set bit at or after 'start'.

module next_set_bit (
    input [31:0] in,
    input [4:0] start,
    output [4:0] next_index,
    output found
);

    // Your code here

    wire [31:0] shifted;
    assign shifted = in >> start;

    assign found = |shifted;
    wire [4:0] ind;
    lsb_index lo (.in(shifted), .index(ind));
    assign next_index = found? (start + ind): 0;
    
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
