// (�޷��ţ�8λ�˷�

module calc_mul(
    input [7:0] A, // ������
    input [7:0] B, // ����
    output reg [15:0] out // �˻�
);

integer i;
always @(*) begin

    out = 16'b0;
   
    for(i=0; i<=7; i=i+1) begin
        if(B[i]==1) begin
            out = out + A<<i;
        end
    end
end

endmodule