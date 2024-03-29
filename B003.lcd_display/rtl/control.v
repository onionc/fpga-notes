
module  control
(
    input   wire             sys_clk       ,   
    input   wire             sys_rst_n           ,
    input   wire     [8:0]   init_data           ,
    input   wire             en_write_init       ,
    input   wire             init_done           ,
    input   wire     [8:0]   show_pic_data      ,
    input   wire             en_write_show_pic  ,
	 input   wire				  show_pic_done,
    output  reg      [8:0]   data                ,
    output  reg              en_write,

    // uart
    input   wire    ttl_rx_flag, // 接受数据标志，下降沿有效
    output  wire    recv_flag // 收到1像素数据
); 

reg      cnt1;

always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        data <= 'd0;
    else if(init_done == 1'b0)
        data <= init_data;
    else if(init_done == 1'b1)
        data <= show_pic_data;
    else
        data <= data;

always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        en_write <= 'd0;
    else if(init_done == 1'b0)
        en_write <= en_write_init ;
    else if(init_done == 1'b1)
        en_write <= en_write_show_pic;
    else
        en_write <= en_write;

// 检测 下降沿，接受数据标志

reg ttl_rx_flag0, ttl_rx_flag1;
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        ttl_rx_flag0 <= 1'b0;
        ttl_rx_flag1 <= 1'b0;
    end else begin
        ttl_rx_flag0 <= ttl_rx_flag;
        ttl_rx_flag1 <= ttl_rx_flag0;
    end
    
end

assign recv_flag = (ttl_rx_flag0) & (ttl_rx_flag1) & (~ttl_rx_flag);

endmodule

