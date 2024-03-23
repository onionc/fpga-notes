
module buzzer_tb;

reg clk;
reg rst_n;
wire buzzer_o;


initial begin
    rst_n <= 1'b0;
    clk <= 1'b0;
    #201
    rst_n <= 1'b1;
end
always #1 clk<=~clk;



top top_inst(
    .clk(clk),
    .rst_n(rst_n),
    .buzzer_o(buzzer_o)
);
defparam top_inst.CNT_MAX = 30;


endmodule