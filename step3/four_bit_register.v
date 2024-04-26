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
