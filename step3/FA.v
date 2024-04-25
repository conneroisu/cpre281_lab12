module FA (
    Cin, // Carry in
    X,   // Input bit X
    Y,   // Input bit Y
    S,   // Sum
    Cout // Carry out
);
  input Cin, X, Y;
  output Cout, S;
  assign S = Cin ^ X ^ Y;  // XOR of all inputs
  assign Cout = (X & Y) | (X & Cin) | (Y & Cin);
endmodule
