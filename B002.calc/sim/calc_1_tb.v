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
reg [3:0] v1;
reg [3:0] v2;
wire [7:0] vout;

initial begin
    clk <= 1'b0; 
    rst_n <= 1'b0;

    #100
    rst_n <= 1'b1;

    #200
    v1 <= 4'd6;
    v2 <= 4'd7;
end
always #(200) clk = ~clk;


// �� v1 v2 ƴ��
num_join num_join_inst1(
    .v1(v1),
    .v2(v2),
    .vout(vout)    
);
// result: v1=6 v2=7 vout=67

// �ٲ��(����ʹ�õ��˳���)
wire [3:0] v3;
wire [3:0] v4;
num_split num_split_inst1(
    .v(vout),
    .v1(v3),
    .v2(v4)
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


endmodule