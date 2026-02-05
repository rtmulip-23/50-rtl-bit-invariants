// Problem 29: Longest Run of 1s
// Output the length of the longest consecutive sequence of 1s.

module longest_run_1s (
    input [31:0] in,
    output [5:0] length
);

    // Your code here

    genvar i;
    wire [31:0] vector_index;

    generate 
     for(i = 0; i < 32; i = i + 1) begin: LOOP
        assign vector_index[i] = ~(|(in & (in <<i)));
     end
    endgenerate

    wire [4:0] ind1;
    lsb_index lo (.in(vector_index), .index(ind1));

    assign length = &(in) ? 6'd32: {1'b0, ind1};


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
















































