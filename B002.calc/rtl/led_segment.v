// led 数码管显示



module led_segment 
(

	input			clk,			// 系统时钟
	input			rst_n,			// 系统复位
	input	[4:0]	seg_data_1,		// seg1 数码管要显示的数据
	input	[4:0]	seg_data_2,		// seg2
	input	[4:0]	seg_data_3,		// seg3
	input	[4:0]	seg_data_4,		// seg4
	input	[4:0]	seg_data_5,		// seg5
	input	[4:0]	seg_data_6,		// seg6
	input	[4:0]	seg_data_7,		// seg7
	input	[4:0]	seg_data_8,		// seg8
	input	[7:0]	seg_data_en,	// 数码管数据使能[msb seg8 ~ lsb seg1]
	input	[7:0]	seg_dot_en,		// 数码管小数点使能
	
	output	reg		rclk_out,		// 74HC595 的 RCK 管脚
	output	reg		sclk_out,		// 74HC595 的 SCK 管脚
	output 	reg		sdio_out		// 74HC595 的 SER 管脚
);

parameter	CLK_DIV_PERIOD = 600; 	// 分频系数

// 状态机状态
localparam	IDLE = 2'd0;			// 空闲状态
localparam	MAIN = 2'd1;			// 主要工作状态，扫描刷新数码管
localparam	WRITE= 2'd2;			// 写状态

localparam	LOW = 1'b0;
localparam	HIGH = 1'b1;

// 数码管字库
reg [7:0] seg [18:0]; // seg 每个里面有8位

// 初始化
initial begin
	seg[0]	=	8'h3f;   // 0
    seg[1]	=	8'h06;   // 1
    seg[2]	=	8'h5b;   // 2
    seg[3]	=	8'h4f;   // 3
    seg[4]	=	8'h66;   // 4
    seg[5]	=	8'h6d;   // 5
    seg[6]	=	8'h7d;   // 6
    seg[7]	=	8'h07;   // 7
    seg[8]	=	8'h7f;   // 8
    seg[9]	=	8'h6f;   // 9
	seg[10] =   8'h46;   // + 的左半部分
	seg[11] =   8'h70;   // + 的右半部分
    seg[12]	=	8'h40;   // -
    seg[13]	=	8'h76;   // x
    seg[14]	=	8'h49;   // /
    seg[15]	=	8'h79;   // E
    seg[16]	=	8'h00;   // 空
	seg[17] =   8'h73;   // R （显示是p）
	seg[18] =   8'h48;   // =
end

// 计数器对系统时钟进行计数
reg [9:0] cnt = 0;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt <= 1'b0;
	else begin
		if(cnt >= (CLK_DIV_PERIOD-1))
			cnt <= 1'b0;
		else
			cnt <= cnt + 1'b1;
	end

end

// 根据分频计数产生分频脉冲信号
reg clk_div;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		clk_div <= 1'b0;
	else
		clk_div <= (cnt == (CLK_DIV_PERIOD-1)) ? 1'b1 : 1'b0;
end

