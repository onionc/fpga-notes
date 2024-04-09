module simple_dds(
    input   clk,
    input   rst_n,
    output  wire [7:0]   dac_dat
);

// 24位相位累加器
reg [23:0]  phase_acc;
always @(posedge clk or negedge rst_n)
    if(!rst_n)  phase_acc <= 24'b0;
    else phase_acc <= phase_acc + 1'b1;

// 相位地址
//wire [23:0] phase = phase_acc;
//assign dac_dat = phase[23:16]; // 锯齿波
wire [12:0] phase = phase_acc;
assign dac_dat = phase[12:5]; // 锯齿波
endmodule