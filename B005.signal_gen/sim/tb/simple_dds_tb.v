`timescale 1ns/1ns
module simple_dds_tb();
    reg clk;
    reg rst_n;

    parameter CLK_CNT = 5'd20;
    initial begin
        clk <= 1'b0;
        rst_n <= 1'b0;

        #200
        rst_n <= 1'b1;
    end

    always #(CLK_CNT/2) clk = ~clk;


    wire [7:0] data;
    simple_dds simple_dds_test1(
        .clk(clk),
        .rst_n(rst_n),
        .dac_dat(data)
    );

endmodule