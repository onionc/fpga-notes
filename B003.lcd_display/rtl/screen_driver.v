
module screen_driver #(
    //��Ļ�ߴ�
    parameter   SCREEN_WIDTH  = 32'd320,
    parameter   SCREEN_HEIGHT = 32'd240,
    //��Ļ��ʾ����
    parameter   SCREEN_ORIENT = 2'b00,
    // �ӳ�ʱ�䣬�������
    parameter   DELAY_255ms = 32'd255_000
)
(
    input       sys_clk         ,
    input       sys_rst_n       , 

    //�û��ź�
    output       flush_data_update_o  ,  //���µ�ǰ�������ʾ����ʹ��
    input[15:0]  flush_data_i         ,  //��ǰ�������ʾ������
    output[15:0] flush_addr_width_o   ,  //��ǰˢ�µ�x����
    output[15:0] flush_addr_height_o  ,  //��ǰˢ�µ�y����
    //----


     //spi tft screen   ��Ļ�ӿ�          
    output      lcd_spi_sclk    ,           // ��Ļspiʱ�ӽӿ�
    output      lcd_spi_mosi    ,           // ��Ļspi���ݽӿ�
    output      lcd_spi_cs      ,           // ��Ļspiʹ�ܽӿ�     
    output      lcd_dc          ,           // ��Ļ ����/���� �ӿ�
    output      lcd_reset       ,           // ��Ļ��λ�ӿ�
    output      lcd_blk                     // ��Ļ����ӿ�

);



//��Ļ�û��ӿ�
reg[7:0]  spi_screen_flush_data   ;  //��Ļ��ʾ����
wire      spi_screen_flush_updte  ;  //���ص�����ˢ��
wire      spi_screen_flush_fsync  ;  //��Ļ֡ͬ��
//------

//���������
reg[15:0]   width_cnt   ;
reg[15:0]   height_cnt  ;

//���ݸ���
reg         data_update_cnt;


//�������ݼĴ���
reg[15:0]   flush_data_reg;


assign flush_data_update_o  = (spi_screen_flush_updte == 1'b1 && data_update_cnt == 1'b1) ? 1'b1 : 1'b0; // ����ˢ���У�data_update_cnt������Ϊ��������İ������
assign flush_addr_width_o   = width_cnt; // ˢ�µ�x����
assign flush_addr_height_o  = height_cnt; // ˢ�µ�y����

// ʹ�� flash_update�ź������� data_update_cnt����
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        data_update_cnt <= 'd0;
    else if( spi_screen_flush_fsync == 1'b1 )
        data_update_cnt <= 'd0;
    else if( spi_screen_flush_updte == 1'b1)
        data_update_cnt <= data_update_cnt + 1'b1;
    else
        data_update_cnt <= data_update_cnt;
end

// ��ȱ���ˢ��
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0 )
        width_cnt <= 'd0;
    else if( spi_screen_flush_fsync == 1'b1 )
        width_cnt <= 'd0;
    else if( spi_screen_flush_updte == 1'b1 && data_update_cnt == 1'b1)
        if( width_cnt == (SCREEN_WIDTH - 1'b1))
            width_cnt <= 'd0;
        else
            width_cnt <= width_cnt + 1'b1;
    else
        width_cnt <= width_cnt;
end

// �߶ȱ���ˢ�£�ÿ�θ߶ȹ̶����ˢ����֮����+1
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0 )
        height_cnt <= 'd0;
    else if( spi_screen_flush_fsync == 1'b1)
        height_cnt <= 'd0;
    else if( width_cnt == (SCREEN_WIDTH - 1'b1) && spi_screen_flush_updte == 1'b1 && data_update_cnt == 1'b1)
        height_cnt <= height_cnt + 1'b1;
    else
        height_cnt <= height_cnt;
end



always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        flush_data_reg = 'd0;
    else if( spi_screen_flush_updte == 1'b1)
        if( data_update_cnt == 1'b0 )
            flush_data_reg = flush_data_i;
        else
            flush_data_reg = flush_data_reg << 8;
    else
        flush_data_reg = flush_data_reg;
end


always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        spi_screen_flush_data <= 'd0;
    else 
        spi_screen_flush_data <= flush_data_reg[15:0];
end


spi_tft_screen_driver #(
    .SCREEN_WIDTH(SCREEN_WIDTH),
    .SCREEN_HEIGHT(SCREEN_HEIGHT),
    .SCREEN_ORIENT(SCREEN_ORIENT),
    .DELAY_255ms(DELAY_255ms)
) spi_tft_screen_driver_hp (
    .sys_clk            (   sys_clk         ),
    .sys_rst_n          (   sys_rst_n       ),


    //�û��ӿ�
    .spi_screen_flush_data_i   (    spi_screen_flush_data   ),  //��Ļ��ʾ����
    .spi_screen_flush_updte_o  (    spi_screen_flush_updte  ),  //���ص�����ˢ��
    .spi_screen_flush_fsync_o  (    spi_screen_flush_fsync  ),  //��Ļ֡ͬ��
    //------


     //spi tft screen   ��Ļ�ӿ�          
    .lcd_spi_sclk       (   lcd_spi_sclk    ),           // ��Ļspiʱ�ӽӿ�
    .lcd_spi_mosi       (   lcd_spi_mosi    ),           // ��Ļspi���ݽӿ�
    .lcd_spi_cs         (   lcd_spi_cs      ),           // ��Ļspiʹ�ܽӿ�     
    .lcd_dc             (   lcd_dc          ),           // ��Ļ ����/���� �ӿ�
    .lcd_reset          (   lcd_reset       ),           // ��Ļ��λ�ӿ�
    .lcd_blk            (   lcd_blk         )            // ��Ļ����ӿ�
);
endmodule
