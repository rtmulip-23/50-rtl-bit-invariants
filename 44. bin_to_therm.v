// Problem 44: Binary to Thermometer
// Convert 5-bit binary value to 32-bit Thermometer code.

module bin_to_therm (
    input [4:0] bin,
    output [31:0] therm
);

    // Your code here

    assign therm =  (((32'b1)<<bin) - 1);
endmodule
