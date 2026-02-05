// Problem 42: Gray to Binary Code
// Convert 32-bit Gray Code to Binary.

module gray_to_bin #(parameter N = 32) (
    input [N-1:0] gray,
    output [N-1:0] bin
);

    // Your code here



    function integer clog2;
       input integer value;
       integer i;
       begin
          clog2 = 0;
          for(i=value-1; i > 0 ; i = i >> 1)
             clog2 = clog2 + 1;
       end
    endfunction


    localparam STAGES = clog2(N);

    wire [N-1:0] v [0: STAGES];

    assign v[0] = gray;

    genvar i;
    generate
     
     for( i = 0; i < STAGES ; i = i + 1) begin: SPREAD
         assign v[i+1] = v[i] ^ (v[i]>>(1<<i));
     end
    endgenerate


    assign bin = v[STAGES];


endmodule
