// ������

module led_breath(
    input s_clk,
    input s_rst,
    output  reg    led
);


/*
localparam DELAY_1us = 'd3;
localparam K = 'd10;
*/

localparam DELAY_1us = 'd33_333_333;
localparam K = 'd1000;

reg flag; // ת����־
reg [ 6:0] cnt;
reg [ 9:0] cnt_1us; // 1us �ú�1ms�������Աȣ�����pwm
reg [ 9:0] cnt_1ms;

// 1us ��ʱ
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0) 
        cnt = 1'b0;
    else if(cnt == DELAY_1us)
        cnt = 1'b0;
    else
        cnt = cnt + 1'b1;
end

// 1us ����
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0)
        cnt_1us = 1'b0;
    else if(cnt==1'b0 && (cnt_1us == K-1))
        cnt_1us = 1'b0;
    else if(cnt == 1'b0)
        cnt_1us = cnt_1us + 1'b1;
end

// 1ms ����
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0) begin
        cnt_1ms = 1'b0;
        flag = 1'b0;
    end else if(cnt==1'b0 && (cnt_1us==1'b0) && (cnt_1ms == K-1)) begin
        cnt_1ms = 1'b0;
        flag = ~flag;
    end else if(cnt==1'b0 && cnt_1us == 1'b0)
        cnt_1ms = cnt_1ms + 1'b1;
    else
        ;
end

// led
always @(posedge s_clk or negedge s_rst) begin
    if(s_rst == 1'b0) begin
        led <= 1'b1;
    end
    /*
    else if(cnt_1ms == 1'b0) begin
        led <= flag==1'b1 ? 1'b1 : 1'b0;
    end
    */
    else if(cnt_1ms >= cnt_1us) begin
        led <= flag==1'b1 ? 1'b0 : 1'b1;
    end else
        led <= flag==1'b1 ? 1'b1 : 1'b0;
    
end

endmodule