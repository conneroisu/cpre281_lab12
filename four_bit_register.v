
module one_bit_register (
    input wire clk,       // Clock signal
    input wire rst_n,     // Active low reset
    input wire load,      // Load enable signal
    input wire D_in,      // Data input
    output reg Q,         // Data output
    output wire not_Q     // Complement of Q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            Q <= 1'b0; // Reset the output to 0
        end
        else if (load) begin
            Q <= D_in; // Load the data input into the register
        end
    end

    assign not_Q = ~Q;

endmodule

module four_bit_register (
    input wire clk,      // Clock signal for all one-bit registers
    input wire clrn,     // Active low reset for all one-bit registers
    input wire load,     // Load enable for all one-bit registers
    input wire [3:0] D_in,  // 4-bit data input
    output wire [3:0] Q,    // 4-bit data output
    output wire [3:0] not_Q // 4-bit complement output
);

    // Instantiate four one-bit registers
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
