
// lcd 显示图片项目

module top(
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

assign lcd_spi_cs = 1'b0; // 片选拉低启动
assign lcd_blk = 1'b1; // 背光常亮



lcd lcd_inst(
    .clk(clk),
    .rst_n(rst_n),

    // 屏幕
    .lcd_spi_sclk(lcd_spi_sclk),
    .lcd_spi_mosi(lcd_spi_mosi),
    //.lcd_spi_cs(lcd_spi_cs),
    .lcd_dc(lcd_dc),
    .lcd_reset(lcd_reset)
);

endmodule