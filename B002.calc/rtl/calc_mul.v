// (无符号）8位乘法

module calc_mul(
    input [7:0] A, // 被乘数
    input [7:0] B, // 乘数
    output reg [15:0] out // 乘积
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