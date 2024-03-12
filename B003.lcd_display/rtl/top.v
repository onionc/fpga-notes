
// lcd ��ʾͼƬ��Ŀ

module top #(
	// ��ʱ���ɸ��ķ������
    parameter   DELAY_255ms = 32'd255_000 
)(
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

//��Ļ�ߴ�
parameter   SCREEN_WIDTH  = 32'd320;
parameter   SCREEN_HEIGHT = 32'd240;
//��Ļ��ʾ����
parameter   SCREEN_ORIENT = 2'b00;


assign lcd_blk = 1'b1; // ���ⳣ��


wire       flush_data_update  ;  //���µ�ǰ�������ʾ����ʹ��
reg[15:0]  flush_data         ;  //��ǰ�������ʾ������
wire[15:0] flush_addr_width   ;  //��ǰˢ�µ�x����
wire[15:0] flush_addr_height  ;  //��ǰˢ�µ�y����

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


    //�û��ź�
    .flush_data_update_o  (     flush_data_update   ),  //���µ�ǰ�������ʾ����ʹ��
    .flush_data_i         (     flush_data          ),  //��ǰ�������ʾ������
    .flush_addr_width_o   (     flush_addr_width    ),  //��ǰˢ�µ�x����
    .flush_addr_height_o  (     flush_addr_height   ),  //��ǰˢ�µ�y����
    //----

     //spi tft screen   ��Ļ�ӿ�          
    .lcd_spi_sclk       (   lcd_spi_sclk    ),           // ��Ļspiʱ�ӽӿ�
    .lcd_spi_mosi       (   lcd_spi_mosi    ),           // ��Ļspi���ݽӿ�
    .lcd_spi_cs         (   lcd_spi_cs      ),           // ��Ļspiʹ�ܽӿ�     
    .lcd_dc             (   lcd_dc          ),           // ��Ļ ����/���� �ӿ�
    .lcd_reset          (   lcd_reset       ),           // ��Ļ��λ�ӿ�
    .lcd_blk            (   lcd_blk         )            // ��Ļ����ӿ�
);



endmodule