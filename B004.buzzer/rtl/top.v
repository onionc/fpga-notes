// 驱动蜂鸣器

module  top
(
    input               clk            ,
    input               rst_n           ,
    
    // 蜂鸣器
    output              buzzer_o    // 串口发送信号


);


wire buzzer_en=1'b1;

reg [23:0] cnt;
parameter CNT_MAX = 12_000_000;

// 1s计时
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 1'b0;
    else if(cnt >= CNT_MAX)
        cnt <= 1'b0;
    else 
        cnt <= cnt + 1'b1;
end

// 每个音响一秒
reg [4:0] tone;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        tone <= 1'b1;
    else if(cnt == CNT_MAX)
        if(tone == 5'd21)
            tone <= 1'b1;
        else
            tone <= tone + 1'b1;
    else
        tone <= tone;
end


buzzer buzzer_inst(
    .clk(clk),
    .rst_n(rst_n),
    .en(buzzer_en),
    .tone(tone),
    .sound_o(buzzer_o)
);

endmodule