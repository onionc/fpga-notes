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


reg [3:0] v11; // 操作数1的个位
reg [3:0] v12; // 操作数1的十位
reg [3:0] v21; // 操作数2的个位
reg [3:0] v22; // 操作数2的十位
reg [3:0] op; // 运算符

wire [7:0] v1; // 操作数1
wire [7:0] v2; // 操作数2


reg [15:0] v_res; // 结果，最多支持16位
// 计算后将结果再拆分
wire [3:0] v_r1; // 个位
wire [3:0] v_r2; // 十位
wire [3:0] v_r3; // 百位
wire [3:0] v_r4; // 千位
wire neg, neg2, neg3, neg4; // 负号

reg [7:0] v_res2; // 备用
wire [15:0] v_res_mul; // 乘法的结果
wire [7:0] Q; // 除法结果：商
wire [7:0] R; // 除法结果：余数
reg [7:0] v_r_res; // 除法余数的扩展，乘10，再去计算小数部分
wire [7:0] Q2; // 除法结果：商2
wire [7:0] R2; // 除法结果：余数2

// 拆分第2个
reg [7:0] v_split;
wire [3:0] v_split_r1, v_split_r2, v_split_r3, v_split_r4;


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
            16'h2000: key_value <= 4'hf;  // C 清除（重置） 
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
                v12 <= 4'h0; // v12 十位赋值为0

                seg_data_1 <= 4'h0;
                seg_data_2 <= key_value;

                // 清除其他数据
                seg_data_3 <= 5'd16;
                seg_data_4 <= 5'd16;
                seg_data_5 <= 5'd16;
                seg_data_6 <= 5'd16;
                seg_data_7 <= 5'd16;
                seg_data_8 <= 5'd16;
            end
            

        end else if(next_st == S12) begin
            if(key_value < 4'ha && v12==4'h0) begin // 用v12的值来使下面的逻辑只运行一次，不能运行多次，不然v11==v12
                v12 <= v11; // 先把个位赋值给十位
                v11 <= key_value; // 再把新值赋给个位

                seg_data_1 <= v11;
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
                v21 <= key_value;
                v22 <= 4'h0;

                seg_data_6 <= 4'h0;
                seg_data_7 <= key_value;

            end
        end else if(next_st == S22) begin
            if(key_value < 4'ha && v22==4'h0) begin
                v22 <= v21; // 先把个位赋值给十位
                v21 <= key_value; // 再把新值赋给个位

                seg_data_6 <= v21;
                seg_data_7 <= key_value;
            end
        end else if(next_st == S_EQ) begin
            if(key_value == 4'he) begin
                // 等号以及其他不用的位
                seg_data_1 <= 5'd18; // 等号
                seg_data_2 <= 5'd16; // -号
                seg_data_3 <= 5'd16; // 数值千位
                seg_data_4 <= 5'd16; // 数值百位
                seg_data_5 <= 5'd16; // 数值十位
                seg_data_6 <= 5'd16; // 数值个位
                seg_data_7 <= 5'd16; // 小数
                seg_data_8 <= 5'd16;


                // 计算
                case(op)
                    4'ha: begin
                        // 简单加法，没有考虑负数
                        /*
                        v_res2 <= v1 + v2;
                        if(v_res2>8'd100)  // 超过100当做溢出
                            v_res <= v_res2-8'd100;
                        else
                            v_res <= v_res2;
                        */
                        v_res <= v1 + v2;    
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};
                    end
                    
                    4'hb: begin 
                        // 简单减法
                        v_res <= v1 - v2;

                        if(neg == 1'b1)
                            seg_data_2 <= 5'd12;
                        else 
                            seg_data_2 <= 5'd16;
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};
                    end
                    4'hc: begin
                        // 乘法，也不支持结果超过8位值（或显示十进制两位）的精度，不然还得扩展除法以及拆分和拼接部分
                        /*
                        if(v_res_mul>8'd100)  // 超过100当做溢出
                            v_res <= v_res_mul[7:0]; // 精度原因，暴力截断，可能显示的数值会有问题
                        else
                            v_res <= v_res2;
                        
                        v_res <= v_res_mul[7:0];
                        */
                        v_res <= v_res_mul;
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};

                    end
                    4'hd: begin
                        // 除法
                        //seg_data_2 <= 5'd16;

                        // 商的显示
                        v_res <= Q;
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};

                        // 小数点位置
                        seg_dot_en <= 8'h20;

                        // 通过余数来计算小数部分
                        v_r_res <= {1'b0, R[3:0], 3'b0} + R[3:0] + R[3:0];
                        v_split <= Q2;
                        seg_data_7 <= {0'b0, v_split_r1};


                    end
                    
                    default:
                        v_res <= 32'd0;
                endcase


            end
        end else if(next_st == S_ERR) begin
            // ERR
            seg_data_6 <= 5'd15;
            seg_data_7 <= 5'd17;
            seg_data_8 <= 5'd17;
        end
            
    end

end

// 拼接
num_join num_join_inst1(
    .tens(v12),
    .ones(v11),
    .vout(v1) 
);
num_join num_join_inst2(
    .tens(v22),
    .ones(v21),
    .vout(v2) 
);

// 再拆分
num_split num_split_inst1(
    .v(v_res),
    .thd(v_r4),
    .hud(v_r3),
    .ten(v_r2),
    .one(v_r1),
    .neg(neg)
);

// 乘法
calc_mul calc_mul_inst1(
    .A(v1),
    .B(v2),
    .out(v_res_mul)
);

// 除法
calc_div calc_div_inst1(
    .A(v1),
    .B(v2),
    .Q(Q),
    .R(R),
    .neg(neg2)
);
calc_div calc_div_inst2( // 通过余数计算小数
    .A(v_r_res),
    .B(v2),
    .Q(Q2),
    .R(R2),
    .neg(neg3)
);
num_split num_split_inst2(
    .v(v_split),
    .thd(v_split_r4),
    .hud(v_split_r3),
    .ten(v_split_r2),
    .one(v_split_r1),
    .neg(neg4)
);


endmodule