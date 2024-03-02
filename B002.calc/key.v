// 按键功能，消抖

/*
 * led，0亮1灭
 * key1，按下为0
*/

module key(
    input clk,
    input rst_n,
    input key1,
    output reg led0
);

// 系统时钟 50M，一个时钟周期是20ns
// 消抖时间 20ms = 20_000_000 / 20 = 1_000_000周期
parameter CNT_MAX = 20'd1_000_000;
//parameter CNT_MAX = 20'd200;

reg [19:0] cnt;
reg key_d0; // 将按键信号延迟一个时钟周期
reg key_d1; // 将按键信号延迟两个时钟周期
reg key_flag; // 按键状态

// 延迟1，2周期
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        key_d0 <= 1'b1;
        key_d1 <= 1'b1;
    end
    else begin
        key_d0 <= key1;
        key_d1 <= key_d0;
    end
end

// 按键值消抖
/* 累加型的，会有问题，在保持一样时还会一直计数
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 20'd0;
    else if(key_d1 != key_d0) // 按键发生变化
            cnt <= 20'd0;
    else begin
        // 按键和前一个时刻一样，则计数器开始计数
        cnt <= cnt + 1'b1;
    end
end
*/
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 20'd0;
    else if(key_d1 != key_d0) // 按键发生变化
        cnt <= CNT_MAX;
    else //按键和前一个时刻一样，则计数器开始递减到 0
        cnt <= (cnt>20'd0) ? (cnt-1'b1) : 20'd0;
end

reg key_flag2; // 按键状态变化，key_flag2 比 key_flag晚一个周期
// 消抖后的值
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        key_flag <= 1'b0;
        key_flag2 <= 1'b0;
    end
    else if(cnt == 20'd1) begin
        key_flag <= key_d1;
        key_flag2 <= key_flag;
    end
    else begin
        key_flag <= key_flag;
        key_flag2 <= key_flag;
    end
end


// 按下时点亮LED
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) 
        led0 <= 1'b1;
    else if(key_flag!=key_flag2) begin
        if(key_flag==1'b0) // 下降沿，按下
            led0 <= ~led0;
    end
end


endmodule