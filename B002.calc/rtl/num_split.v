// ��λʮ�������ֵģ���λ��ʮλ�����

module num_split(
    input [7:0] v,
    output [3:0] v1, // ���ʮλ
    output [3:0] v2 // �����λ
);

// ���ó�������vout���λ��λ
wire [7:0] vt1;
wire [7:0] vt2;

calc_div calc_div_inst_numsplit(
    .A(v),
    .B(8'd10),
    .Q(vt1),
    .R(vt2)
);

assign v1 = vt1[3:0];
assign v2 = vt2[3:0];


endmodule