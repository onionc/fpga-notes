// 蜂鸣器控制

module buzzer(
    input clk,
    input rst_n,
    input en, // 蜂鸣器使能
    input [4:0 ]tone, // 音调
    output reg sound_o // 声音输出
);

reg [15:0]  time_end;
// 不同音节控制，比如低音1=261.6Hz, 信号周期为：12MHz/261.6Hz=45871.5, 翻转为 45871.5/2=22936，计数值为 22936-1=22935

always @(posedge clk) begin
    
    case(tone)
        5'd1:   time_end =    16'd22935;    //L1,
        5'd2:   time_end =    16'd20428;    //L2,
        5'd3:   time_end =    16'd18203;    //L3,
        5'd4:   time_end =    16'd17181;    //L4,
        5'd5:   time_end =    16'd15305;    //L5,
        5'd6:   time_end =    16'd13635;    //L6,
        5'd7:   time_end =    16'd12147;    //L7,
        5'd8:   time_end =    16'd11464;    //M1,
        5'd9:   time_end =    16'd10215;    //M2,
        5'd10:  time_end =    16'd9100;     //M3,
        5'd11:  time_end =    16'd8589;     //M4,
        5'd12:  time_end =    16'd7652;     //M5,
        5'd13:  time_end =    16'd6817;     //M6,
        5'd14:  time_end =    16'd6073;     //M7,
        5'd15:  time_end =    16'd5740;     //H1,
        5'd16:  time_end =    16'd5107;     //H2,
        5'd17:  time_end =    16'd4549;     //H3,
        5'd18:  time_end =    16'd4294;     //H4,
        5'd19:  time_end =    16'd3825;     //H5,
        5'd20:  time_end =    16'd3408;     //H6,
        5'd21:  time_end =    16'd3036;     //H7,
        default:time_end =    16'd22935;
    endcase
/*
    case(tone)
        5'd1:   time_end =    16'd1;    //L1,
        5'd2:   time_end =    16'd2;    //L2,
        5'd3:   time_end =    16'd3;    //L3,
        5'd4:   time_end =    16'd4;    //L4,
        5'd5:   time_end =    16'd5;    //L5,
        5'd6:   time_end =    16'd6;    //L6,
        5'd7:   time_end =    16'd7;    //L7,
        5'd8:   time_end =    16'd8;    //M1,
        5'd9:   time_end =    16'd9;    //M2,
        5'd10:  time_end =    16'd10;     //M3,
        5'd11:  time_end =    16'd11;     //M4,
        5'd12:  time_end =    16'd12;     //M5,
        5'd13:  time_end =    16'd13;     //M6,
        5'd14:  time_end =    16'd14;     //M7,
        5'd15:  time_end =    16'd15;     //H1,
        5'd16:  time_end =    16'd16;     //H2,
        5'd17:  time_end =    16'd17;     //H3,
        5'd18:  time_end =    16'd18;     //H4,
        5'd19:  time_end =    16'd19;     //H5,
        5'd20:  time_end =    16'd20;     //H6,
        5'd21:  time_end =    16'd21;     //H7,
        default:time_end =    16'd1;
    endcase*/
end

// 计数器
reg [17:0]  time_cnt;
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        time_cnt <= 1'b0;
    else if(!en)
        time_cnt <= 1'b0;
    else if(time_cnt >= time_end)
        time_cnt <= 1'b0;
    else
        time_cnt <= time_cnt + 1'b1;

// 翻转
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        sound_o <= 1'b0;
    else if(time_cnt >= time_end)
        sound_o <= ~sound_o;
    else
        sound_o <= sound_o;


endmodule

