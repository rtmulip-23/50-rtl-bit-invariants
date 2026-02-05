module detect_zero (input [31:0] in,
                    output is_zero );

     assign is_zero = ~(|in);

endmodule