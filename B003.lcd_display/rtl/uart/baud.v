// 串口模块

module baud #(
    parameter       BPS_PARAM = 1250 // 12M/1250=9600
)(
    input   clk,
    input   rst_n,
    input   bps_en,
    output  reg bps_clk_o
);

// 计数
reg [12:0] cnt;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 1'b0;
    else if( (cnt>=BPS_PARAM-1) || (!bps_en) ) // 计数满或者不使能时清零
        cnt <= 1'b0;
    else
        cnt <= cnt + 1'b1;
end

// 产生时钟
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        bps_clk_o <= 1'b0;
    else if(cnt == (BPS_PARAM>>1)) // 占空比50%，跳变
        bps_clk_o <= 1'b1;
    else
        bps_clk_o <= 1'b0;
end

endmodule
