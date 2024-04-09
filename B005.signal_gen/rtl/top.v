

module  top
(
    input               clk,
    input               rst_n,
    output  wire        dac_spi_clk,
    output  wire        dac_spi_cs,
    output  wire        dac_spi_mosi
);

wire [7:0] data;

simple_dds simple_dds_inst(
    .clk(clk),
    .rst_n(rst_n),
    .dac_dat(data)
);

wire dac_done;
dac081 dac081_inst(
    .clk(clk),
    .rst_n(rst_n),
    // dac数据和采样完成标志
    .dac_data(data),
    .dac_done(dac_done),

    // spi
    .dac_spi_clk(dac_spi_clk),
    .dac_spi_cs(dac_spi_cs), // cs
    .dac_spi_mosi(dac_spi_mosi) // MOSI
);

endmodule