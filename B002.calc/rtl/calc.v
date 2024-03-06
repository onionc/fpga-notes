// 计算器测试

module calc #(
    parameter NUM_FOR_200HZ = 60000 // 200Hz计数，12M/200=60000
)(
	input clk,
	input rst_n,
	
    // 数码管
	output rclk_out, // 74HC595 的 RCK 管脚	
	output sclk_out, // 74HC595 的 SCK 管脚
	output sdio_out,  // 74HC595 的 SER 管脚
	
	// keyboard
    input [3:0] col,
    output  [3:0] row
 
); 

// 数码管配置
reg	[4:0] 	seg_data_1;		// seg1 数码管要显示的数据
reg	[4:0]	seg_data_2;		// seg2
reg	[4:0]	seg_data_3;		// seg3
reg	[4:0]	seg_data_4;		// seg4
reg	[4:0]	seg_data_5;		// seg5
reg	[4:0]	seg_data_6;		// seg6
reg	[4:0]	seg_data_7;		// seg7
reg	[4:0]	seg_data_8;		// seg8
reg	[7:0]	seg_data_en;	// 数码管数据使能[msb seg8 ~ lsb seg1]
reg	[7:0]	seg_dot_en;		// 数码管小数点使能




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


// 计算器状态机实现



// 状态定义
parameter S00 = 	9'b000000001; // 初始化状态
parameter S11 = 	9'b000000010; // 输入第一个操作数的1位
parameter S12 = 	9'b000000100; // 输入第一个操作数的2位
parameter S_OP = 	9'b000001000; // 输入运算符
parameter S21 = 	9'b000010000; // 输入第二个操作数的1位
parameter S22 = 	9'b000100000; // 输入第二个操作数的2位
parameter S_EQ = 	9'b001000000; // 输入等号，进行计算
parameter S_ERR = 	9'b100000000; // 错误状态

reg [7:0] curr_st; // 当前状态
reg [7:0] next_st; // 下一个状态




reg [3:0] key_value; // 按键值
reg [3:0] key_value2; // 按键值
reg [3:0] key_value3; // 按键值


reg [3:0] v11; // 操作数1的1位
reg [3:0] v12; // 操作数1的2位
reg [3:0] v21; // 操作数2的1位
reg [3:0] v22; // 操作数2的2位
reg [3:0] op; // 运算符
reg [3:0] v111;



// 状态机第一段：同步时序描述状态转移，以及更新按键值
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		curr_st <= S00;
	end
	else begin // 通过按键来判断下一个状态
		curr_st <= next_st;
	end
end

reg flag;
reg [15:0] key_pulse2;
reg [15:0] key_pulse3;
// 更新按键值
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		key_value <= 4'h0;
		key_pulse2 <= 16'h0000;
	end else begin
	/* 矩阵键盘按键分配如下
		1 2 3 +
		4 5 6 -
		7 8 9 *
		0 C = /
		把按键映射到这些数据上，0~9 对应 h'0~9，其他的分别对应 a~f (+ - * / 对应a b c d), f代表清除（也可直接绑定复位），e 代表计算=
	*/
	
		case(key_pulse)
			16'h0001: key_value <= 4'h1;  // 1
			16'h0002: key_value <= 4'h2;  // 2
			16'h0004: key_value <= 4'h3;  // 3
			16'h0008: key_value <= 4'ha;  // +
			16'h0010: key_value <= 4'h4;  // 4
			16'h0020: key_value <= 4'h5;  // 5
			16'h0040: key_value <= 4'h6;  // 6
			16'h0080: key_value <= 4'hb;  // -
			16'h0100: key_value <= 4'h7;  // 7
            16'h0200: key_value <= 4'h8;  // 8
			16'h0400: key_value <= 4'h9;  // 9
			16'h0800: key_value <= 4'hc;  // x
			16'h1000: key_value <= 4'h0;  // 0
			16'h2000: key_value <= 4'hf;  // C 清除（重置） ，f也做无效值用
			16'h4000: key_value <= 4'he;  // =
			16'h8000: key_value <= 4'hd;  // /
			default:  key_value <= key_value;   //无按键按下时保持
		endcase
		
		key_pulse2 <= key_pulse; // 延迟一拍，在组合逻辑中使用
	end
end

// 状态机第二段：使用按键值判断下一个状态（状态转移）

