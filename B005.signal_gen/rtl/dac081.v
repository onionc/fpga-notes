// DAC081S101
module dac081(
    input               clk,
    input               rst_n,
    
    // dac数据和采样完成标志
    input   [7:0]       dac_data,
    output  reg        dac_done,

    // spi
    output  reg        dac_spi_clk,
    output  reg        dac_spi_cs, // cs
    output  reg        dac_spi_mosi // MOSI

);

parameter HIGH = 1'b1;
parameter LOW = 1'b0;


// DAC 传输(spi协议)，发送16个位
reg [7:0]   cnt;
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt <= 1'b0;
    else if(cnt >= 8'd34) cnt <= 1'b0;
    else 
        cnt <= cnt + 1'b1;

reg [7:0]   data;
always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        dac_spi_cs <= HIGH;
        dac_spi_clk <= LOW;
        dac_spi_mosi <= LOW;
    end else
        case(cnt)
            8'd0:   begin dac_spi_cs <= HIGH; dac_spi_clk <= LOW;  data <= dac_data;        end // start
            8'd2:   begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;     end // 0
            8'd4:   begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;     end // 1
            8'd6:   begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;     end // 2
            8'd8:   begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;     end // 3
            8'd10:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[7];   end // 4
            8'd12:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[6];   end // 5
            8'd14:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[5];   end // 6
            8'd16:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[4];   end // 7
            8'd18:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[3];   end // 8
            8'd20:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[2];   end // 9
            8'd22:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[1];   end // 10
            8'd24:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi<=data[0];   end // 11
            8'd26:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;     end // 12
            8'd28:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;     end // 13
            8'd30:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;   dac_done <= HIGH;  end // 14
            8'd32:  begin dac_spi_cs <= LOW;  dac_spi_clk <= HIGH; dac_spi_mosi <= LOW;   dac_done <= LOW ;  end // 15
            8'd34:  begin dac_spi_cs <= HIGH; dac_spi_clk <= LOW;                           end // end
            default: begin dac_spi_cs <= LOW; dac_spi_clk <= LOW; end // 奇数计数都走这里


        endcase 


endmodule