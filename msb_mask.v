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
