// 8位乘法

module calc_mul(
    input [7:0] A, // 被乘数
    input [7:0] B, // 乘数
    output reg [15:0] out // 乘积
);

integer i;
reg [15:0] A2; // 扩展
reg [15:0] B2;
always @(*) begin

    out = 16'b0;

    // 负数扩展
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