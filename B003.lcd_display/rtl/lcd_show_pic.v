
module lcd_show_pic
(
    input       wire            sys_clk             ,
    input       wire            sys_rst_n           ,
    input       wire            wr_done             ,
    input       wire            init_done       ,   //显示字符标志信号

   

    output      wire    [8:0]   show_pic_data       ,   //传输的命令或者数据
    output      wire            show_pic_done,
    output      wire            en_write_show_pic ,

    input       wire    [10:0]  fifo_wcnt, // fifo 数据长度标志
    output      reg             fifo_rdEn, // 读使能
    input       wire    [7:0]   fifo_data // 接收的数据
);

//画笔颜色
parameter   WHITE   = 16'hFFFF,
            BLACK   = 16'h0000, 
            BLUE    = 16'h001F,  
            BRED    = 16'hF81F,
            GRED    = 16'hFFE0,
            GBLUE   = 16'h07FF,
            RED     = 16'hF800,
            MAGENTA = 16'hF81F,
            GREEN   = 16'h07E0,
            CYAN    = 16'h7FFF,
            YELLOW  = 16'hFFE0,
            BROWN   = 16'hBC40, //棕色
            BRRED   = 16'hFC07, //棕红色
            GRAY    = 16'h8430; //灰色

//****************** Parameter and Internal Signal *******************//


parameter   SIZE_WIDTH_MAX = 8'd240;
parameter   SIZE_LENGTH_MAX = 9'd320;
parameter   SIZE_WIDTH2_MAX = {SIZE_WIDTH_MAX, 1'b0} -1;

parameter   STATE0 =        'b0000_0001;     
parameter   STATE1 =        'b0000_0010;
parameter   STATE_WR_DONE = 'b0000_0100;
parameter   STATE2 =        'b0000_1000;
parameter   DONE   =        'b0001_0000;



//状态转移
reg     [3:0]   state;

//设置显示窗口
reg     [3:0]   cnt_set_windows;

//状态STATE1跳转到STATE2的标志信号
reg            state1_finish_flag;

//等待rom数据读取完成的计数器
reg     [3:0]   cnt_rom_prepare;
// 之前是从0~5计数，读取rom的值，现在变为从串口读数

//rom的地址
reg     [8:0]  rom_addr;
wire    [15:0]   rom_q;

//rom输出数据移位后得到的数据temp
reg     [15:0]   temp;
reg     [7:0]   temp2;

//长度加1标志信号
reg             length_num_flag;

//长度计数器
reg     [8:0]   cnt_length_num;

//点的颜色计数器
reg     [9:0]   cnt_wr_color_data;

//要传输的命令或者数据
reg     [8:0]   data;

//状态STATE2跳转到DONE的标志信号        
wire    state2_finish_flag;

//******************************* Main Code **************************//


//状态转移
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state <= STATE0;
    else
        case(state)
            STATE0 : state <= (init_done) ? STATE1 : STATE0;
            STATE1 : state <= (state1_finish_flag) ? STATE_WR_DONE : STATE1; // STATE1之后
            STATE_WR_DONE : state <= (wr_done) ? STATE2 : STATE_WR_DONE;
            
            STATE2 : begin
                if(state2_finish_flag) // 结束则DONE
                    state <= DONE;
                else if(cnt_rom_prepare >= 'd5) // 发送一次数据后等待WR_DONE
                    state <= STATE_WR_DONE;
                else    state <= STATE2;
            end
            DONE   : state <= STATE0;
        endcase

//状态STATE1跳转到STATE2的标志信号
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state1_finish_flag <= 1'b0;
    else if((state==STATE1) && wr_done)
        state1_finish_flag <= 1'b1;
    else
        state1_finish_flag <= 1'b0;

//等待rom数据读取完成的计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)  begin
        cnt_rom_prepare <= 'd0;
        temp <= 16'heeee;
        cnt_wr_color_data <= 'd0;
        fifo_rdEn <= 1'b0;
    end else if(length_num_flag) begin
        cnt_rom_prepare <= 'd0;
        temp <= 16'heeee;
        cnt_wr_color_data <= 'd0;
    end else if(state == STATE2 && cnt_rom_prepare < 'd5) begin
        if(fifo_wcnt >= 'd2) begin
            
            cnt_rom_prepare <= cnt_rom_prepare + 1'b1;
        
            case(cnt_rom_prepare)
                'd0:  fifo_rdEn <= 1'b1;
                'd1:  fifo_rdEn <= 1'b0;
                'd2:  begin
                    temp2 <= fifo_data;
                    cnt_wr_color_data <= cnt_wr_color_data + 1'b1;
                end
                // 再等待3周期 d5
               
                
                default: fifo_rdEn <= 1'b0;
            endcase
        end 
    end else  if(cnt_rom_prepare >= 'd5)
        cnt_rom_prepare <= 'd0;
        

/*
//rom的地址
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        rom_addr <= 'd0;
    else if(cnt_rom_prepare == 'd1)      
        rom_addr <=  cnt_length_num;
        

//rom输出数据移位后得到的数据temp
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        temp <= 'd0;
    else if(cnt_rom_prepare == 'd3)
        temp <= rom_q;
    else if(state == STATE2 && wr_done) begin
        if(cnt_wr_color_data[0] == 1)
            temp <= temp >>16;
        else
            temp <= temp;
	end
*/
//长度加1标志信号
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        length_num_flag <= 1'b0;
   else if( wr_done && state == STATE2 &&  cnt_wr_color_data == SIZE_WIDTH2_MAX ) // 一行结束
       length_num_flag <= 1'b1;
    else
       length_num_flag <= 1'b0;
        
//长度计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_length_num <= 'd0;
    else if((cnt_length_num < SIZE_LENGTH_MAX-1) && length_num_flag)
        cnt_length_num <= cnt_length_num + 1'b1;

/*
//点的颜色计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_wr_color_data <= 'd0;
    else if(cnt_rom_prepare == 'd3 || state == DONE)
        cnt_wr_color_data <= 'd0;
    else if(state == STATE2 && wr_done)
        cnt_wr_color_data <= cnt_wr_color_data + 1'b1;
*/

//要传输的命令或者数据
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        data <= 9'h000;
    else if(state == STATE1)
        // init中设置过大小了，这里不再设置了。直接执行内存写入。每次就都默认全屏数据
        data <= 9'h02C;
    else if(state == STATE2)

        data <= {1'b1, temp2};
            

    else
        data <= data;   

//状态STATE2跳转到DONE的标志信号        
assign state2_finish_flag = ( (cnt_length_num == SIZE_LENGTH_MAX-1)  && length_num_flag ) ? 1'b1 : 1'b0;
        
//输出端口
assign show_pic_data = data;
assign en_write_show_pic = (state == STATE1 || cnt_rom_prepare == 'd5) ? 1'b1 : 1'b0;
assign show_pic_done = (state == DONE) ? 1'b1 : 1'b0;


pic_ram pic_ram_u0
(
    .address(rom_addr), 
    .q(rom_q)
);

endmodule
