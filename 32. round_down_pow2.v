// Problem 32: Round Down to Power of 2
// Round 'in' down to the nearest power of two.

module round_down_pow2 (
    input [31:0] in,
    output [31:0] out
);


   msb_mask mo (.in(in), .mask(out));
    // Your code here

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