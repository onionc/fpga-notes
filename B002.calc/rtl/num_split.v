// ��λʮ�������ֵģ���λ��ʮλ�����

module num_split(
    input [7:0] v,
    output [3:0] tens, // ���ʮλ
    output [3:0] ones, // �����λ
    output neg // ����
);

// ���ó�������vout���λ��λ
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