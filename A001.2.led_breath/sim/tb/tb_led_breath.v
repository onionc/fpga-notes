`timescale 1ns/1ns

module tb_led_breath();

// 定义
reg s_clk;
reg s_rst;
wire led;

// 初始化
initial begin
    s_clk = 1'b0;

    // 复位
    s_rst = 1'b0;
    #10
    s_rst = 1'b1;

end

// 时钟
always #5 s_clk <= ~s_clk;

led_breath led_breath_inst(
    .s_clk(s_clk),
    .s_rst(s_rst),
    .led(led)
);



endmodule