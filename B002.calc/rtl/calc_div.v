// 8位除法，有符号

module calc_div(
    input [7:0] A, // 被除数
    input [7:0] B, // 除数
    output reg [7:0]  Q, // 商
    output reg [7:0]  R, // 余数
    output reg neg // 负号
);

// 除法
/*
reg [7:0] A; // 被除数
reg [7:0] B; // 除数
reg [7:0] R; // 余数
reg [7:0] Q; // 商
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
   
    // 负数转正数
    if(A[7] == 1'b1) begin
        A2 = {1'b0, ~A[6:0]} + 1'b1;

    end else
        A2 = A;
    if(B[7] == 1'b1)
        A2 = {1'b0, ~B[6:0]} + 1'b1;
    else
        B2 = B;

    for(i=1; i<=7; i=i+1) begin
        R = {R[6:0], A2[7-i]}; // 从A中移一位到R中
        if(R>=B) begin
            Q[7-i] = 1'b1;
            R = R - B;
            
        end else begin
            Q[7-i] = 1'b0;
        end
    end

    // 负数再转回去
    if(A[7]^B[7]) begin
        // Q = {1'b1, ~Q[6:0]} + 1'b1; //不在商里面加负号，因为-0没法表示，0和-0补码一样
        neg = 1'b1;
    end
end

endmodule