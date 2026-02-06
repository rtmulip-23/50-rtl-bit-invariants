// Problem 50: One-Hot Violation Detector
// Monitor a sequence of one-hot inputs. If two bits turn simultaneously (glitch), output 1.

module onehot_glitch (
    input clk,
    input rst,
    input [31:0] in,
    output glitch
);

    // Your code here
    reg [31:0] prev;

    always @(posedge clk) begin
     if(rst) prev <= 32'b0;
     else begin
          prev <= in;
     end

    end

    wire [31:0] rising;
    assign rising = ~prev & in;
    assign glitch = |(rising & (rising - 1));





endmodule
