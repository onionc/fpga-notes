// 数据拼接

module calc_1(
    input clk,
    input rst_n,
    input [7:0] v11,
    input [7:0] v12,
    output reg [7:0] v1
);

// 拼接个位v12和十位v11
always @(posedge clk or negedge rst_n) begin
    v1 <= {v11, 3'b0} + {v11, 1'b0} + v12;

end

// 除法
reg [7:0] A;
reg [7:0] B;
reg [7:0] R;
reg [7:0] Q;
reg [3:0] t;
reg [6:0] t2;

integer i;
always @(*) begin
    A = v2;
    R = 8'b0;
    Q = 8'b0;
    B = 8'd10;

    for(i=0; i<=7; i=i+1) begin
        R = {R[6:0], A[7-i]}; // 从A中移一位到R中
        if(R>=B) begin
            //Q = 8'd1;
            Q[7-i] = 1'b1;
            R = R - B;
            
        end else begin
            Q[7-i] = 1'b0;
        end
    end
end


endmodule