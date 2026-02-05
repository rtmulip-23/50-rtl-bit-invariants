// Problem 4: Index to One-Hot
// Given a 5-bit index, generate a 32-bit one-hot vector.

module index_to_onehot (
    input [4:0] index,
    output [31:0] onehot
);


assign onehot = 1<<index;
endmodule
