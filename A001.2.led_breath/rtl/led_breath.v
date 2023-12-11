// 呼吸灯

module led_breath(
    input s_clk,
    input s_rst,
    output  reg    led
);


/*
localparam DELAY_1us = 'd33;
localparam K = 'd10;
*/
localparam DELAY_1us = 'd33_333;
localparam K = 'd1000;

reg [7:0] cnt;
reg [ 9:1] cnt_1us; // 1us 好和1ms计数作对比，辅助pwm
reg [ 9:1] cnt_1ms;

// 1ms 计时
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0) 
        cnt = 0;
    else if(cnt == DELAY_1us)
        cnt = 0;
    else
        cnt = cnt + 1'b1;
end

// 1us 计数
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0)
        cnt_1us = 0;
    else if(cnt==0 && (cnt_1us == K-1))
        cnt_1us = 0;
    else if(cnt == 0)
        cnt_1us = cnt_1us + 1'b1;
end

// 1ms 计数
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0)
        cnt_1ms = 0;
    else if(cnt==0 && (cnt_1us==0) && (cnt_1ms == K-1))
        cnt_1ms = 0;
    else if(cnt==0 && cnt_1us == 0)
        cnt_1ms = cnt_1ms + 1'b1;
end

// led
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0)
        led <= 1'b1;
    else if(cnt_1ms < cnt_1us)
        led <= 1'b0;
    else
        led <= 1'b1;
    
end

endmodule