// 使用状态机完成 数码管扫描和74HC595时序
reg	[15:0]	data_reg;
reg	[2:0]	cnt_main;
reg	[5:0]	cnt_write;
reg	[1:0]	state = IDLE;
always @(posedge clk or negedge rst_n) begin
	
	// 复位状态，各寄存器赋初值
	if(!rst_n) begin
		state <= IDLE;
		cnt_main <= 3'd0;
		cnt_write <= 6'd0;
		sdio_out <= 1'b0;
		sclk_out <= LOW;
		rclk_out <= LOW;
	end else begin
		
		case(state)
			IDLE:begin
				// 空闲状态，第一个状态，相当于软复位
				state <= MAIN;
				cnt_main <= 3'd0;
				cnt_write <= 6'd0;
				sdio_out <= 1'b0;
				sclk_out <= LOW;
				rclk_out <= LOW;
			end
			
			MAIN:begin
				// cnt_main 累加
				if(cnt_main >= 3'd7) cnt_main <= 3'b0;
				else cnt_main <= cnt_main + 1'b1;
				
				// 对8位数码管进行逐位扫描
				case(cnt_main)
					3'd0:begin
						state <= WRITE; // 配置完后跳转至WRITE状态
						
						// data_reg[15:8] 是段选（单个数码管显示的内容），data_reg[7:0] 是位选（选择哪一位数码管）
						data_reg <= { 
							seg[seg_data_1] | (seg_dot_en[0]?8'h80:8'h00), // 段选中的seg_dot_en是小数点显示使能
							seg_data_en[0] ? 8'hfe : 8'hff
						};
					end

					3'd1:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_2] | (seg_dot_en[1]?8'h80:8'h00),
							seg_data_en[1] ? 8'hfd : 8'hff
						};
					end
					
					3'd2:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_3] | (seg_dot_en[2]?8'h80:8'h00),
							seg_data_en[2] ? 8'hfb : 8'hff
						};
					end
					
					3'd3:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_4] | (seg_dot_en[3]?8'h80:8'h00),
							seg_data_en[3] ? 8'hf7 : 8'hff
						};
					end
					
					3'd4:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_5] | (seg_dot_en[4]?8'h80:8'h00),
							seg_data_en[4] ? 8'hef : 8'hff
						};
					end
					
					3'd5:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_6] | (seg_dot_en[5]?8'h80:8'h00),
							seg_data_en[5] ? 8'hdf : 8'hff
						};
					end
					
					3'd6:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_7] | (seg_dot_en[6]?8'h80:8'h00),
							seg_data_en[6] ? 8'hbf : 8'hff
						};
					end
					
					3'd7:begin
						state <= WRITE;
						data_reg <= { 
							seg[seg_data_8] | (seg_dot_en[7]?8'h80:8'h00),
							seg_data_en[7] ? 8'h7f : 8'hff
						};
					end
					
					default: state <= IDLE;
				endcase
				
			end
			
			WRITE:begin
				if(clk_div) begin // 按照分频后的速度进行串行更新
					if(cnt_write >= 6'd33) cnt_write <= 1'b0;
					else cnt_write <= cnt_write + 1'b1;
						
					case(cnt_write)
						// 74HC595时序实现
						6'd0:	begin sclk_out <= LOW; sdio_out <= data_reg[15]; end
						6'd1:	begin sclk_out <= HIGH; end
						6'd2:	begin sclk_out <= LOW; sdio_out <= data_reg[14]; end
						6'd3:	begin sclk_out <= HIGH; end
						6'd4:	begin sclk_out <= LOW; sdio_out <= data_reg[13]; end
						6'd5:	begin sclk_out <= HIGH; end
						6'd6:	begin sclk_out <= LOW; sdio_out <= data_reg[12]; end
						6'd7:	begin sclk_out <= HIGH; end
						6'd8:	begin sclk_out <= LOW; sdio_out <= data_reg[11]; end
						6'd9:	begin sclk_out <= HIGH; end
						6'd10:	begin sclk_out <= LOW; sdio_out <= data_reg[10]; end
						6'd11:	begin sclk_out <= HIGH; end
						6'd12:	begin sclk_out <= LOW; sdio_out <= data_reg[9]; end
						6'd13:	begin sclk_out <= HIGH; end
						6'd14:	begin sclk_out <= LOW; sdio_out <= data_reg[8]; end
						6'd15:	begin sclk_out <= HIGH; end
						6'd16:	begin sclk_out <= LOW; sdio_out <= data_reg[7]; end
						6'd17:	begin sclk_out <= HIGH; end
						6'd18:	begin sclk_out <= LOW; sdio_out <= data_reg[6]; end
						6'd19:	begin sclk_out <= HIGH; end
						6'd20:	begin sclk_out <= LOW; sdio_out <= data_reg[5]; end
						6'd21:	begin sclk_out <= HIGH; end
						6'd22:	begin sclk_out <= LOW; sdio_out <= data_reg[4]; end
						6'd23:	begin sclk_out <= HIGH; end
						6'd24:	begin sclk_out <= LOW; sdio_out <= data_reg[3]; end
						6'd25:	begin sclk_out <= HIGH; end
						6'd26:	begin sclk_out <= LOW; sdio_out <= data_reg[2]; end
						6'd27:	begin sclk_out <= HIGH; end
						6'd28:	begin sclk_out <= LOW; sdio_out <= data_reg[1]; end
						6'd29:	begin sclk_out <= HIGH; end
						6'd30:	begin sclk_out <= LOW; sdio_out <= data_reg[0]; end
						6'd31:	begin sclk_out <= HIGH; end
						6'd32:	begin rclk_out <= HIGH; end
						6'd33:	begin rclk_out <= LOW; state <= MAIN; end
						default: state <= IDLE;
					endcase
				end else begin
					sclk_out <= sclk_out;
					sdio_out <= sdio_out;
					rclk_out <= rclk_out;
					cnt_write <= cnt_write;
					state <= state;
				end
			end
			
			default:begin 
				state <= IDLE;
			end
		endcase
		
	end
	
	
	
end

endmodule