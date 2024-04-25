module register_file (
    input wire clk,
    input wire rst_n,
    input wire we,  // Write enable
    input [2:0] waddr,  // Write address
    input [2:0] raddr1,  // Read address 1
    input [2:0] raddr2,  // Read address 2
    input [3:0] wdata,  // Write data
    output [3:0] rdata1,  // Read data 1
    output [3:0] rdata2  // Read data 2
);
  wire [7:0] write_enable;
  wire [3:0] register_outputs[7:0];

  decoder_3to8 dec (
      .select(waddr),
      .decode_out(write_enable)
  );

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : registers
      four_bit_register reg_inst (
          .clk(clk),
          .clrn(rst_n),
          .load(we & write_enable[i]),
          .D_in(wdata),
          .Q(register_outputs[i])
      );
    end
  endgenerate

  mux_8to1 read_mux1 (
      .in0(register_outputs[0]),
      .in1(register_outputs[1]),
      .in2(register_outputs[2]),
      .in3(register_outputs[3]),
      .in4(register_outputs[4]),
      .in5(register_outputs[5]),
      .in6(register_outputs[6]),
      .in7(register_outputs[7]),
      .sel(raddr1),
      .out(rdata1)
  );

  mux_8to1 read_mux2 (
      .in0(register_outputs[0]),
      .in1(register_outputs[1]),
      .in2(register_outputs[2]),
      .in3(register_outputs[3]),
      .in4(register_outputs[4]),
      .in5(register_outputs[5]),
      .in6(register_outputs[6]),
      .in7(register_outputs[7]),
      .sel(raddr2),
      .out(rdata2)
  );
endmodule
