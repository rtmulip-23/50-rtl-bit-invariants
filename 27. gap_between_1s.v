// Problem 27: Detect Gap Between 1s
// Output 1 if there are any zeros between any two ones (i.e., ones are not contiguous).

module gap_between_1s (
    input [31:0] in,
    output gap_exists);

      // Your code here

      wire is_zero;

      assign is_zero = !(|in) || &in ;
      wire [31:0] lsb_mask;

      lsb_mask lo (.in(in), .mask(lsb_mask));

      wire [31:0] add_lsbmask;
      assign add_lsbmask = in + lsb_mask;

      assign gap_exists = is_zero? 1'b0: |(add_lsbmask & (add_lsbmask-1));

endmodule

// Problem 6: Lowest Set Bit Mask
// Generate a mask with only the lowest set bit of 'in' set. (e.g., 0010100 -> 0000100)


module lsb_mask (
    input [31:0] in,
    output [31:0] mask
);

assign mask = in & (~in + 1);


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
