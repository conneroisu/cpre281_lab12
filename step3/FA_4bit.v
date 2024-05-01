module fulladder_4bit(
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] S,
  output Cout
);

  wire [2:0] C;
  
  fulladder fa0(A[0], B[0], Cin, S[0], C[0]);
  fulladder fa1(A[1], B[1], C[0], S[1], C[1]);
  fulladder fa2(A[2], B[2], C[1], S[2], C[2]);
  fulladder fa3(A[3], B[3], C[2], S[3], Cout);

endmodule
