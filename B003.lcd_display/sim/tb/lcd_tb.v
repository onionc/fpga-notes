`timescale 1ns/1ns

module lcd_td();

    reg clk;
    reg rst_n;


    // ��Ļ
    wire lcd_spi_sclk;    // spi ʱ��
    wire lcd_spi_mosi;    // spi �������
    wire lcd_spi_cs;    // spi ʹ�ܽӿ�
    wire lcd_dc;          // spi ����/����
    wire lcd_reset;       // ��λ
    wire lcd_blk;         // ����

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

        // ��Ļ
        .lcd_spi_sclk(lcd_spi_sclk),    // spi ʱ��
        .lcd_spi_mosi(lcd_spi_mosi),    // spi �������
        .lcd_spi_cs(lcd_spi_cs),      // spi ʹ�ܽӿ�
        .lcd_dc(lcd_dc),          // spi ����/����
        .lcd_reset(lcd_reset),       // ��λ
        .lcd_blk(lcd_blk)         // ����
    );




endmodule