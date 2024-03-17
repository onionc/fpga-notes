// 串口发送

module uart_tx(
    input               clk,
    input               rst_n,
    output  reg         bps_en_o, // 发送使能标志
    input               bps_clk, // 时钟输入
    
    input    [7:0]   tx_data, // 需要发出的数据
    output  reg             ttl_tx_o, // 发送数据信号

    input recv_flag // 接受标志
);

 


// 发送计数
reg     [3:0]   num;
reg     [9:0]   tx_data_r;

// 接受时钟信号的控制
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        bps_en_o <= 1'b0;
    else if(recv_flag && 1'b0) begin
        bps_en_o <= 1'b1;
        tx_data_r <= {1'b1, tx_data, 1'b0};
    end
    else if(num>=4'd10)
        bps_en_o <= 1'b0;
    else
        bps_en_o <= bps_en_o;

         
end

// 接受数据
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        num <= 4'b0;
        ttl_tx_o <= 8'b1;
    end else if(bps_en_o) begin
        if(bps_clk) begin
            num <= num + 1'b1;
            ttl_tx_o <= tx_data_r[num]; // 小端，低位在前
        end else if(num >= 4'd10)
            num <= 4'd0;
    end 

end


endmodule