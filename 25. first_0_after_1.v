// Problem 25: Detect First 0 after First 1
// Find the position of the first zero that occurs at a higher index than the first one.

module first_0_after_1 (
    input [31:0] in,
    output [4:0] index,
    output found
);


wire [31:0] mask;

mask_below_first_1 m0 (.in(in), .mask(mask));

wire [31:0] mask_or_in = mask | in ;

// CHECK IF THERE IS A  0 AT ALL AFTER LSB

assign found = !in? 1'b0: ~(&mask_or_in);

wire [31:0] mask_cmp = ~mask_or_in;

lsb_index l0 (.in(mask_cmp), .index(index));



// 11001001001100
// 00000000000100
// 00000000000011
// 11001001001111

// 00110110110000
// 00000000010000
// convert to index


endmodule



module mask_below_first_1 (
    input [31:0] in,
    output [31:0] mask
);

    // Your code here
    assign mask = !in? 32'b0: (((in & (~in + 1))-1));

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

