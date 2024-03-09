// 8λ�������з���

module calc_div(
    input [7:0] A, // ������
    input [7:0] B, // ����
    output reg [7:0]  Q, // ��
    output reg [7:0]  R, // ����
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
reg [7:0] A2;
reg [7:0] B2;
always @(*) begin
    /*
    A = v1;
    B = v2;
    */
    R = 8'b0;
    Q = 8'b0;
    neg = 1'b0;
   
    // ����ת����
    if(A[7] == 1'b1) begin
        A2 = {1'b0, ~A[6:0]} + 1'b1;

    end else
        A2 = A;
    if(B[7] == 1'b1)
        A2 = {1'b0, ~B[6:0]} + 1'b1;
    else
        B2 = B;

    for(i=1; i<=7; i=i+1) begin
        R = {R[6:0], A2[7-i]}; // ��A����һλ��R��
        if(R>=B) begin
            Q[7-i] = 1'b1;
            R = R - B;
            
        end else begin
            Q[7-i] = 1'b0;
        end
    end

    // ������ת��ȥ
    if(A[7]^B[7]) begin
        // Q = {1'b1, ~Q[6:0]} + 1'b1; //����������Ӹ��ţ���Ϊ-0û����ʾ��0��-0����һ��
        neg = 1'b1;
    end
end

endmodule