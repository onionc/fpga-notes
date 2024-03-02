`timescale 1ns/1ns

module key_tb();

parameter CLK_PERIOD = 5'd20; // 时钟周期 20ns
parameter CNT_MAX = 20'd10; // 消抖时间 10 个周期，200ns

reg clk;
reg rst_n;
reg key;

wire led0;

initial begin
    clk <= 1'b0;
    rst_n <= 1'b0;
    key <= 1'b1;

    #200
    rst_n <= 1'b1;

    // key 信号变化
    #20
    key <= 1'b0;
    #20
    key <= 1'b1;
    #50
    key <= 1'b0;
    #40
    key <= 1'b1;
    #20
    key <= 1'b0;
    #300
    key <= 1'b1;
    #50
    key <= 1'b0;
    #40
    key <= 1'b1;
    #300
    key <= 1'b0;
    #30
    key <= 1'b1;
    #300
    key <= 1'b0;
    #300
    key <= 1'b1;
    #40
    key <= 1'b0;
    #30
    key <= 1'b1;
    
end

// 产生时钟
always #(CLK_PERIOD/2) clk = ~clk;

// 例化
key #(
    .CNT_MAX(CNT_MAX)
) key_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key1(key),
    .led0(led0)
);

endmodule