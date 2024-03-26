// 8λ�������з���

module calc_div(
    input [15:0] A, // ������
    input [15:0] B, // ����
    output reg [15:0]  Q, // ��
    output reg [15:0]  R, // ����
    output reg neg // ����
);

// ����
/*
reg [7:0] A; // ������
reg [7:0] B; // ����
reg [7:0] R; // ����
reg [7:0] Q; // ��
*/
reg [7:0] i;
reg [15:0] A2;
reg [15:0] B2;
always @(*) begin
    /*
    A = v1;
    B = v2;
    */
    R = 16'b0;
    Q = 16'b0;
    neg = 1'b0;
   
    // ����ת����
    if(A[15] == 1'b1) begin
        A2 = {1'b0, ~A[14:0]} + 1'b1;
    end else
        A2 = A;

    if(B[15] == 1'b1)
        B2 = {1'b0, ~B[14:0]} + 1'b1;
    else
        B2 = B;

    for(i=1; i<=15; i=i+1) begin
        R = {R[14:0], A2[15-i]}; // ��A����һλ��R��
        if(R>=B) begin
            Q[15-i] = 1'b1;
            R = R - B;
            
        end else begin
            Q[15-i] = 1'b0;
        end
    end

    // ������ת��ȥ
    if(A[15]^B[15]) begin
        // Q = {1'b1, ~Q[6:0]} + 1'b1; //����������Ӹ��ţ���Ϊ-0û����ʾ��0��-0����һ��
        neg = 1'b1;
    end
end

endmodule