module top_test(
	input clk,
	input rst_n,
	
    // 数码管
	output rclk_out, // 74HC595 的 RCK 管脚	
	output sclk_out, // 74HC595 的 SCK 管脚
	output sdio_out,  // 74HC595 的 SER 管脚
	
	// keyboard
    input [3:0] col,
    output  [3:0] row,

	// key 
	input key,
	output led0
);

// 数码管配置
/* synthesis syn_force_pads = 1 */
reg	[3:0] seg_data_1;		// seg1 数码管要显示的数据
/*
wire	[3:0]	seg_data_2;		// seg2
wire	[3:0]	seg_data_3;		// seg3
wire	[3:0]	seg_data_4;		// seg4
wire	[3:0]	seg_data_5;	// seg5
wire	[3:0]	seg_data_6;		// seg6
wire	[3:0]	seg_data_7;		// seg7
wire	[3:0]	seg_data_8;		// seg8
wire	[7:0]	seg_data_en;	// 数码管数据使能[msb seg8 ~ lsb seg1]
wire	[7:0]	seg_dot_en;		// 数码管小数点使能
*/
/*
assign seg_data_1 = 4'd1;
assign seg_data_2 = 4'd2;
assign seg_data_3 = 4'd3;
assign seg_data_4 = 4'd4;
assign seg_data_5 = 4'd5;
assign seg_data_6 = 4'd7;
assign seg_data_7 = 4'd8;
assign seg_data_8 = 4'd0;
*/
assign seg_data_en = 8'h1;
assign seg_dot_en = 8'h00;


// 矩阵键盘
wire [15:0] key_out;
wire [15:0] key_pulse;
keyboard keyboard_inst(
	.clk(clk),
	.rst_n(rst_n),
	.col(col),
    .row(row),
	.key_out(key_out),
    .key_pulse(key_pulse)
);

// 更新按键到数码管
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		seg_data_1 <= 4'h0;
	end else begin
		case(key_pulse)  //key_pulse脉宽等于clk_in的周期
			16'h0001: seg_data_1 <= 4'h1;  //编码
			16'h0002: seg_data_1 <= 4'h2;
			16'h0004: seg_data_1 <= 4'h3;
			16'h0008: seg_data_1 <= 4'h4;
			16'h0010: seg_data_1 <= 4'h5;
			16'h0020: seg_data_1 <= 4'h6;
			16'h0040: seg_data_1 <= 4'h7;
			16'h0080: seg_data_1 <= 4'h8;
			16'h0100: seg_data_1 <= 4'h9;
            16'h0200: seg_data_1 <= 4'ha;
			16'h0400: seg_data_1 <= 4'hb;
			16'h0800: seg_data_1 <= 4'hc;
			16'h1000: seg_data_1 <= 4'hd;
			16'h2000: seg_data_1 <= 4'he;
			16'h4000: seg_data_1 <= 4'hf;
			16'h8000: seg_data_1 <= 4'h0;
			default:  seg_data_1 <= seg_data_1;   //无按键按下时保持
		endcase
	end
end

// 数码管
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

// 轻触按键
key key_inst(
	.clk(clk),
	.rst_n(rst_n),
	.key1(key),
	.led0(led0)
);


endmodule