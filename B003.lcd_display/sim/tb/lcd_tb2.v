`timescale 1ns/1ns



module lcd_tb2();
    
    // 使用ip核仿真时，需要增加
    GSR GSR_INST(.GSR(1'b1));
    PUR PUR_INST(.PUR(1'b1));
    
    reg clk;
    reg rst_n;


    wire lcd_spi_sclk;    
    wire lcd_spi_mosi;    
    wire lcd_spi_cs;    
    wire lcd_dc;         
    wire lcd_reset;      
    wire lcd_blk;      
    reg ttl_rx;  
    wire ttl_tx_o;    // 串口发送信号
 

    parameter CLK_CNT = 5'd20;

    initial begin

        clk <= 1'b0; 
        rst_n <= 1'b0;
        #200

        rst_n <= 1'b1;
        ttl_rx <= 1'b1;
        #1000

        ttl_rx <= 1'b0; // 起始
        #200
        ttl_rx <= 1'b1;
        #500
        ttl_rx <= 1'b0;
        #100
        ttl_rx <= 1'b1;  // 高一直到停止
        #2000 

        // 另一个数
        ttl_rx <= 1'b0; // 起始
        #200
        ttl_rx <= 1'b1;
        #500
        ttl_rx <= 1'b1;
        #100
        ttl_rx <= 1'b1;  // 高一直到停止

        #2000 

        // 另一个数
        ttl_rx <= 1'b0; // 起始
        #200
        ttl_rx <= 1'b1;
        #500
        ttl_rx <= 1'b0;
        #100
        ttl_rx <= 1'b1;  // 高一直到停止


        
    end

    always #(CLK_CNT/2) clk = ~clk;

    top #(
        .TIME100MS(8'd10),
        .TIME120MS(8'd12),
        .TIME150MS(8'd15),
        .TIMES4MAX(8'd20),
        .BPS_PARAM_RX('d10),
        .BPS_PARAM_TX('d10)

    )top_inst(
        .clk(clk),
        .rst_n(rst_n),
        .lcd_spi_sclk(lcd_spi_sclk),
        .lcd_spi_mosi(lcd_spi_mosi),
        .lcd_spi_cs(lcd_spi_cs),
        .lcd_dc(lcd_dc),
        .lcd_reset(lcd_reset),
        .lcd_blk(lcd_blk),
        .ttl_rx(ttl_rx),
        .ttl_tx_o(ttl_tx_o)
    );
endmodule