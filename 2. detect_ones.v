module detect_ones (input [31:0] in, output is_all_ones);
   assign is_all_ones = &(in);
endmodule