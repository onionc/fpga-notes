
module spi_tft_screen_driver #(
    //��Ļ�ߴ�
    parameter   SCREEN_WIDTH  = 32'd320,
    parameter   SCREEN_HEIGHT = 32'd240,
    //��Ļ��ʾ����
    parameter   SCREEN_ORIENT = 2'b00,
    // �ӳ�ʱ�䣬�������
    parameter   DELAY_255ms = 32'd255_000 
)(
    input       sys_clk         ,
    input       sys_rst_n       ,


    //�û��ӿ�
    input[7:0]  spi_screen_flush_data_i   ,  //��Ļ��ʾ����
    output      spi_screen_flush_updte_o  ,  //���ص�����ˢ��
    output      spi_screen_flush_fsync_o  ,  //��Ļ֡ͬ��
    //------

     //spi tft screen   ��Ļ�ӿ�          
    output      lcd_spi_sclk    ,           // ��Ļspiʱ�ӽӿ�
    output      lcd_spi_mosi    ,           // ��Ļspi���ݽӿ�
    output      lcd_spi_cs      ,           // ��Ļspiʹ�ܽӿ�     
    output      lcd_dc          ,           // ��Ļ ����/���� �ӿ�
    output      lcd_reset       ,           // ��Ļ��λ�ӿ�
    output      lcd_blk                     // ��Ļ����ӿ�
);


//��Ļ�����źţ�Ĭ��
assign lcd_reset = 1'b1;
assign lcd_blk   = 1'b1;


//��ģ���ź�
reg             lcd_init_done   ;   //��ʼ����ɱ�־�ź�
wire            spi_start      ;
wire            spi_end        ;
wire[7:0]       spi_send_data  ;
wire            spi_send_ack   ;
wire            lcd_dc_i       ;




// ��ʼ��ģ���ź�
wire            tft_screen_init_req   ;  //��ʼ������
wire            tft_screen_init_ack   ;  //��ʼ�����  
wire[7:0]       tft_screen_init_data  ;  //��ʼ������
wire            tft_screen_init_dc    ;  //��ʼ��dc
wire            spi_send_init_req     ;  //spi������������
wire            spi_send_init_end     ;  //����spi����
wire            spi_send_init_ack     ;  //spiһ�����ݷ������


//ˢ��ģ��

wire tft_screen_flush_req;
wire[7:0] tft_screen_flush_data;
wire tft_screen_flush_dc ;

wire spi_send_flush_req;
wire spi_send_flush_end;
wire spi_send_flush_ack;


assign tft_screen_flush_req = ( lcd_init_done == 1'b1) ? 1'b1 : 1'b0;
assign spi_send_flush_ack  = ( lcd_init_done == 1'b1) ? spi_send_ack : 1'b0;


assign tft_screen_init_req = ~lcd_init_done;
assign spi_send_init_ack   =  ( lcd_init_done == 1'b0) ? spi_send_ack : 1'b0;





assign spi_start        = ( lcd_init_done == 1'b0) ? spi_send_init_req : spi_send_flush_req;
assign spi_end          = ( lcd_init_done == 1'b0) ? spi_send_init_end : spi_send_flush_end;
assign spi_send_data    = ( lcd_init_done == 1'b0) ? tft_screen_init_data : tft_screen_flush_data;
assign lcd_dc_i         = ( lcd_init_done == 1'b0) ? tft_screen_init_dc : tft_screen_flush_dc;


//��ʼ���Ƿ����
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        lcd_init_done <= 1'b0;
    else if( tft_screen_init_ack == 1'b1)
        lcd_init_done <= 1'b1;
    else
        lcd_init_done <= lcd_init_done;
end




spi_tft_screen_flush #(
    .SCREEN_WIDTH(SCREEN_WIDTH),
    .SCREEN_HEIGHT(SCREEN_HEIGHT),
    .Number_Of_Pixels(SCREEN_WIDTH*SCREEN_HEIGHT*'d2)
)spi_tft_screen_flush_hp(
    .sys_clk                (   sys_clk             ),
    .sys_rst_n              (   sys_rst_n           ),


     //�û��ӿ�
    .spi_screen_flush_data_i   (    spi_screen_flush_data_i ),  //��Ļ��ʾ����
    .spi_screen_flush_updte_o  (    spi_screen_flush_updte_o),  //���ص�����ˢ��
    .spi_screen_flush_fsync_o  (    spi_screen_flush_fsync_o),  //��Ļ֡ͬ��
    //------


    .tft_screen_flush_req_i  (  tft_screen_flush_req),  //ˢ������
    .tft_screen_flush_data_o (  tft_screen_flush_data),  //ˢ������
    .tft_screen_flush_dc_o   (  tft_screen_flush_dc),  //ˢ��dc


    .spi_send_flush_req_o    (  spi_send_flush_req  ),  //spi������������
    .spi_send_flush_end_o    (  spi_send_flush_end  ),  //����spi����
    .spi_send_flush_ack_i    (  spi_send_flush_ack  )   //spiһ�����ݷ������
);





//��ʼ��ģ��
spi_tft_screen_init  #(
    .SCREEN_WIDTH(SCREEN_WIDTH),
    .SCREEN_HEIGHT(SCREEN_HEIGHT),
    .SCREEN_ORIENT(SCREEN_ORIENT),
    .DELAY_255ms(DELAY_255ms)
) spi_tft_screen_init_hp(
    .sys_clk                (   sys_clk             ),
    .sys_rst_n              (   sys_rst_n           ),


    .tft_screen_init_req_i  (   tft_screen_init_req ),  //��ʼ������
    .tft_screen_init_ack_o  (   tft_screen_init_ack ),  //��ʼ�����  
    .tft_screen_init_data_o (   tft_screen_init_data),  //��ʼ������
    .tft_screen_init_dc_o   (   tft_screen_init_dc  ),  //��ʼ��dc


    .spi_send_init_req_o    (   spi_send_init_req   ),  //spi������������
    .spi_send_init_end_o    (   spi_send_init_end   ),  //����spi����
    .spi_send_init_ack_i    (   spi_send_init_ack   )   //spiһ�����ݷ������
);









spi_master_driver spi_master_driver_hp(
    //ϵͳ�ӿ�
    .sys_clk                    (    sys_clk         ),
    .sys_rst_n                  (    sys_rst_n       ),

    //�û��ӿ�
    .spi_start_i                (   spi_start       ),   // spi��ʼ�ź�
    .spi_end_i                  (   spi_end         ),   // spi�����ź�
    .spi_send_data_i            (   spi_send_data   ),   // spi��������
    .spi_send_ack_o             (   spi_send_ack    ),   // spi����8bit��������ź�
      
    .lcd_dc_i                   (   lcd_dc_i        ),   //���ݻ��������ź�����
    .lcd_dc                     (   lcd_dc          ),   //���ݻ��������ź����

    //spi  �˿�
    .spi_sclk                   (   lcd_spi_sclk    ),
    .spi_mosi                   (   lcd_spi_mosi    ),
    .spi_cs                     (   lcd_spi_cs      )
);

endmodule
