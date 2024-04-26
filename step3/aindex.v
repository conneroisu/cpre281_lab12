module adder_4bit (
    X3,
    Y3,
    X2,
    Y2,
    X1,
    Y1,
    X0,
    Y0,
    Cin,
    Cout,
    S3,
    S2,
    S1,
    S0,
    Ov
);
  input wire X3;
  input wire Y3;
  input wire X2;
  input wire Y2;
  input wire X1;
  input wire Y1;
  input wire X0;
  input wire Y0;
  input wire Cin;
  output wire Cout;
  output wire S3;
  output wire S2;
  output wire S1;
  output wire S0;
  output wire Ov;
  wire SYNTHESIZED_WIRE_5;
  wire SYNTHESIZED_WIRE_1;
  wire SYNTHESIZED_WIRE_2;
  wire SYNTHESIZED_WIRE_3;
  assign S3 = SYNTHESIZED_WIRE_3;
  FA b2v_inst (
      .Cin(SYNTHESIZED_WIRE_5),
      .X(X3),
      .Y(Y3),
      .S(Cout),
      .Cout(SYNTHESIZED_WIRE_3)
  );
  FA b2v_inst1 (
      .Cin(SYNTHESIZED_WIRE_1),
      .X(X2),
      .Y(Y2),
      .S(S2),
      .Cout(SYNTHESIZED_WIRE_5)
  );
  FA b2v_inst2 (
      .Cin(SYNTHESIZED_WIRE_2),
      .X(X1),
      .Y(Y1),
      .S(S1),
      .Cout(SYNTHESIZED_WIRE_1)
  );
  FA b2v_inst3 (
      .Cin(Cin),
      .X(X0),
      .Y(Y0),
      .S(S0),
      .Cout(SYNTHESIZED_WIRE_2)
  );
  assign Ov = SYNTHESIZED_WIRE_3 ^ SYNTHESIZED_WIRE_5;
endmodule
module FA (
    Cin,  // Carry in
    X,  // Input bit X
    Y,  // Input bit Y
    S,  // Sum
    Cout  // Carry out
);
  input Cin, X, Y;
  output Cout, S;
  assign S = Cin ^ X ^ Y;  // XOR of all inputs
  assign Cout = (X & Y) | (X & Cin) | (Y & Cin);
endmodule
module four_bit_register (
    input wire clk,
    input wire clrn,
    input wire load,
    input wire [3:0] D_in,
    output wire [3:0] Q,
    output wire [3:0] not_Q
);
  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : g_bit_register
      one_bit_register single_bit_reg (
          .clk(clk),
          .rst_n(clrn),
          .load(load),
          .D_in(D_in[i]),
          .Q(Q[i]),
          .not_Q(not_Q[i])
      );
    end
  endgenerate
endmodule
module mux_8to1 (
    input [3:0] in0,
    in1,
    in2,
    in3,
    in4,
    in5,
    in6,
    in7,
    input [2:0] sel,
    output reg [3:0] out
);
  always_comb begin
    case (sel)
      3'b000:  out = in0;
      3'b001:  out = in1;
      3'b010:  out = in2;
      3'b011:  out = in3;
      3'b100:  out = in4;
      3'b101:  out = in5;
      3'b110:  out = in6;
      3'b111:  out = in7;
      default: out = 4'b0000;
    endcase
  end
endmodule
module one_bit_register (
    input  wire clk,
    input  wire rst_n,
    input  wire load,
    input  wire D_in,
    output reg  Q,
    output wire not_Q
);
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      Q <= 1'b0;
    end else if (load) begin
      Q <= D_in;
    end
  end
  assign not_Q = ~Q;
endmodule
module register_file (
    input wire clk,
    input wire rst_n,
    input wire write_enable,
    input wire [2:0] write_address,
    input wire [2:0] read_address_1,
    input wire [2:0] read_address_2,
    input wire [3:0] write_data,
    output wire [3:0] read_data_1,
    output wire [3:0] read_data_2
);
  wire [7:0] decoder_out;
  wire [3:0] reg_out_0, reg_out_1, reg_out_2, reg_out_3, reg_out_4, reg_out_5, reg_out_6, reg_out_7;
  wire [3:0] reg_not_out_0, reg_not_out_1, reg_not_out_2, reg_not_out_3, reg_not_out_4;
  wire [3:0] reg_not_out_5, reg_not_out_6, reg_not_out_7;
  decoder_3to8 decoder (
      .select(write_address),
      .enable(write_enable),
      .decode_out(decoder_out)
  );
  four_bit_register reg_0 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[0]),
      .D_in(write_data),
      .Q(reg_out_0),
      .not_Q(reg_not_out_0)
  );
  four_bit_register reg_1 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[1]),
      .D_in(write_data),
      .Q(reg_out_1),
      .not_Q(reg_not_out_1)
  );
  four_bit_register reg_2 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[2]),
      .D_in(write_data),
      .Q(reg_out_2),
      .not_Q(reg_not_out_2)
  );
  four_bit_register reg_3 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[3]),
      .D_in(write_data),
      .Q(reg_out_3),
      .not_Q(reg_not_out_3)
  );
  four_bit_register reg_4 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[4]),
      .D_in(write_data),
      .Q(reg_out_4),
      .not_Q(reg_not_out_4)
  );
  four_bit_register reg_5 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[5]),
      .D_in(write_data),
      .Q(reg_out_5),
      .not_Q(reg_not_out_5)
  );
  four_bit_register reg_6 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[6]),
      .D_in(write_data),
      .Q(reg_out_6),
      .not_Q(reg_not_out_6)
  );
  four_bit_register reg_7 (
      .clk(clk),
      .clrn(rst_n),
      .load(decoder_out[7]),
      .D_in(write_data),
      .Q(reg_out_7),
      .not_Q(reg_not_out_7)
  );
  mux_8to1 mux_read_1 (
      .in0(reg_out_0),
      .in1(reg_out_1),
      .in2(reg_out_2),
      .in3(reg_out_3),
      .in4(reg_out_4),
      .in5(reg_out_5),
      .in6(reg_out_6),
      .in7(reg_out_7),
      .sel(read_address_1),
      .out(read_data_1)
  );
  mux_8to1 mux_read_2 (
      .in0(reg_out_0),
      .in1(reg_out_1),
      .in2(reg_out_2),
      .in3(reg_out_3),
      .in4(reg_out_4),
      .in5(reg_out_5),
      .in6(reg_out_6),
      .in7(reg_out_7),
      .sel(read_address_2),
      .out(read_data_2)
  );
endmodule
module seven_seg_decoder (
    input  wire [3:0] x,
    output reg  [6:0] seg
);
  always @(x) begin
    case (x)
      4'b0000: seg = 7'b0000001;
      4'b0001: seg = 7'b1001111;
      4'b0010: seg = 7'b0010010;
      4'b0011: seg = 7'b0000110;
      4'b0100: seg = 7'b1001100;
      4'b0101: seg = 7'b0100100;
      4'b0110: seg = 7'b0100000;
      4'b0111: seg = 7'b0001111;
      4'b1000: seg = 7'b0000000;
      4'b1001: seg = 7'b0000100;
      4'b1010: seg = 7'b0001000;
      4'b1011: seg = 7'b1100000;
      4'b1100: seg = 7'b0110001;
      4'b1101: seg = 7'b1000010;
      4'b1110: seg = 7'b0110000;
      4'b1111: seg = 7'b0111000;
      default: seg = 7'b1111111;
    endcase
  end
endmodule
