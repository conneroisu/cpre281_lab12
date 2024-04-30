module adder_subtractor(
	X3,
	Y3,
	X2,
	Y2,
	X1,
	Y1,
	X0,
	Y0,
	Control,
	Overflow,
	Cout,
	S2,
	S1,
	S0,
	S3
);
input wire	X3;
input wire	Y3;
input wire	X2;
input wire	Y2;
input wire	X1;
input wire	Y1;
input wire	X0;
input wire	Y0;
input wire	Control;
output wire	Overflow;
output wire	Cout;
output wire	S2;
output wire	S1;
output wire	S0;
output wire	S3;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_0 = Control ^ Y3;
assign	SYNTHESIZED_WIRE_1 = Control ^ Y2;
assign	SYNTHESIZED_WIRE_2 = Control ^ Y1;
assign	SYNTHESIZED_WIRE_3 = Control ^ Y0;
adder_4bit	b2v_inst4(
	.X3(X3),
	.Y3(SYNTHESIZED_WIRE_0),
	.X2(X2),
	.Y2(SYNTHESIZED_WIRE_1),
	.X1(X1),
	.Y1(SYNTHESIZED_WIRE_2),
	.Cin(Control),
	.X0(X0),
	.Y0(SYNTHESIZED_WIRE_3),
	.Cout(Cout),
	.S3(S3),
	.Ov(Overflow),
	.S2(S2),
	.S1(S1),
	.S0(S0));
endmodule
