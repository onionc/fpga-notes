// �����λʮ�������ֵģ���λ��ʮλ�����

module num_split(
    input [15:0] v,
    output [3:0] thd,
    output [3:0] hud,
    output [3:0] ten,
    output [3:0] one,
    output neg // ����
);

// ���ó�������vout���λ��λ
wire [15:0] Q,Q2,Q3;
wire [15:0] R,R2,R3;
wire neg2,neg3;

calc_div calc_div_inst_numsplit(
    .A(v),
    .B(16'd10),
    .Q(Q),
    .R(R),
    .neg(neg)
);
assign one = R[3:0];

calc_div calc_div_inst_numsplit2(
    .A(Q),
    .B(16'd10),
    .Q(Q2),
    .R(R2),
    .neg(neg2)
);
assign ten = R2[3:0];

calc_div calc_div_inst_numsplit3(
    .A(Q2),
    .B(16'd10),
    .Q(Q3),
    .R(R3),
    .neg(neg3)
);
assign hud = R3[3:0];
assign thd = Q3[3:0];



endmodule