// Problem 22: Index of K-th Set Bit
// Return the index of the k-th set bit (1-based k).

module kth_set_bit (
    input [31:0] in,
    input [4:0] k,
    output [4:0] index
);


   wire [15:0] s1_in;
   wire [7 :0] s2_in;
   wire [3 :0] s3_in;
   wire [1 :0] s4_in;
   
   
   wire [4 :0] s1_k ;
   wire [4 :0] s2_k ;
   wire [4 :0] s3_k ;
   wire [4 :0] s4_k ;


   wire s5_idx_bit  ;
   wire s1_idx_bit  ;
   wire s2_idx_bit  ;
   wire s3_idx_bit  ;
   wire s4_idx_bit  ;


   wire [4:0] s0_in_lowcnt;
   wire [4:0] s1_in_lowcnt;
   wire [4:0] s2_in_lowcnt;
   wire [4:0] s3_in_lowcnt;


   pop16 p0 (.in(in[15:0]),    .cnt(s0_in_lowcnt));
   pop8  p1 (.in(s1_in[7:0]), .cnt(s1_in_lowcnt));
   pop4  p2 (.in(s2_in[3:0]), .cnt(s2_in_lowcnt));
   pop2  p3 (.in(s3_in[1:0]), .cnt(s3_in_lowcnt));


   assign s1_in       = (k>s0_in_lowcnt)?in[31:16]       : in[15:0];
   assign s1_k        = (k>s0_in_lowcnt)?(k-s0_in_lowcnt): k;
   assign s1_idx_bit  = (k>s0_in_lowcnt)?1'b1            : 1'b0;



   assign s2_in       = (s1_k>s1_in_lowcnt)?s1_in[15:8]        : s1_in[7:0];
   assign s2_k        = (s1_k>s1_in_lowcnt)?(s1_k-s1_in_lowcnt): s1_k;
   assign s2_idx_bit  = (s1_k>s1_in_lowcnt)?1'b1               : 1'b0;


   assign s3_in       = (s2_k>s2_in_lowcnt)? s2_in[7:4]        : s2_in[3:0];
   assign s3_k        = (s2_k>s2_in_lowcnt)?(s2_k-s2_in_lowcnt): s2_k;
   assign s3_idx_bit  = (s2_k>s2_in_lowcnt)?1'b1               : 1'b0;


   assign s4_in       = (s3_k>s3_in_lowcnt)? s3_in[3:2]         : s3_in[1:0];
   assign s4_k        = (s3_k>s3_in_lowcnt)? (s3_k-s3_in_lowcnt): s3_k;
   assign s4_idx_bit  = (s3_k>s3_in_lowcnt)? 1'b1               : 1'b0;


   assign s5_idx_bit  = (s4_k>s4_in[0])? 1'b1                   : 1'b0;

   assign index = {s1_idx_bit, s2_idx_bit, s3_idx_bit, s4_idx_bit, s5_idx_bit};

endmodule


module pop2 (
     input [1:0]  in,
     output [1:0] cnt
);

   assign cnt = in[0] + in [1];
endmodule;


module pop4 (
     input [3:0] in,
     output [2:0] cnt
);

   wire [1:0] cnt1;
   wire [1:0] cnt2;

   pop2 p0 (.in(in[1:0]), .cnt(cnt1));
   pop2 p1 (.in(in[3:2]), .cnt(cnt2));

   assign cnt = cnt1 + cnt2;
endmodule


module pop8 (
     input [7:0] in,
     output [3:0] cnt
);

   wire [2:0] cnt1;
   wire [2:0] cnt2;

   pop4 p0 (.in(in[3:0]), .cnt(cnt1));
   pop4 p1 (.in(in[7:4]), .cnt(cnt2));

   assign cnt = cnt1 + cnt2;

endmodule



module pop16 (
     input [15:0] in,
     output [4:0] cnt
);

   wire [3:0] cnt1;
   wire [3:0] cnt2;

   pop8 p0 (.in(in[7:0]), .cnt(cnt1));
   pop8 p1 (.in(in[15:8]), .cnt(cnt2));

   assign cnt = cnt1 + cnt2;

endmodule































