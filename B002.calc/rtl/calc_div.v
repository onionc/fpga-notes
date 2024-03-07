// (无符号）8位除法

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
always @(*) begin
    /*
    A = v1;
    B = v2;
    */
    R = 8'b0;
    Q = 8'b0;
   
    for(i=0; i<=7; i=i+1) begin
        R = {R[6:0], A[7-i]}; // 从A中移一位到R中
        if(R>=B) begin
            Q[7-i] = 1'b1;
            R = R - B;
            
        end else begin
            Q[7-i] = 1'b0;
        end
    end
end

endmodule