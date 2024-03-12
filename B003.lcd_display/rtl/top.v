
// lcd 显示图片项目

module top #(
	// 延时，可更改方便调试
    parameter   DELAY_255ms = 32'd255_000 
)(
    input clk,
    input rst_n,

    // 屏幕
    output lcd_spi_sclk,    // spi 时钟
    output lcd_spi_mosi,    // spi 数据输出
    output lcd_spi_cs,      // spi 使能接口
    output lcd_dc,          // spi 数据/命令
    output lcd_reset,       // 复位
    output lcd_blk         // 背光
);

//屏幕尺寸
parameter   SCREEN_WIDTH  = 32'd320;
parameter   SCREEN_HEIGHT = 32'd240;
//屏幕显示方向
parameter   SCREEN_ORIENT = 2'b00;


assign lcd_blk = 1'b1; // 背光常亮


wire       flush_data_update  ;  //更新当前坐标点显示数据使能
reg[15:0]  flush_data         ;  //当前坐标点显示的数据
wire[15:0] flush_addr_width   ;  //当前刷新的x坐标
wire[15:0] flush_addr_height  ;  //当前刷新的y坐标

always@(posedge clk or negedge rst_n) begin
    if( rst_n == 1'b0)
        flush_data <= 16'd0;
    else if( flush_addr_width <= 'd160)
            flush_data <= 16'h0000;
    else
            flush_data <= 16'hffff;
end

screen_driver #(
    .SCREEN_WIDTH(SCREEN_WIDTH),
    .SCREEN_HEIGHT(SCREEN_HEIGHT),
    .SCREEN_ORIENT(SCREEN_ORIENT),
    .DELAY_255ms(DELAY_255ms)
) screen_driver_hp (
    .sys_clk            (   clk         ),
    .sys_rst_n          (   rst_n       ),


    //用户信号
    .flush_data_update_o  (     flush_data_update   ),  //更新当前坐标点显示数据使能
    .flush_data_i         (     flush_data          ),  //当前坐标点显示的数据
    .flush_addr_width_o   (     flush_addr_width    ),  //当前刷新的x坐标
    .flush_addr_height_o  (     flush_addr_height   ),  //当前刷新的y坐标
    //----

     //spi tft screen   屏幕接口          
    .lcd_spi_sclk       (   lcd_spi_sclk    ),           // 屏幕spi时钟接口
    .lcd_spi_mosi       (   lcd_spi_mosi    ),           // 屏幕spi数据接口
    .lcd_spi_cs         (   lcd_spi_cs      ),           // 屏幕spi使能接口     
    .lcd_dc             (   lcd_dc          ),           // 屏幕 数据/命令 接口
    .lcd_reset          (   lcd_reset       ),           // 屏幕复位接口
    .lcd_blk            (   lcd_blk         )            // 屏幕背光接口
);



endmodule