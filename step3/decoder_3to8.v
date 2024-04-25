
module decoder_3to8 (
    input [2:0] select,
    output reg [7:0] decode_out
);
  always @(*) begin
    decode_out = 8'b00000001 << select;  // Shift left logic to position the '1' based on select input
  end
endmodule
