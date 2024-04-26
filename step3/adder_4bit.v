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
