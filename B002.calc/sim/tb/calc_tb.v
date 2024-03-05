`timescale 1ns/1ns

// 计算器状态机下按键后的组合逻辑测试

module calc_tb();

parameter CLK_CNT = 5'd20;

reg clk;
reg rst_n;
reg [3:0] col;
wire [3:0] row;
wire [15:0] key_out;

initial begin
    clk <= 1'b1; // 仿真时候发现这里默认为0的时候，分频后的clk第一个不太准（本来是400结果是390）。这里默认位高，后面就整400了，看着舒服
    rst_n <= 1'b0;
    col <= 4'b1111;

    #200
    rst_n <= 1'b1;

    // col输入 
    #100
    col <= 4'b1011; // 这里是300ns时赋值的，时钟从400整开始
    #1701 // 一个分频后的clk是400ns(20*20)，状态机4次循环后是1600 + 100（时钟开始前提前按下了)+1（到这一次时钟这刻赋值，其实应该加一个大clk，但是这里仿真，走个极限）
    col <= 4'b1111;
    #2000
    col <= 4'b1101; // 再次按下
    #2000
    col <= 4'b1111;
end

// 时钟
always #(CLK_CNT/2) clk = ~clk;



calc_sample #(
    .NUM_FOR_200HZ(CLK_CNT)
) calc_sample_inst(
	.clk(clk),
    .rst_n(rst_n),

	
    .col(col),
    .row(row)
 
); 

endmodule