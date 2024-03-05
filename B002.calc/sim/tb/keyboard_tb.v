`timescale 1ns/1ns

module keyboard_tb();

parameter CLK_CNT = 5'd20;

reg clk;
reg rst_n;
reg [3:0] col;
wire [3:0] row;
wire [15:0] key_out;
wire [15:0] key_pulse;

initial begin
    clk <= 1'b1; // ����ʱ��������Ĭ��Ϊ0��ʱ�򣬷�Ƶ���clk��һ����̫׼��������400�����390��������Ĭ��λ�ߣ��������400�ˣ��������
    rst_n <= 1'b0;
    col <= 4'b1111;

    #200
    rst_n <= 1'b1;

    // col���� 
    #100
    col <= 4'b0111; // ������300nsʱ��ֵ�ģ�ʱ�Ӵ�400����ʼ
    #1701 // һ����Ƶ���clk��400ns(20*20)��״̬��4��ѭ������1600 + 100��ʱ�ӿ�ʼǰ��ǰ������)+1������һ��ʱ����̸�ֵ����ʵӦ�ü�һ����clk������������棬�߸����ޣ�
    col <= 4'b1111;
end

// ʱ��
always #(CLK_CNT/2) clk = ~clk;

// ����
keyboard #(
    .NUM_FOR_200HZ(CLK_CNT)
) keyboard_inst(
    .clk(clk),
    .rst_n(rst_n),
    .col(col),
    .row(row),
    .key_pulse(key_pulse)
);

endmodule