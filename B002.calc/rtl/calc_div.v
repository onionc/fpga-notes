// (�޷��ţ�8λ����

module calc_div(
    input [7:0] A, // ������
    input [7:0] B, // ����
    output reg [7:0]  Q, // ��
    output reg [7:0]  R  // ����
);

// ����
/*
reg [7:0] A; // ������
reg [7:0] B; // ����
reg [7:0] R; // ����
reg [7:0] Q; // ��
*/
reg [7:0] i;
always @(*) begin
    /*
    A = v1;
    B = v2;
    */
    R = 8'b0;
    Q = 8'b0;
   
    for(i=0; i<=7; i=i+1) begin
        R = {R[6:0], A[7-i]}; // ��A����һλ��R��
        if(R>=B) begin
            Q[7-i] = 1'b1;
            R = R - B;
            
        end else begin
            Q[7-i] = 1'b0;
        end
    end
end

endmodule