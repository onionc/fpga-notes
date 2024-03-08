// 十进制数字的两位拼接

module num_join(
    input [3:0] tens,  // 十位
    input [3:0] ones,  // 个位
    output  reg  [7:0] vout // 输出
);

// 拼接个位ones和十位tens, (tens*10+ones)
always @(*) begin
    vout = {tens, 3'b0} + {tens, 1'b0} + ones;
end

endmodule