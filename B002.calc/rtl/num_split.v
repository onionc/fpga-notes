// 两位十进制数字的（个位和十位）拆分

module num_split(
    input [7:0] v,
    output [3:0] tens, // 输出十位
    output [3:0] ones, // 输出个位
    output neg // 负号
);

// 调用除法，将vout输出位两位
wire [7:0] Q;
wire [7:0] R;
wire neg;

calc_div calc_div_inst_numsplit(
    .A(v),
    .B(8'd10),
    .Q(Q),
    .R(R),
    .neg(neg)
);

assign tens = Q[3:0];
assign ones = R[3:0];


endmodule