`timescale 1ns/1ns

module segment_tb;

reg clk, rst_n;
reg	[3:0] seg_data_1;		// seg1 �����Ҫ��ʾ������
reg	[3:0]	seg_data_2;		// seg2
reg	[3:0]	seg_data_3;		// seg3
reg	[3:0]	seg_data_4;		// seg4
reg	[3:0]	seg_data_5;	// seg5
reg	[3:0]	seg_data_6;		// seg6
reg	[3:0]	seg_data_7;		// seg7
reg	[3:0]	seg_data_8;		// seg8
reg	[7:0]	seg_data_en;	// ���������ʹ��[msb seg8 ~ lsb seg1]
reg	[7:0]	seg_dot_en;		// �����С����ʹ��
	
wire	rclk_out;		// 74HC595 �� RCK �ܽ�
wire	sclk_out;		// 74HC595 �� SCK �ܽ�
wire	sdio_out;		// 74HC595 �� SER �ܽ�


initial begin
    clk = 0;
    rst_n = 0;
    #20
    rst_n = 1;


    seg_data_1 = 4'd1;
    seg_data_2 = 4'd2;
    seg_data_3 = 4'd3;
    seg_data_4 = 4'd4;
    seg_data_5 = 4'd5;
    seg_data_6 = 4'd7;
    seg_data_7 = 4'd8;
    seg_data_8 = 4'd0;
    seg_data_en = 8'hfd; // �ڶ�λ����ܲ�ʹ��
    seg_dot_en = 8'h00;

end
always #10 clk = ~clk;

led_segment led_segment_inst(
    .clk(clk),
    .rst_n(rst_n),
    .seg_data_1(seg_data_1),
    .seg_data_2(seg_data_2),
    .seg_data_3(seg_data_3),
    .seg_data_4(seg_data_4),
    .seg_data_5(seg_data_5),
    .seg_data_6(seg_data_6),
    .seg_data_7(seg_data_7),
    .seg_data_8(seg_data_8),
    .seg_data_en(seg_data_en),
    .seg_dot_en(seg_dot_en),
    .rclk_out(rclk_out),
    .sclk_out(sclk_out),
    .sdio_out(sdio_out)
);

endmodule