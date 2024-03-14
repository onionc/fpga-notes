`timescale 1ns/1ns

module lcd_tb2();

    reg clk;
    reg rst_n;


    wire lcd_spi_sclk;    
    wire lcd_spi_mosi;    
    wire lcd_spi_cs;    
    wire lcd_dc;         
    wire lcd_reset;      
    wire lcd_blk;         

    parameter CLK_CNT = 5'd20;

    initial begin

        clk <= 1'b0; 
        rst_n <= 1'b0;
        

        #200
        rst_n <= 1'b1;
    end

    always #(CLK_CNT/2) clk = ~clk;

    top #(
        .TIME100MS(8'd10),
        .TIME120MS(8'd12),
        .TIME150MS(8'd15),
        .TIMES4MAX(8'd20)
    )top_inst(
        .clk(clk),
        .rst_n(rst_n),
        .lcd_spi_sclk(lcd_spi_sclk),
        .lcd_spi_mosi(lcd_spi_mosi),
        .lcd_spi_cs(lcd_spi_cs),
        .lcd_dc(lcd_dc),
        .lcd_reset(lcd_reset),
        .lcd_blk(lcd_blk)
    );
endmodule