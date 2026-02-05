// Problem 31: Round Up to Power of 2
// Round 'in' up to the next power of two. If already pow2, return 'in'.

module round_up_pow2 (
    input [31:0] in,
    output [31:0] out
);

    // Your code here
    wire [31:0] msb_mask;

    msb_mask mo (.in(in), .mask(msb_mask));
    assign out = |(in&(in-1))?(msb_mask << 1):in;

endmodule





module msb_mask #(parameter N = 32) (
     input [31:0] in,
    output [31:0] mask
);


function integer clog2;
   input integer value;
   integer i;

   begin
     clog2 = 0;
     for(i = value - 1; i >0; i = (i >> 1))
            clog2 = clog2 + 1;
   end
endfunction


localparam STAGES = clog2(N);
wire [N-1:0] v[0 : STAGES];

assign v[0] = in;

genvar i;
generate
     for(i=0; i<STAGES; i = i + 1) begin
          assign v[i+1] = v[i] | (v[i]>>(1<<i));
     end
endgenerate

assign mask = v[STAGES] & ~(v[STAGES]>>1);

endmodule