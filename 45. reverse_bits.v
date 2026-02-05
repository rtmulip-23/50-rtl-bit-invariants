// Problem 45: Reverse Bits
// Reverse the bit order of the 32-bit input.

module reverse_bits (
    input [31:0] in,
    output [31:0] out
);

    // Your code here
    
    
    genvar i;
    generate
     for(i=0; i < 32; i = i + 1) 
          assign  out[i] = in[31-i];
    endgenerate


endmodule
