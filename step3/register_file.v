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
  wire [3:0] reg_out_0, reg_out_1, reg_out_2, reg_out_3, reg_out_4, reg_out_5;
  wire [3:0] reg_out_6, reg_out_7;
  wire [3:0] reg_not_out_0, reg_not_out_1, reg_not_out_2, reg_not_out_3;
  wire [3:0] reg_not_out_4, reg_not_out_5, reg_not_out_6, reg_not_out_7;
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
