// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Dec  5 13:29:13 2023
// Host        : OS-20220312IFCD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/labs/zynq/fpga-notes/A001.1.led/prj/led.srcs/sources_1/bd/design_1/ip/design_1_io_change_0_0/design_1_io_change_0_0_sim_netlist.v
// Design      : design_1_io_change_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_io_change_0_0,io_change,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "io_change,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module design_1_io_change_0_0
   (sclk,
    s_rst,
    led);
  input sclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_rst;
  output [3:0]led;

  wire [3:0]led;
  wire s_rst;
  wire sclk;

  design_1_io_change_0_0_io_change inst
       (.led(led),
        .s_rst(s_rst),
        .sclk(sclk));
endmodule

(* ORIG_REF_NAME = "io_change" *) 
module design_1_io_change_0_0_io_change
   (led,
    sclk,
    s_rst);
  output [3:0]led;
  input sclk;
  input s_rst;

  wire [25:0]cnt;
  wire cnt0_carry__0_n_0;
  wire cnt0_carry__0_n_1;
  wire cnt0_carry__0_n_2;
  wire cnt0_carry__0_n_3;
  wire cnt0_carry__1_n_0;
  wire cnt0_carry__1_n_1;
  wire cnt0_carry__1_n_2;
  wire cnt0_carry__1_n_3;
  wire cnt0_carry__2_n_0;
  wire cnt0_carry__2_n_1;
  wire cnt0_carry__2_n_2;
  wire cnt0_carry__2_n_3;
  wire cnt0_carry__3_n_0;
  wire cnt0_carry__3_n_1;
  wire cnt0_carry__3_n_2;
  wire cnt0_carry__3_n_3;
  wire cnt0_carry__4_n_0;
  wire cnt0_carry__4_n_1;
  wire cnt0_carry__4_n_2;
  wire cnt0_carry__4_n_3;
  wire cnt0_carry_n_0;
  wire cnt0_carry_n_1;
  wire cnt0_carry_n_2;
  wire cnt0_carry_n_3;
  wire [25:0]cnt_1;
  wire [25:1]data0;
  wire [3:0]led;
  wire \led[3]_i_2_n_0 ;
  wire \led[3]_i_3_n_0 ;
  wire \led[3]_i_4_n_0 ;
  wire \led[3]_i_5_n_0 ;
  wire \led[3]_i_6_n_0 ;
  wire \led[3]_i_7_n_0 ;
  wire \led[3]_i_8_n_0 ;
  wire \led[3]_i_9_n_0 ;
  wire led_0;
  wire s_rst;
  wire sclk;
  wire [3:0]NLW_cnt0_carry__5_CO_UNCONNECTED;
  wire [3:1]NLW_cnt0_carry__5_O_UNCONNECTED;

  CARRY4 cnt0_carry
       (.CI(1'b0),
        .CO({cnt0_carry_n_0,cnt0_carry_n_1,cnt0_carry_n_2,cnt0_carry_n_3}),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt[4:1]));
  CARRY4 cnt0_carry__0
       (.CI(cnt0_carry_n_0),
        .CO({cnt0_carry__0_n_0,cnt0_carry__0_n_1,cnt0_carry__0_n_2,cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt[8:5]));
  CARRY4 cnt0_carry__1
       (.CI(cnt0_carry__0_n_0),
        .CO({cnt0_carry__1_n_0,cnt0_carry__1_n_1,cnt0_carry__1_n_2,cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt[12:9]));
  CARRY4 cnt0_carry__2
       (.CI(cnt0_carry__1_n_0),
        .CO({cnt0_carry__2_n_0,cnt0_carry__2_n_1,cnt0_carry__2_n_2,cnt0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(cnt[16:13]));
  CARRY4 cnt0_carry__3
       (.CI(cnt0_carry__2_n_0),
        .CO({cnt0_carry__3_n_0,cnt0_carry__3_n_1,cnt0_carry__3_n_2,cnt0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(cnt[20:17]));
  CARRY4 cnt0_carry__4
       (.CI(cnt0_carry__3_n_0),
        .CO({cnt0_carry__4_n_0,cnt0_carry__4_n_1,cnt0_carry__4_n_2,cnt0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(cnt[24:21]));
  CARRY4 cnt0_carry__5
       (.CI(cnt0_carry__4_n_0),
        .CO(NLW_cnt0_carry__5_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_cnt0_carry__5_O_UNCONNECTED[3:1],data0[25]}),
        .S({1'b0,1'b0,1'b0,cnt[25]}));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .O(cnt_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[10]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[10]),
        .O(cnt_1[10]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[11]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[11]),
        .O(cnt_1[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[12]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[12]),
        .O(cnt_1[12]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[13]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[13]),
        .O(cnt_1[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[14]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[14]),
        .O(cnt_1[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[15]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[15]),
        .O(cnt_1[15]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[16]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[16]),
        .O(cnt_1[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[17]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[17]),
        .O(cnt_1[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[18]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[18]),
        .O(cnt_1[18]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[19]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[19]),
        .O(cnt_1[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[1]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[1]),
        .O(cnt_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[20]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[20]),
        .O(cnt_1[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[21]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[21]),
        .O(cnt_1[21]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[22]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[22]),
        .O(cnt_1[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[23]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[23]),
        .O(cnt_1[23]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[24]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[24]),
        .O(cnt_1[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[25]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[25]),
        .O(cnt_1[25]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[2]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[2]),
        .O(cnt_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[3]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[3]),
        .O(cnt_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[4]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[4]),
        .O(cnt_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[5]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[5]),
        .O(cnt_1[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[6]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[6]),
        .O(cnt_1[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[7]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[7]),
        .O(cnt_1[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[8]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[8]),
        .O(cnt_1[8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[9]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .I1(data0[9]),
        .O(cnt_1[9]));
  FDCE \cnt_reg[0] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[0]),
        .Q(cnt[0]));
  FDCE \cnt_reg[10] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[10]),
        .Q(cnt[10]));
  FDCE \cnt_reg[11] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[11]),
        .Q(cnt[11]));
  FDCE \cnt_reg[12] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[12]),
        .Q(cnt[12]));
  FDCE \cnt_reg[13] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[13]),
        .Q(cnt[13]));
  FDCE \cnt_reg[14] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[14]),
        .Q(cnt[14]));
  FDCE \cnt_reg[15] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[15]),
        .Q(cnt[15]));
  FDCE \cnt_reg[16] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[16]),
        .Q(cnt[16]));
  FDCE \cnt_reg[17] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[17]),
        .Q(cnt[17]));
  FDCE \cnt_reg[18] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[18]),
        .Q(cnt[18]));
  FDCE \cnt_reg[19] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[19]),
        .Q(cnt[19]));
  FDCE \cnt_reg[1] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[1]),
        .Q(cnt[1]));
  FDCE \cnt_reg[20] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[20]),
        .Q(cnt[20]));
  FDCE \cnt_reg[21] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[21]),
        .Q(cnt[21]));
  FDCE \cnt_reg[22] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[22]),
        .Q(cnt[22]));
  FDCE \cnt_reg[23] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[23]),
        .Q(cnt[23]));
  FDCE \cnt_reg[24] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[24]),
        .Q(cnt[24]));
  FDCE \cnt_reg[25] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[25]),
        .Q(cnt[25]));
  FDCE \cnt_reg[2] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[2]),
        .Q(cnt[2]));
  FDCE \cnt_reg[3] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[3]),
        .Q(cnt[3]));
  FDCE \cnt_reg[4] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[4]),
        .Q(cnt[4]));
  FDCE \cnt_reg[5] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[5]),
        .Q(cnt[5]));
  FDCE \cnt_reg[6] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[6]),
        .Q(cnt[6]));
  FDCE \cnt_reg[7] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[7]),
        .Q(cnt[7]));
  FDCE \cnt_reg[8] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[8]),
        .Q(cnt[8]));
  FDCE \cnt_reg[9] 
       (.C(sclk),
        .CE(1'b1),
        .CLR(\led[3]_i_2_n_0 ),
        .D(cnt_1[9]),
        .Q(cnt[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \led[3]_i_1 
       (.I0(\led[3]_i_3_n_0 ),
        .O(led_0));
  LUT1 #(
    .INIT(2'h1)) 
    \led[3]_i_2 
       (.I0(s_rst),
        .O(\led[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[3]_i_3 
       (.I0(\led[3]_i_4_n_0 ),
        .I1(\led[3]_i_5_n_0 ),
        .I2(\led[3]_i_6_n_0 ),
        .I3(\led[3]_i_7_n_0 ),
        .I4(\led[3]_i_8_n_0 ),
        .I5(\led[3]_i_9_n_0 ),
        .O(\led[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \led[3]_i_4 
       (.I0(cnt[15]),
        .I1(cnt[14]),
        .I2(cnt[17]),
        .I3(cnt[16]),
        .O(\led[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \led[3]_i_5 
       (.I0(cnt[19]),
        .I1(cnt[18]),
        .I2(cnt[21]),
        .I3(cnt[20]),
        .O(\led[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \led[3]_i_6 
       (.I0(cnt[6]),
        .I1(cnt[7]),
        .I2(cnt[9]),
        .I3(cnt[8]),
        .O(\led[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \led[3]_i_7 
       (.I0(cnt[11]),
        .I1(cnt[10]),
        .I2(cnt[13]),
        .I3(cnt[12]),
        .O(\led[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \led[3]_i_8 
       (.I0(cnt[3]),
        .I1(cnt[2]),
        .I2(cnt[5]),
        .I3(cnt[4]),
        .O(\led[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFFFFFFFFFF)) 
    \led[3]_i_9 
       (.I0(cnt[24]),
        .I1(cnt[25]),
        .I2(cnt[22]),
        .I3(cnt[23]),
        .I4(cnt[1]),
        .I5(cnt[0]),
        .O(\led[3]_i_9_n_0 ));
  FDCE \led_reg[0] 
       (.C(sclk),
        .CE(led_0),
        .CLR(\led[3]_i_2_n_0 ),
        .D(led[3]),
        .Q(led[0]));
  FDPE \led_reg[1] 
       (.C(sclk),
        .CE(led_0),
        .D(led[0]),
        .PRE(\led[3]_i_2_n_0 ),
        .Q(led[1]));
  FDPE \led_reg[2] 
       (.C(sclk),
        .CE(led_0),
        .D(led[1]),
        .PRE(\led[3]_i_2_n_0 ),
        .Q(led[2]));
  FDPE \led_reg[3] 
       (.C(sclk),
        .CE(led_0),
        .D(led[2]),
        .PRE(\led[3]_i_2_n_0 ),
        .Q(led[3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
