// ʮ�������ֵ���λƴ��

module num_join(
    input [3:0] tens,  // ʮλ
    input [3:0] ones,  // ��λ
    output  reg  [7:0] vout // ���
);

// ƴ�Ӹ�λones��ʮλtens, (tens*10+ones)
always @(*) begin
    vout = {tens, 3'b0} + {tens, 1'b0} + ones;
end

endmodule