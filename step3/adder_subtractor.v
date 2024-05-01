module adder_subtractor_4bit(
  input X3, Y3, X2, Y2, X1, Y1, X0, Y0, Control,
  output Overflow, Cout, S3, S2, S1, S0
);
  wire [3:0] X = {X3, X2, X1, X0};
  wire [3:0] Y = {Y3, Y2, Y1, Y0};
  wire [3:0] Y_controlled;
  wire [3:0] S;
  
  assign Y_controlled = Control ? ~Y : Y;
  
  fulladder_4bit fa(
    .A(X),
    .B(Y_controlled),
    .Cin(Control),
    .S(S),
    .Cout(Cout)
  );
  assign {S3, S2, S1, S0} = S;
  assign Overflow = (X3 & Y3 & ~S3) | (~X3 & ~Y3 & S3);
endmodule

