`timescale 1ns/1ns

module io_change(
    input   sclk,
    input   s_rst,
    output  reg   [3:0] led

);

localparam  DELAY_1S = 'd49_999_999;
reg [25:0] cnt;

always @(posedge sclk or negedge s_rst) begin
    if(s_rst == 1'b0)
        cnt = 'd0;
    else if(cnt == DELAY_1S)
        cnt = 'd0;
    else
        cnt = cnt + 1'b1;

end

always @(posedge sclk or negedge s_rst) begin
    if(s_rst == 1'b0)
        led <= 4'b1110;
    else if(cnt == DELAY_1S)
        led <= {led[2:0], led[3]};
end


endmodule