// ʮ�������ֵ���λƴ��

module num_join(
    input [3:0] v1,  // ʮλ
    input [3:0] v2,  // ��λ
    output  reg  [7:0] vout // ���
);

// ƴ�Ӹ�λv2��ʮλv1, (v1*10+v2)
always @(*) begin
    vout = {v1, 3'b0} + {v1, 1'b0} + v2;
end

endmodule