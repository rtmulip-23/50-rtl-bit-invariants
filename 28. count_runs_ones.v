// Problem 28: Count Runs of Ones
// Count how many separate contiguous blocks of 1s exist.

module count_runs_ones (
    input [31:0] in,
    output [4:0] runs
);

    // Your code here

    wire [31:0] rising_edges;


    assign rising_edges =(~in & (in<<1));
    wire [5:0] runs_i;

    pop32 p0 (.in(rising_edges), .cnt(runs_i));

    assign runs = runs_i + in[31];
    

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



module pop32 (
     input [31:0] in,
     output [5:0] cnt
);

  wire [4:0] cnt1;
  wire [4:0] cnt2;

  pop16 p0 (.in(in[31:16]), .cnt(cnt1));
  pop16 p1 (.in(in[15:0 ]), .cnt(cnt2));


  assign cnt = cnt1 + cnt2;
endmodule






























