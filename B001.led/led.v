module LED_shining(
	input clk,
	input rst_n,
	output led1,
	output led2
);

parameter CNT_1S = 12_000_000 - 1;
parameter CNT_500MS = CNT_1S >> 1;

reg [23:0] cnt;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) cnt <= 1'b0;
	else if(cnt >= CNT_1S) cnt <= 1'b0;
	else cnt <= cnt + 1'b1;
end

wire clk_div = (cnt>CNT_500MS) ? 1'b1 : 1'b0 ;

assign led1 = clk_div;
assign led2 = ~clk_div;



endmodule