module top(
	input clk,
	input rst_n,
	
	output rclk_out, // 74HC595 的 RCK 管脚	
	output sclk_out, // 74HC595 的 SCK 管脚
	output sdio_out,  // 74HC595 的 SER 管脚
	
	// key 
	input key,
	output led0

);
/* synthesis syn_force_pads = 1 */
wire	[3:0] seg_data_1;		// seg1 数码管要显示的数据
wire	[3:0]	seg_data_2;		// seg2
wire	[3:0]	seg_data_3;		// seg3
wire	[3:0]	seg_data_4;		// seg4
wire	[3:0]	seg_data_5;	// seg5
wire	[3:0]	seg_data_6;		// seg6
wire	[3:0]	seg_data_7;		// seg7
wire	[3:0]	seg_data_8;		// seg8
wire	[7:0]	seg_data_en;	// 数码管数据使能[msb seg8 ~ lsb seg1]
wire	[7:0]	seg_dot_en;		// 数码管小数点使能

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