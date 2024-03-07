
module calc_1_tb();

reg clk;
reg rst_n;
reg [7:0] v11;
reg [7:0] v12;
wire [7:0] vout;

initial begin
    clk <= 1'b0; 
    rst_n <= 1'b0;

    #100
    rst_n <= 1'b1;

    #200
    v11 <= 4'd6;
    v12 <= 4'd7;
end
always #(200) clk = ~clk;

calc_1 calc_1_inst(
    .clk(clk),
    .rst_n(rst_n),
    .v11(v11),
    .v12(v12),
    .v1(vout)
);

endmodule