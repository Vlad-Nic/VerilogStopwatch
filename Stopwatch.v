module Half_Adder(X,Y, Sum, Carry);
input X,Y;
output Sum, Carry:
assign Carry=X&Y;
assign Sum = X^Y;
endmodule
module RCA(A,Cin, Sum);
input [3:0] A;
input Cin
wire [2:0] C;
wire OV;
output [3:0]Sum;
Half_Adder Half0 (A[0], Cin, Sum[0], G[0]);
Half_Adder Half1 (A[1], C[0], Sum[1], C[1]);
Half_Adder Half2 (A[2], C[1], Sum[2], C[2]); Half_Adder Half3 (A[3], C[2], Sum[3], OV); 
endmodule

module BCD(B,D); input [3:0]B;
output[6:0]D;
assign D[0] = (B[2]&~B[0])|(~B[3]&~B[2]&~B[1]&B[0]);
assign D[1] = B[2]&(B[1]^B[0]);
assign D[2] = ~B[2]&B[1]&~B[0];
assign D[3] =
(B[2]&~B[1]&~B[0])|(~B[2]&~B[1]&B[0])|(B[2]&B[1]&B[0]);
assign D[4] = (B[2]&~B[1])|B[0];
assign D[5] = (B[1]&B[0])|(~B[2]&B[1])|(~B[3]&~B[2]&B[0]); assign D[6] = (~B[3]&~B[2]&~B[1])|(B[2]&B[1]&B[0]); 
endmodule

module DFF0(data_in.clock.reset, data_out):
input data_in;
input clock.reset
output reg data_out;
always@(posedge clock)
begin
if(reset)
data_out<=1'b0;
else
data_out<=data_in;
end
endmodule
module clk_divider(clock, rst, clk_out).
input clock, rst,
output clk_out;
wire [18:0] din;
wire [18:0] clkdiv;
DFFO dff_inst0(.data_in(din[0]), .clock(clock), .reset(rst), .data_out(clkdiv[0])
);
genvar i; generate
for (i = 1; i < 19; i=i+1)
begin: dff_gen_label DFFO dff_inst (
.data_in (din[i]),
clock(clkdiv[i-1]), .reset(rst),
);
end
data_out(clkdiv[i])
endgenerate
accign din - ~clkdiv;
assign clk_out = clkdiv[18]; 
endmodule

module count10(clock, inc, reset, Count, count_eq_9);
input clock, inc, reset;
output [3:0] Count:
reg [3:0] test;
wire [3:0];
output count_eq_9;
wire b,c;
DFFO Flip0(e[0], clock, c, Count[0]); DFFO Flip 1(e[1], clock, c, Count[1]); DFFO Flip2(e[2], clock, c, Count[2]); DFFO Flip3(e[3], clock, c, Count[3]); RCA Ripple 1(Count, inc, e);
assign count_eq_9= (Count[3]&~Count[2]&~Count[1]&Count[0])?1:0; and g1 (b, count_eq_9, inc);
or g2(c, b, reset);
endmodule

module count6(clock, inc, reset, Count, count_eq_5):
input clock, inc, reset;
output [3:0] Count:
wire [3:0] e;
output count_eq_5; wire b,c;
DFFO Flip0(e[0], clock, c, Count[0]);
DFFO Flip1(e[1], clock, c, Count[1]);
DFFO Flip2(e[2], clock, c, Count[2]);
DFFO Flip3(e[3], clock, c, Count[3]);
RCA Ripple 1 (Count, inc, e);
assign count_eq_5 = (~Count[3]&Count[2]&~Count[1]&Count[0])?1:0;
and g1 (b,count_eq_5, Inc);
or g2(c, b, reset);
endmodule