always @(*) begin
	next_st =  curr_st; // 这里或者在所有else中赋值

	if((key_value == 4'hf) && (key_pulse2>0) ) begin // 复位
		next_st = S00;
	end else
	case(next_st)
		S00: begin // 只可以输入数字，第一个数字的第一位
			if((key_value < 4'ha) && (key_pulse2>0) ) begin
				
				next_st = S11;
			end
		end
		S11: begin  // 可以输入数字第二位或者运算符
			if((key_value < 4'ha) && (key_pulse2>0) ) begin
				next_st = S12;
			end else if((key_value >= 4'ha) && (key_value <= 4'hd) && (key_pulse2>0)  ) begin
				next_st = S_OP;
			end 

		end

		S12: begin // 只可以输入运算符
			if((key_value >= 4'ha) && (key_value <= 4'hd) && (key_pulse2>0)) begin
				next_st = S_OP;
			end 
		end

		S_OP: begin // 可以输入第二数字的第一位
		  	if((key_value < 4'ha) && (key_pulse2>0)) begin
				next_st = S21;
			end 
		end

		S21: begin  // 可以输入数字第二位或者等号
			if((key_value < 4'ha) && (key_pulse2>0)) begin
				next_st = S22;
			end else if((key_value == 4'he) && (key_pulse2>0)) begin
				next_st = S_EQ;
			end 
		end

		S22: begin  // 只可以输入等号
			if((key_value == 4'he) && (key_pulse2>0)) begin
				next_st = S_EQ;
			end 
		end

		S_EQ: begin // 等待计算
			//next_st = S00;
		end

		S_ERR: begin
			next_st = S_ERR;
		end

		default:
			next_st = S00;
	endcase
end

// 状态机第三段：描述状态输出
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin


		seg_data_1 <= 5'd16; // 16在数码管中置空
		seg_data_2 <= 5'd16;
		seg_data_3 <= 5'd16;
		seg_data_4 <= 5'd16;
		seg_data_5 <= 5'd16;
		seg_data_6 <= 5'd16;
		seg_data_7 <= 5'd16;
		seg_data_8 <= 5'd16;
		
		seg_data_en <= 8'hff; // 所有数码管有效
		seg_dot_en <= 8'h00;
	end else begin
		if(next_st == S00 ) begin // 复位
			seg_data_1 <= 5'd16; // 16在数码管中置空
			seg_data_2 <= 5'd16;
			seg_data_3 <= 5'd16;
			seg_data_4 <= 5'd16;
			seg_data_5 <= 5'd16;
			seg_data_6 <= 5'd16;
			seg_data_7 <= 5'd16;
			seg_data_8 <= 5'd16;
		
			seg_data_en <= 8'hff; // 所有数码管有效
			seg_dot_en <= 8'h00;
		end else if(next_st == S11) begin
			
			if(key_value < 4'ha) begin // 为避免在S11时按其他键导致问题，这里还需判断一次
				
				v11 <= key_value;
				v12 <= 4'h0; // v12 第二位可能不会被赋值，这里来赋值
				seg_data_1 <= key_value;
				

				// 清除其他数据
				seg_data_2 <= 5'd16;
				seg_data_3 <= 5'd16;
				seg_data_4 <= 5'd16;
				seg_data_5 <= 5'd16;
				seg_data_6 <= 5'd16;
				seg_data_7 <= 5'd16;
				seg_data_8 <= 5'd16;
			end
			

		end else if(next_st == S12) begin
			if(key_value < 4'ha) begin
				v12 <= key_value;

				seg_data_2 <= key_value;
			end
		end else if(next_st == S_OP) begin
			if((key_value >= 4'ha) && (key_value <= 4'hd)) begin
				op <= key_value;

				// 最多会用3个数码管显示符号，不用时也置为空，不然可能会是上一次的值
				case(op)
					4'ha: begin // +
						seg_data_3 <= 5'd16;
						seg_data_4 <= 5'd10;
						//seg_data_5 <= 5'd11;
						seg_data_5 <= 5'd12;
					end
					4'hb: begin // -
						seg_data_3 <= 5'd16;
						seg_data_4 <= 5'd12;
						seg_data_5 <= 5'd16;
					end
					4'hc: begin // *
						seg_data_3 <= 5'd16;
						seg_data_4 <= 5'd13;
						seg_data_5 <= 5'd16;
					end
					4'hd: begin // /
						seg_data_3 <= 5'd12;
						seg_data_4 <= 5'd14;
						seg_data_5 <= 5'd12;
					end
					default: begin
						seg_data_3 <= 5'd16;
						seg_data_4 <= 5'd15;
						seg_data_5 <= 5'd15;
					end
				endcase
			end
		end else if(next_st == S21) begin
			if(key_value < 4'ha) begin
				seg_data_6 <= key_value;
				v21 <= key_value;
				v22 <= 4'h0;
			end
		end else if(next_st == S22) begin
			if(key_value < 4'ha) begin
				seg_data_7 <= key_value;
				v22 <= key_value;
			end
		end else if(next_st == S_EQ) begin
			if(key_value == 4'he) begin
				// 计算
				seg_data_8 <= 5'd18;
			end
		end else if(next_st == S_ERR) begin
			// ERR
			seg_data_6 <= 5'd15;
			seg_data_7 <= 5'd17;
			seg_data_8 <= 5'd17;
		end
			
	end

end

endmodule