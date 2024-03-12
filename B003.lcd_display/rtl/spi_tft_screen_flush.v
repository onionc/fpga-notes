

//��spi tft��Ļ����ˢ��
module spi_tft_screen_flush(
    input           sys_clk                   ,
    input           sys_rst_n                 ,

    
    //�û��ӿ�
    input[7:0]      spi_screen_flush_data_i   ,  //��Ļ��ʾ����
    output          spi_screen_flush_updte_o  ,  //���ص�����ˢ��
    output          spi_screen_flush_fsync_o  ,  //��Ļ֡ͬ��
    //------
    
    

    //����ģ��
    input           tft_screen_flush_req_i    ,  //ˢ������
    output reg[7:0] tft_screen_flush_data_o   ,  //ˢ������
    output reg      tft_screen_flush_dc_o     ,  //ˢ��dc

    //SPI��ģ��     
    output          spi_send_flush_req_o      ,  //spi������������
    output          spi_send_flush_end_o      ,  //����spi����
    input           spi_send_flush_ack_i         //spiһ�����ݷ������
);
parameter   SCREEN_WIDTH  = 16'd320;
parameter   SCREEN_HEIGHT = 16'd240;
parameter Number_Of_Pixels = 32'd240*32'd320*32'd2 ; // ���ص����


localparam S_IDLE       = 4'b0001;
localparam S_DATA       = 4'b0010;  //��������
localparam S_DELAY      = 4'b0100;  //��ʱ
localparam S_FRAME_SYNC = 4'b1000;  // ֡ͬ��


localparam DELAY_5clk = 'd5; //����������֮���л��ȴ�5��ʱ������

reg[31:0]   flush_cnt;
reg[12:0]   delay_cnt;
reg[3:0] state , next_state;


assign spi_send_flush_req_o = (state == S_DATA) ? 1'b1 : 1'b0;
assign spi_send_flush_end_o = (state == S_DELAY || state == S_FRAME_SYNC) ? 1'b1 : 1'b0;


assign spi_screen_flush_updte_o = ( spi_send_flush_ack_i == 1'b1 && flush_cnt >= 'd11 ) ? 1'b1 : 1'b0;
assign spi_screen_flush_fsync_o = ( state == S_FRAME_SYNC ) ? 1'b1 : 1'b0;

always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0 )
        state <= S_IDLE;
    else
        state <= next_state;
end


always@(*) begin
    case(state)
    S_IDLE:
        if( tft_screen_flush_req_i == 1'b1 )
            next_state = S_DATA;
        else
            next_state = S_IDLE;
    S_DATA:
        if( spi_send_flush_ack_i == 1'b1 && flush_cnt <= 'd10 )  //����XY
            next_state = S_DELAY;
        else if( spi_send_flush_ack_i == 1'b1 && flush_cnt == (Number_Of_Pixels + 'd10))  //һ֡ͼ�����ݷ������
            next_state = S_FRAME_SYNC;
        else
            next_state = S_DATA;
    S_DELAY:
        if( delay_cnt == DELAY_5clk)
            next_state = S_DATA;
        else
            next_state = S_DELAY;
    S_FRAME_SYNC:
        next_state = S_IDLE;
    default: next_state = S_IDLE;
    endcase
end


//�������ݼ���
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0 )
        flush_cnt <= 'd0;
    else if( spi_send_flush_ack_i == 1'b1 &&  flush_cnt == (Number_Of_Pixels + 'd10))
        flush_cnt <= 'd0;
    else if( spi_send_flush_ack_i == 1'b1 )
        flush_cnt <= flush_cnt + 1'b1;
    else
        flush_cnt <= flush_cnt;
end


//��ʱ����
always@(posedge sys_clk or negedge sys_rst_n) begin
    if( sys_rst_n == 1'b0)
        delay_cnt <= 'd0;
    else if( state == S_DELAY)
        delay_cnt <= delay_cnt + 1'b1;
    else
        delay_cnt <= 'd0;
end


always @(*) begin
    case(flush_cnt)
    'd0: begin
        tft_screen_flush_data_o = 8'h2A;
        tft_screen_flush_dc_o   = 1'b0;
    end
    //дX
    'd1: begin
        tft_screen_flush_data_o = 8'h00;
        tft_screen_flush_dc_o   = 1'b1;
    end
    'd2: begin
        tft_screen_flush_data_o = 8'h00;
        tft_screen_flush_dc_o   = 1'b1;
    end
    'd3: begin
        tft_screen_flush_data_o = SCREEN_WIDTH[15:8];
        tft_screen_flush_dc_o   = 1'b1;
    end
    'd4: begin
        tft_screen_flush_data_o = SCREEN_WIDTH[7:0] - 1'b1;
        tft_screen_flush_dc_o   = 1'b1;
    end
    //дY
    'd5: begin
        tft_screen_flush_data_o = 8'h2B;
        tft_screen_flush_dc_o   = 1'b0;
    end
    'd6: begin
        tft_screen_flush_data_o = 8'h00;
        tft_screen_flush_dc_o   = 1'b1;
    end
    'd7: begin
        tft_screen_flush_data_o = 8'h00;
        tft_screen_flush_dc_o   = 1'b1;
    end
    'd8: begin
        tft_screen_flush_data_o = SCREEN_HEIGHT[15:8];
        tft_screen_flush_dc_o   = 1'b1;
    end
    'd9: begin
        tft_screen_flush_data_o = SCREEN_HEIGHT[7:0] - 1'b1;
        tft_screen_flush_dc_o   = 1'b1;
    end

    //д����
    'd10: begin
        tft_screen_flush_data_o = 8'h2C;
        tft_screen_flush_dc_o   = 1'b0;
    end
    default: begin
        tft_screen_flush_data_o = spi_screen_flush_data_i;  //ͼ����ʾ����
        tft_screen_flush_dc_o   = 1'b1;
    end
    endcase
end




endmodule
