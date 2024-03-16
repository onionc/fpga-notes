// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: picture_display
// 
// Author: Step
// 
// Description: LCD图片显示
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2023/10/30   |Initial ver
// --------------------------------------------------------------------

module  top #( //驱动lcd时调用
     parameter   TIME100MS    = 23'd1,  //23'd5000_000  // 一个clk的时间足够
                 TIME120MS    = 23'd1,  //23'd6000_000  
                 TIME150MS    = 23'd1,  //23'd7500_000  
                 TIMES4MAX    = 18'd153_613 ,  //320*240*2+13（设置窗口大小）=153_613   
                 DATA_IDLE    = 9'b0_0000_0000
 )
(
    input               clk            ,
    input               rst_n           ,
    
    output              lcd_reset     ,
     output                lcd_blk        ,
    output              lcd_dc      ,
    output              lcd_spi_sclk    ,
    output              lcd_spi_mosi    ,
    output              lcd_spi_cs      


);
wire    [8:0]   data;   
wire            en_write;
wire            wr_done; 

wire    [8:0]   init_data;
wire            en_write_init;
wire            init_done;

wire            en_size            ;
wire    [6:0]   ascii_num          ;
wire    [8:0]   start_x            ;
wire    [8:0]   start_y            ;

wire    [8:0]   show_pic_data     ;
wire            en_write_show_pic  ;
wire            show_char_done     ;  
wire     [8:0]  rom_addr;
wire    [239:0]   rom_q;

assign            lcd_blk = 1'b1;



lcd_write  lcd_write_inst
(
    .sys_clk_50MHz(clk),
    .sys_rst_n    (rst_n),
    .data         (data),
    .en_write     (en_write),
                                
    .wr_done      (wr_done),
    .cs           (lcd_spi_cs),
    .dc           (lcd_dc),
    .sclk         (lcd_spi_sclk),
    .mosi         (lcd_spi_mosi)
);

control  control_inst
(
    .sys_clk_50MHz          (clk), 
    .sys_rst_n              (rst_n),
    .init_data              (init_data),
    .en_write_init          (en_write_init),
    .init_done              (init_done),
    .show_pic_data          (show_pic_data),
    .en_write_show_pic      (en_write_show_pic),
    .data                   (data),
    .en_write               (en_write)
);

lcd_init #(
    .TIME100MS(TIME100MS),
    .TIME120MS(TIME120MS),
    .TIME150MS(TIME150MS),
    .TIMES4MAX(TIMES4MAX),
    .DATA_IDLE(DATA_IDLE)
) lcd_init_inst
(
    .sys_clk_50MHz(clk),
    .sys_rst_n    (rst_n),
    .wr_done      (wr_done),

    .lcd_rst      (lcd_reset),
    .init_data    (init_data),
    .en_write     (en_write_init),
    .init_done    (init_done)
);

lcd_show_pic  lcd_show_pic_inst
(
    .sys_clk            (clk),
    .sys_rst_n          (rst_n),
    .wr_done            (wr_done),
    .init_done          (init_done), 
    .rom_addr           (rom_addr), 
    .rom_q              (rom_q),
    .show_pic_data      (show_pic_data),   
    .en_write_show_pic  (en_write_show_pic)  
);

pic_ram pic_ram_u0
(
    .address(rom_addr), 
    .q(rom_q)
);

endmodule