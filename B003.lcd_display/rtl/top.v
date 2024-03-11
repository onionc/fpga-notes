
// lcd ��ʾͼƬ��Ŀ

module top(
    input clk,
    input rst_n,

    // ��Ļ
    output lcd_spi_sclk,    // spi ʱ��
    output lcd_spi_mosi,    // spi �������
    output lcd_spi_cs,      // spi ʹ�ܽӿ�
    output lcd_dc,          // spi ����/����
    output lcd_reset,       // ��λ
    output lcd_blk         // ����
);

assign lcd_spi_cs = 1'b0; // Ƭѡ��������
assign lcd_blk = 1'b1; // ���ⳣ��



lcd lcd_inst(
    .clk(clk),
    .rst_n(rst_n),

    // ��Ļ
    .lcd_spi_sclk(lcd_spi_sclk),
    .lcd_spi_mosi(lcd_spi_mosi),
    //.lcd_spi_cs(lcd_spi_cs),
    .lcd_dc(lcd_dc),
    .lcd_reset(lcd_reset)
);

endmodule