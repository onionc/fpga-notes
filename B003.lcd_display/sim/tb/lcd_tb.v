`timescale 1ns/1ns

module lcd_td();

    reg clk;
    reg rst_n;


    // 屏幕
    wire lcd_spi_sclk;    // spi 时钟
    wire lcd_spi_mosi;    // spi 数据输出
    wire lcd_spi_cs;    // spi 使能接口
    wire lcd_dc;          // spi 数据/命令
    wire lcd_reset;       // 复位
    wire lcd_blk;         // 背光

    parameter CLK_CNT = 5'd20;

    initial begin

        clk <= 1'b0; 
        rst_n <= 1'b0;
        

        #200
        rst_n <= 1'b1;
    end

    always #(CLK_CNT/2) clk = ~clk;

    top#(
    .SCREEN_WIDTH(32'd3),
    .SCREEN_HEIGHT(32'd4),
    .DELAY_255ms(32'd1)
)top_inst(
        .clk(clk),
        .rst_n(rst_n),

        // 屏幕
        .lcd_spi_sclk(lcd_spi_sclk),    // spi 时钟
        .lcd_spi_mosi(lcd_spi_mosi),    // spi 数据输出
        .lcd_spi_cs(lcd_spi_cs),      // spi 使能接口
        .lcd_dc(lcd_dc),          // spi 数据/命令
        .lcd_reset(lcd_reset),       // 复位
        .lcd_blk(lcd_blk)         // 背光
    );




endmodule