// 串口接收

module uart_rx(
    input               clk,
    input               rst_n,
    output  reg         bps_en_o, // 接收使能标志
    input               bps_clk, // 时钟输入
    input               ttl_rx, // 接收数据信号
    output  reg [7:0]   rx_data // 收到的数据
);

 
// 多级延时消除亚稳态
reg ttl_rx0, ttl_rx1;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ttl_rx0 <= 1'b0;
        ttl_rx1 <= 1'b0;
    end else begin
        ttl_rx0 <= ttl_rx;
        ttl_rx1 <= ttl_rx0;
    end
end

// 检测下降沿
wire    ttl_rx_n = ttl_rx0 & ttl_rx1 && (~ttl_rx);

// 接收计数
reg     [3:0]   num;
reg     [7:0]   rx_data_r;

// 接收时钟信号的控制
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        bps_en_o <= 1'b0;
    else if(ttl_rx_n && (!bps_en_o)) // 下降沿并且空闲，则使能
        bps_en_o <= 1'b1;
    else if(num>=4'd9)
        bps_en_o <= 1'b0;
end

// 接收数据
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        num <= 4'b0;
        rx_data <= 8'b0;
        rx_data_r <= 8'b0;
        
    end else if(bps_en_o) begin
        if( bps_clk) begin
            num <= num + 1'b1;
            if(num<=4'd8)
                rx_data_r[num-1] <= ttl_rx;   // 8位数据，小端，低位在前
            
        end else if(num==4'd9) begin // 这个else条件是  bps_clk低时 num==9 ，赋值.（有点难以理解>=9时也不行，仿真都没问题，以后再排查TODO）
                num <= 4'd0;
                rx_data <= rx_data_r;
        end

    end
    
end


endmodule