

// //ģʽ0��CPOL= 0��CPHA=0��SCK����ʱ���߿�����Ϊ�͵�ƽ��������SCKʱ�ӵ������ر�������������SCKʱ�ӵ��½����л�
// //ģʽ1��CPOL= 0��CPHA=1��SCK����ʱ���߿�����Ϊ�͵�ƽ��������SCKʱ�ӵ��½��ر�������������SCKʱ�ӵ��������л�
// //ģʽ2��CPOL= 1��CPHA=0��SCK����ʱ���߿�����Ϊ�ߵ�ƽ��������SCKʱ�ӵ��½��ر�������������SCKʱ�ӵ��������л�
// //ģʽ3��CPOL= 1��CPHA=1��SCK����ʱ���߿�����Ϊ�ߵ�ƽ��������SCKʱ�ӵ������ر�������������SCKʱ�ӵ��½����л�




//ģʽ3��CPOL= 1��CPHA=1��SCK����ʱ���߿�����Ϊ�ߵ�ƽ��������SCKʱ�ӵ������ر�������������SCKʱ�ӵ��½����л�
module spi_master_driver(
    //ϵͳ�ӿ�
    input sys_clk                   ,
    input sys_rst_n                 ,

    //�û��ӿ�
    input           spi_start_i     ,   // spi��ʼ�ź�
    input           spi_end_i       ,   // spi�����ź�
    input[7:0]      spi_send_data_i ,   // spi��������
    output          spi_send_ack_o  ,   // spi����8bit��������ź�
      
    input           lcd_dc_i        ,   //���ݻ��������ź�����
    output  reg     lcd_dc          ,   //���ݻ��������ź����
    //spi  �˿�
    output  reg     spi_sclk        ,
    output  reg     spi_mosi        ,
    output  reg     spi_cs          
);


reg[7:0] spi_send_data_reg;         //���ݼĴ���
reg[3:0] spi_send_data_bit_cnt;     //���ݷ���bit������
reg      spi_end_reg;               //spi������־


assign   spi_send_ack_o = ( spi_send_data_bit_cnt == 'd6 && spi_sclk == 1'b1) ? 1'b1 : 1'b0;


//�������ݻ���
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0 )
        spi_send_data_reg <= 'd0;
    else if(spi_send_data_bit_cnt == 'd0)    //8bit���ݷ�����ɺ󣬻����µ�����
        spi_send_data_reg <= spi_send_data_i;
    else
        spi_send_data_reg <= spi_send_data_reg;
end

//����spi����
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        spi_end_reg <= 1'b0;
    else if( spi_cs == 1'b1)   //���������־
        spi_end_reg <= 1'b0;
    else if( spi_end_i == 1'b1)  //���������־
        spi_end_reg <= 1'b1;
    else
        spi_end_reg <= spi_end_reg;

end

//���������������
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        lcd_dc <= 1'b1;
    else if( spi_start_i == 1'b1)
        lcd_dc <= lcd_dc_i;
    else
        lcd_dc <= lcd_dc;
end

//Ƭѡspi
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        spi_cs <= 1'b1;
    else if( spi_end_reg == 1'b1 && spi_send_data_bit_cnt == 'd0)
        spi_cs <= 1'b1;
    else if( spi_start_i == 1'b1 )  
        spi_cs <= 1'b0;
    else
        spi_cs <= spi_cs;
end


//����spiʱ��
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        spi_sclk <= 1'b1;
    else if( spi_end_reg == 1'b1 && spi_send_data_bit_cnt == 'd0)
        spi_sclk <= spi_sclk;
    else if( spi_cs == 1'b0 )
        spi_sclk <= ~spi_sclk;
    else 
        spi_sclk <= 1'b1;
end


//���ݷ���bit���Ĵ���
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0) 
        spi_send_data_bit_cnt <= 'd0;
   else if( spi_end_reg == 1'b1 && spi_send_data_bit_cnt == 'd0)
        spi_send_data_bit_cnt <= 'd0;
    else if( spi_cs == 1'b0 && spi_sclk == 1'b0)
        if( spi_send_data_bit_cnt == 'd7)
            spi_send_data_bit_cnt <= 'd0;
        else
            spi_send_data_bit_cnt <= spi_send_data_bit_cnt + 1'b1;
    else if( spi_cs == 1'b0)
        spi_send_data_bit_cnt <= spi_send_data_bit_cnt;
    else
        spi_send_data_bit_cnt <= 'd0;
end

//spi���ݷ���
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        spi_mosi <= 1'b1;
    else if( spi_cs == 1'b0)
        spi_mosi <= spi_send_data_reg['d7 - spi_send_data_bit_cnt];
    else
        spi_mosi <= spi_mosi;
end

endmodule