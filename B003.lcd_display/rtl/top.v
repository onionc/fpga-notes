// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: picture_display
// 
// Author: Step
// 
// Description: LCD图片显示
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2023/10/30   |Initial ver
// --------------------------------------------------------------------

module  top #( //驱动lcd时调用
     parameter   TIME100MS    = 23'd1,  //23'd5000_000  // 一个clk的时间足够
                 TIME120MS    = 23'd1,  //23'd6000_000  
                 TIME150MS    = 23'd1,  //23'd7500_000  
                 TIMES4MAX    = 18'd153_613 ,  //320*240*2+13（设置窗口大小）=153_613   
                 DATA_IDLE    = 9'b0_0000_0000,
                 BPS_PARAM_TX    = 'd12, // 发送波特率：12M/1250=9600
                 BPS_PARAM_RX    = 'd12  // 接收波特率
 )
(
    input               clk            ,
    input               rst_n           ,
    
    // lcd
    output              lcd_reset     ,
    output              lcd_blk        ,
    output              lcd_dc      ,
    output              lcd_spi_sclk    ,
    output              lcd_spi_mosi    ,
    output              lcd_spi_cs,

    // uart
    input               ttl_rx,      // 串口接收信号
    output              ttl_tx_o    // 串口发送信号


);
wire    [8:0]   data;   
wire            en_write;
wire            wr_done; 

wire    [8:0]   init_data;
wire            en_write_init;
wire            init_done;

wire            en_size            ;
wire    [6:0]   ascii_num          ;
wire    [8:0]   start_x            ;
wire    [8:0]   start_y            ;

wire    [8:0]   show_pic_data     ;
wire            en_write_show_pic  ;
wire            show_char_done     ;  

assign            lcd_blk = 1'b1;



lcd_write  lcd_write_inst
(
    .sys_clk_50MHz(clk),
    .sys_rst_n    (rst_n),
    .data         (data),
    .en_write     (en_write),
                                
    .wr_done      (wr_done),
    .cs           (lcd_spi_cs),
    .dc           (lcd_dc),
    .sclk         (lcd_spi_sclk),
    .mosi         (lcd_spi_mosi)
);



lcd_init #(
    .TIME100MS(TIME100MS),
    .TIME120MS(TIME120MS),
    .TIME150MS(TIME150MS),
    .TIMES4MAX(TIMES4MAX),
    .DATA_IDLE(DATA_IDLE)
) lcd_init_inst
(
    .sys_clk_50MHz(clk),
    .sys_rst_n    (rst_n),
    .wr_done      (wr_done),

    .lcd_rst      (lcd_reset),
    .init_data    (init_data),
    .en_write     (en_write_init),
    .init_done    (init_done)
);

// fifo 声明
wire fifo_wrEn, fifo_reset, fifo_rpReset, fifo_empty, fifo_almostEmpty, fifo_full, fifo_almostFull;
wire [7:0] fifo_data;
wire [10:0] fifo_wcnt, fifo_rcnt;

reg fifo_rdEn;

/******************* UART start *******************/
// UART 接受模块配置
wire    bps_en_rx; // 接收使能
wire    bps_clk_rx; // 时钟传递
wire     [7:0]   rx_data; // 接受的数据

baud #(
    .BPS_PARAM(BPS_PARAM_RX) // 12M/1250=9600
) baud_inst_rx(
    .clk(clk),
    .rst_n(rst_n),
    .bps_en(bps_en_rx),
    .bps_clk_o(bps_clk_rx)
);

uart_rx uart_rx_inst(
    .clk(clk),
    .rst_n(rst_n),
    .bps_en_o(bps_en_rx),
    .bps_clk(bps_clk_rx),
    .ttl_rx(ttl_rx),
    .rx_data(rx_data)
);

// UART 发送模块配置
wire    bps_en_tx;
wire    bps_clk_tx;
wire recv_flag;


baud #(
    .BPS_PARAM(BPS_PARAM_TX) // 12M/1250=9600
) baud_inst_tx(
    .clk(clk),
    .rst_n(rst_n),
    .bps_en(bps_en_tx),
    .bps_clk_o(bps_clk_tx)
);


uart_tx uart_tx_inst(
    .clk(clk),
    .rst_n(rst_n),
    .bps_en_o(bps_en_tx),
    .bps_clk(bps_clk_tx),
    .tx_data(fifo_wcnt[7:0]),
    .ttl_tx_o(ttl_tx_o),
    .recv_flag(recv_flag)
);
/******************* UART end   *******************/


/******************* fifo ip **********************/




uart_fifo uart_fifo_inst (.Data(rx_data), .WrClock(clk), .RdClock(clk), .WrEn(recv_flag), .RdEn(fifo_rdEn), 
    .Reset(fifo_reset), .RPReset(fifo_rpReset), .Q(fifo_data), .WCNT(fifo_wcnt), .RCNT(fifo_rcnt), .Empty(fifo_empty), 
    .Full(fifo_almostEmpty), .AlmostEmpty(fifo_full), .AlmostFull(fifo_almostFull));

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        fifo_rdEn <= 1'b0;
    else begin

        if(rx_data == 'h55 && recv_flag)
            fifo_rdEn <= 1'b1;
        
        if(fifo_rdEn)
            fifo_rdEn <= 1'b0;
            
    end
  
end 

/******************* fifo ip end *****************/

control  control_inst
(
    .sys_clk                (clk), 
    .sys_rst_n              (rst_n),
    .init_data              (init_data),
    .en_write_init          (en_write_init),
    .init_done              (init_done),
    .show_pic_data          (show_pic_data),
    .en_write_show_pic      (en_write_show_pic),
    .data                   (data),
    .en_write               (en_write),
    .ttl_rx_flag            (bps_en_rx),
    .recv_flag              (recv_flag)
);

lcd_show_pic  lcd_show_pic_inst
(
    .sys_clk            (clk),
    .sys_rst_n          (rst_n),
    .wr_done            (wr_done),
    .init_done          (init_done), 
    .show_pic_data      (show_pic_data),   
    .en_write_show_pic  (en_write_show_pic),
    .fifo_wcnt          (fifo_wcnt),
    .recv_data          (rx_data)
);

endmodule