
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
    for (i = 0; i < 4; i = i + 1) begin : bit_register
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

module decoder_3to8 (
    input [2:0] select,
    output reg [7:0] decode_out
);
  always @(*) begin
    decode_out = 8'b00000001 << select;  // Shift left logic to position the '1' based on select input
  end
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
  always @(*) begin
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
