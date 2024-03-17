
module lcd_show_pic
(
    input       wire            sys_clk             ,
    input       wire            sys_rst_n           ,
    input       wire            wr_done             ,
    input       wire            init_done       ,   //显示字符标志信号

   

    output      wire    [8:0]   show_pic_data       ,   //传输的命令或者数据
    output      wire            show_pic_done,
    output      wire            en_write_show_pic ,

    input       wire            recv_flag, // 接受数据标志 
    input       wire    [7:0]   recv_data // 接收的数据
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


//parameter   SIZE_WIDTH_MAX = 8'd240;
parameter   SIZE_WIDTH_MAX = 8'd20;
parameter   SIZE_LENGTH_MAX = 9'd320;
parameter   SIZE_WIDTH2_MAX = {SIZE_WIDTH_MAX, 1'b0} -1;

parameter   STATE0 = 4'b0_001;     
parameter   STATE1 = 4'b0_010;
parameter   STATE2 = 4'b0_100;
parameter   DONE   = 4'b1_000;



//状态转移
reg     [3:0]   state;

//设置显示窗口
reg     [3:0]   cnt_set_windows;

//状态STATE1跳转到STATE2的标志信号
reg            state1_finish_flag;

//等待rom数据读取完成的计数器
reg     [2:0]   cnt_rom_prepare;
// 之前是从0~5计数，读取rom的值，现在变为从串口读数

//rom的地址
reg     [8:0]  rom_addr;
wire    [15:0]   rom_q;

//rom输出数据移位后得到的数据temp
reg     [15:0]   temp;

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
            STATE1 : state <= (state1_finish_flag) ? STATE2 : STATE1;
            STATE2 : state <= (state2_finish_flag) ? DONE : STATE2;
            DONE   : state <= STATE0;
        endcase
/*
        
//设置显示窗口计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)  
        cnt_set_windows <= 'd0;
    else if(state == STATE1 && wr_done)
        cnt_set_windows <= cnt_set_windows + 1'b1;
*/
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
    if(!sys_rst_n || length_num_flag)  begin
        cnt_rom_prepare <= 'd0;
        temp <= 16'd0;
        cnt_wr_color_data <= 'd0;
    end
    else if(state == STATE2 && cnt_rom_prepare < 'd2) begin
        if(recv_flag) begin
            cnt_rom_prepare <= cnt_rom_prepare + 1'b1;
            cnt_wr_color_data <= cnt_wr_color_data + 1'b1;
            if(cnt_rom_prepare == 'd0)
                temp <= {temp[15:8], recv_data};
            else if(cnt_rom_prepare == 'd1)
                temp <= {recv_data, temp[7:0]};
        end 
        
            
    end else if(cnt_rom_prepare >= 'd2)
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
        if(cnt_wr_color_data[0] == 1'b0 )
data <= {1'b1,temp[15:8]};
        else
            data <= {1'b1,temp[7:0]};
            

    else
        data <= data;   

//状态STATE2跳转到DONE的标志信号        
assign state2_finish_flag = ( (cnt_length_num == SIZE_LENGTH_MAX-1)  && length_num_flag ) ? 1'b1 : 1'b0;
        
//输出端口
assign show_pic_data = data;
assign en_write_show_pic = (state == STATE1 || cnt_rom_prepare == 'd2) ? 1'b1 : 1'b0;
assign show_pic_done = (state == DONE) ? 1'b1 : 1'b0;


pic_ram pic_ram_u0
(
    .address(rom_addr), 
    .q(rom_q)
);

endmodule
