// 8位除法，有符号

module calc_div(
    input [7:0] A, // 被除数
    input [7:0] B, // 除数
    output reg [7:0]  Q, // 商
    output reg [7:0]  R  // 余数
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
   
    // 负数转正数
    if(A[7] == 1'b1)
        A2 = (~A + 1'b1);
    else
        A2 = A;
    if(B[7] == 1'b1)
        B2 = (~B + 1'b1);
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
    if(A[7]^B[7])
        Q = {1'b1, ~Q[6:0] + 1'b1};
end

endmodule