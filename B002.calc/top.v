module top(
	input clk,
	input rst_n,
	
	output rclk_out, // 74HC595 �� RCK �ܽ�	
	output sclk_out, // 74HC595 �� SCK �ܽ�
	output sdio_out,  // 74HC595 �� SER �ܽ�
	
	// key 
	input key,
	output led0

);
/* synthesis syn_force_pads = 1 */
wire	[3:0] seg_data_1;		// seg1 �����Ҫ��ʾ������
wire	[3:0]	seg_data_2;		// seg2
wire	[3:0]	seg_data_3;		// seg3
wire	[3:0]	seg_data_4;		// seg4
wire	[3:0]	seg_data_5;	// seg5
wire	[3:0]	seg_data_6;		// seg6
wire	[3:0]	seg_data_7;		// seg7
wire	[3:0]	seg_data_8;		// seg8
wire	[7:0]	seg_data_en;	// ���������ʹ��[msb seg8 ~ lsb seg1]
wire	[7:0]	seg_dot_en;		// �����С����ʹ��

assign seg_data_1 = 4'd1;
assign seg_data_2 = 4'd2;
assign seg_data_3 = 4'd3;
assign seg_data_4 = 4'd4;
assign seg_data_5 = 4'd5;
assign seg_data_6 = 4'd7;
assign seg_data_7 = 4'd8;
assign seg_data_8 = 4'd0;
assign seg_data_en = 8'hfd;
assign seg_dot_en = 8'h00;

 
led_segment inst(
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

key key_inst(
	.clk(clk),
	.rst_n(rst_n),
	.key1(key),
	.led0(led0)
);
endmodule