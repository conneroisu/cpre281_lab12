

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
