// Problem 15: Count Leading Ones
// Count the number of consecutive 1s starting from the MSB.

module count_leading_ones (
    input [31:0] in,
    output [5:0] count
);

    // Your code here

    count_leading_zeros cl1 (.in(~in), .count(count));

endmodule


// Problem 14: Count Leading Zeros (CLZ)
// Count the number of zeros starting from the MSB down to the first 1.

module count_leading_zeros (
    input [31:0] in,
    output [5:0] count
);

    // Your code here

    wire [4:0] msb_index;

    msb_index m0 (.in(in), .index(msb_index));

    assign count = !in? 6'd32: (31 - msb_index);

endmodule



// Problem 12: Index of MSB
// Return the index (0-31) of the highest set bit.

module msb_index (
    input [31:0] in,
    output [4:0] index
);

   wire [31:0] msb_mask ;
   msb_mask m0 (.in(in), .mask(msb_mask));

   
    wire [31:0] checker_mask [4:0] ;

    assign checker_mask[0] = 32'b10101010101010101010101010101010;
    assign checker_mask[1] = 32'b11001100110011001100110011001100;
    assign checker_mask[2] = 32'b11110000111100001111000011110000;
    assign checker_mask[3] = 32'b11111111000000001111111100000000;
    assign checker_mask[4] = 32'b11111111111111110000000000000000;



    assign index = {(|(msb_mask&checker_mask[4])), (|(msb_mask&checker_mask[3])), (|(msb_mask&checker_mask[2])), (|(msb_mask&checker_mask[1])), (|(msb_mask&checker_mask[0])) };




endmodule


module msb_mask #(parameter N = 32)(
    input  [N-1:0] in,
    output [N-1:0] mask
);

    // compute log2(N) at elaboration time
    function integer clog2;
        input integer value;
        integer i;
        begin
            clog2 = 0;
            for (i = value-1; i > 0; i = i >> 1)
                clog2 = clog2 + 1;
        end
    endfunction

    localparam STAGES = clog2(N);

    wire [N-1:0] v [0:STAGES];
    genvar i;

    assign v[0] = in;

    generate
        for (i = 0; i < STAGES; i = i + 1) begin : SPREAD
            assign v[i+1] = v[i] | (v[i] >> (1 << i));
        end
    endgenerate

    assign mask = v[STAGES] & ~(v[STAGES] >> 1);

endmodule
