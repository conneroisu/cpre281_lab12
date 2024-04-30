module decoder_3to8 (
    input wire [2:0] select,
    input wire enable,
    output reg [7:0] decode_out
);
  always_comb begin
    if (enable) begin
      case (select)
        3'b000:  decode_out = 8'b00000001;
        3'b001:  decode_out = 8'b00000010;
        3'b010:  decode_out = 8'b00000100;
        3'b011:  decode_out = 8'b00001000;
        3'b100:  decode_out = 8'b00010000;
        3'b101:  decode_out = 8'b00100000;
        3'b110:  decode_out = 8'b01000000;
        3'b111:  decode_out = 8'b10000000;
        default: decode_out = 8'b00000000;
      endcase
    end else begin
      decode_out = 8'b00000000;
    end
  end
endmodule
