// 十进制数字的两位拼接

module num_join(
    input [3:0] v1,  // 十位
    input [3:0] v2,  // 个位
    output  reg  [7:0] vout // 输出
);

// 拼接个位v2和十位v1, (v1*10+v2)
always @(*) begin
    vout = {v1, 3'b0} + {v1, 1'b0} + v2;
end

endmodule