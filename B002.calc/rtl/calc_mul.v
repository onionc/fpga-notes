// 8λ�˷�

module calc_mul(
    input [7:0] A, // ������
    input [7:0] B, // ����
    output reg [15:0] out // �˻�
);

integer i;
reg [15:0] A2; // ��չ
reg [15:0] B2;
always @(*) begin

    out = 16'b0;

    // ������չ
    if(A[7]==1'b1)
        A2 = {8'hff, A};
    else
        A2 = A;
    if(B[7]==1'b1)
        B2 = {8'hff, B};
    else
        B2 = B;

    for(i=0; i<=15; i=i+1) begin
        if(B2[i]==1) begin
            out = out + (A2<<i);
        end
    end

end

endmodule