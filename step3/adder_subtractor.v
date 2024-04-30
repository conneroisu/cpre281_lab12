module adder_subtractor_4bit (
    X3,
    Y3,
    X2,
    Y2,
    X1,
    Y1,
    X0,
    Y0,
    Cin,
    SubEn,
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
input wire SubEn;
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
wire [3:0] Y_inv;
wire Cin_modified;

assign S3 = SYNTHESIZED_WIRE_3;
assign Y_inv = {Y3, Y2, Y1, Y0} ^ {4{SubEn}}; // Invert Y inputs when SubEn is 1
assign Cin_modified = Cin | SubEn; // Set Cin to 1 when SubEn is 1

FA b2v_inst (
    .Cin(SYNTHESIZED_WIRE_5),
    .X(X3),
    .Y(Y_inv[3]),
    .S(Cout),
    .Cout(SYNTHESIZED_WIRE_3)
);

FA b2v_inst1 (
    .Cin(SYNTHESIZED_WIRE_1),
    .X(X2),
    .Y(Y_inv[2]),
    .S(S2),
    .Cout(SYNTHESIZED_WIRE_5)
);

FA b2v_inst2 (
    .Cin(SYNTHESIZED_WIRE_2),
    .X(X1),
    .Y(Y_inv[1]),
    .S(S1),
    .Cout(SYNTHESIZED_WIRE_1)
);

FA b2v_inst3 (
    .Cin(Cin_modified),
    .X(X0),
    .Y(Y_inv[0]),
    .S(S0),
    .Cout(SYNTHESIZED_WIRE_2)
);

assign Ov = SYNTHESIZED_WIRE_3 ^ SYNTHESIZED_WIRE_5;

endmodule
