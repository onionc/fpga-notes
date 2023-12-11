`timescale 1ns/1ns

module tb_led_breath();

// ����
reg s_clk;
reg s_rst;
wire led;

// ��ʼ��
initial begin
    s_clk = 1'b0;

    // ��λ
    s_rst = 1'b0;
    #10
    s_rst = 1'b1;

end

// ʱ��
always #5 s_clk <= ~s_clk;

led_breath led_breath_inst(
    .s_clk(s_clk),
    .s_rst(s_rst),
    .led(led)
);



endmodule