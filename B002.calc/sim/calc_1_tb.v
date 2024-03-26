// ��ʮλ��ƴ�ӡ���֣��˳�����
/*
��Ҫ�����ļ���
num_split.v
num_join.v
calc_mul.v
calc_div.v
*/

module calc_1_tb();

reg clk;
reg rst_n;

reg [3:0] v11; // ������1��1λ
reg [3:0] v12; // ������1��2λ
reg [3:0] v21; // ������2��1λ
reg [3:0] v22; // ������2��2λ

wire [7:0] v1; // ������1
wire [7:0] v2; // ������2

reg [7:0] v_res; // ���������ֻ֧��8λ�Ľ��
// ����󽫽���ٲ��
/*
wire [3:0] v_r1;
wire [3:0] v_r2;
wire neg;
*/
/*
initial begin
    clk <= 1'b0; 
    rst_n <= 1'b0;

    #100
    rst_n <= 1'b1;

    #200
    v11 <= 4'd1;
    v12 <= 4'd2;
    v21 <= 4'd2;
    v22 <= 4'd3;

end
always #(200) clk = ~clk;
*/
/*
// ��������
// �� v1 v2 ƴ��
num_join num_join_inst1(
    .tens(v1),
    .ones(v2),
    .vout(vout)    
);
// result: v1=6 v2=7 vout=67

// �ٲ��(����ʹ�õ��˳���)
wire [3:0] v3;
wire [3:0] v4;
num_split num_split_inst1(
    .v(vout),
    .tens(v3),
    .ones(v4)
);
// result: vout=67 v3=6 v4=7

// �˷�����
wire [15:0] mul_out;
calc_mul calc_mul_inst1(
    .A(8'd7),
    .B(8'd8),
    .out(mul_out)
);
// result: out: 56
*/

// ���������� 1 2 + 2 3 = 3 5
/*
    v11 1
    v12 2
    v1 -> 12
    v21 2
    v22 3
    v2 -> 23
    vout -> 35 ��ʱ��
    v_r1 -> 3
    v_r2 -> 5
*/

/*
// ƴ��
num_join num_join_inst1(
    .tens(v11),
    .ones(v12),
    .vout(v1) 
);
num_join num_join_inst2(
    .tens(v21),
    .ones(v22),
    .vout(v2) 
);

// �ٲ��
num_split num_split_inst1(
    .v(v_res),
    .tens(v_r1),
    .ones(v_r2)
    .neg(neg)
);

always @(posedge clk) begin
    v_res <= v1 - v2; // ���Լ���������
end
*/

/*
// ���Գ���
reg [7:0] A;
reg [7:0] B;
wire [7:0] Q;
wire [7:0] R;


initial begin
    A = 8'd1;
    B = 8'd10;

    #200

    A = -1;
    B = 8'd10;
end

calc_div calc_div_inst_3(
    .A(A),
    .B(B),
    .Q(Q),
    .R(R),
    .neg(neg)
);
*/

// ���Գ˷�
reg [7:0] A;
reg [7:0] B;
wire [15:0] res_mul;

wire [3:0] v_r1, v_r2, v_r3, v_r4;
wire neg2;



initial begin
    A = 8'd1;
    B = -10;
    clk = 0;

    #200

    A = -1;
    B = 8'd10;

    #200
    A = 8'd3;
    B = 8'd4;

    #200
    A = 8'b0;
    B = 8'd3;
     #200
    A = 8'd50;
    B = 8'd50;
     #200
    A = 8'd51;
    B = 8'd51;

    #200
    A = 8'd99;
    B = 8'd99;

end
always #(10) clk = ~clk;
calc_mul calc_mul_inst_test(
    .A(A),
    .B(B),
    .out(res_mul)
);

reg [15:0] res_mul2;
always @(posedge clk)
    res_mul2 <= res_mul;
// �ٲ��
num_split num_split_inst1(
    .v(res_mul2),
    .thd(v_r4),
    .hud(v_r3),
    .ten(v_r2),
    .one(v_r1),
    .neg(neg2)
);

endmodule