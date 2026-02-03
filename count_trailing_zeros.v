// Problem 13: Count Trailing Zeros (CTZ)
// Count the number of zeros starting from the LSB up to the first 1.

module count_trailing_zeros (
    input [31:0] in,
    output [5:0] count
);

    // Your code here

    wire [4:0] lsb_index;

    lsb_index l0 (.in(in), .index(lsb_index));

    assign count = !in? 6'd32: lsb_index;

endmodule


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