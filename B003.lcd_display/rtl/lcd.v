
module lcd #(
    parameter SCREEN_WIDTH = 320,
    parameter SCREEN_HEIGHT = 240
)
(
    input   clk,
    input   rst_n,

    // фад╩
    output lcd_spi_sclk,
    output reg lcd_spi_mosi,
    //output lcd_spi_cs,
    output lcd_dc,
    output lcd_reset
);


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		lcd_spi_mosi <= 1'b0;
	else
		lcd_spi_mosi <= 1'b1;
end



endmodule