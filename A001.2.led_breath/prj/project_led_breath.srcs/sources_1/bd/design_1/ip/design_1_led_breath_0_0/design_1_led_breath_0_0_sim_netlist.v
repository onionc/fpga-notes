// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Feb 26 16:56:52 2024
// Host        : OS-20220312IFCD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/labs/zynq/fpga-notes/A001.2.led_breath/prj/project_led_breath.srcs/sources_1/bd/design_1/ip/design_1_led_breath_0_0/design_1_led_breath_0_0_sim_netlist.v
// Design      : design_1_led_breath_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_led_breath_0_0,led_breath,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "led_breath,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module design_1_led_breath_0_0
   (s_clk,
    s_rst,
    led);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_clk, ASSOCIATED_RESET s_rst, FREQ_HZ 5e+07, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_rst;
  output led;

  wire led;
  wire s_clk;
  wire s_rst;

  design_1_led_breath_0_0_led_breath inst
       (.led(led),
        .s_clk(s_clk),
        .s_rst(s_rst));
endmodule

(* ORIG_REF_NAME = "led_breath" *) 
module design_1_led_breath_0_0_led_breath
   (led,
    s_clk,
    s_rst);
  output led;
  input s_clk;
  input s_rst;

  wire \cnt[6]_i_2_n_0 ;
  wire cnt_1ms1;
  wire \cnt_1ms[5]_i_2_n_0 ;
  wire \cnt_1ms[9]_i_10_n_0 ;
  wire \cnt_1ms[9]_i_1_n_0 ;
  wire \cnt_1ms[9]_i_5_n_0 ;
  wire \cnt_1ms[9]_i_6_n_0 ;
  wire \cnt_1ms[9]_i_7_n_0 ;
  wire \cnt_1ms[9]_i_8_n_0 ;
  wire \cnt_1ms[9]_i_9_n_0 ;
  wire [9:0]cnt_1ms_reg;
  wire cnt_1us0;
  wire cnt_1us1__9;
  wire \cnt_1us[5]_i_2_n_0 ;
  wire \cnt_1us[9]_i_3_n_0 ;
  wire \cnt_1us[9]_i_5_n_0 ;
  wire \cnt_1us[9]_i_6_n_0 ;
  wire \cnt_1us[9]_i_7_n_0 ;
  wire [9:0]cnt_1us_reg;
  wire [6:0]cnt_reg;
  wire flag;
  wire flag_i_1_n_0;
  wire led;
  wire led1_carry__0_n_3;
  wire led1_carry_i_1__0_n_0;
  wire led1_carry_i_1_n_0;
  wire led1_carry_i_2__0_n_0;
  wire led1_carry_i_2_n_0;
  wire led1_carry_i_3_n_0;
  wire led1_carry_i_4_n_0;
  wire led1_carry_i_5_n_0;
  wire led1_carry_i_6_n_0;
  wire led1_carry_i_7_n_0;
  wire led1_carry_i_8_n_0;
  wire led1_carry_n_0;
  wire led1_carry_n_1;
  wire led1_carry_n_2;
  wire led1_carry_n_3;
  wire led_i_1_n_0;
  wire led_i_2_n_0;
  wire [6:0]p_0_in;
  wire [9:0]p_0_in__0;
  wire [9:0]p_0_in__1;
  wire p_1_in;
  wire s_clk;
  wire s_rst;
  wire [3:0]NLW_led1_carry_O_UNCONNECTED;
  wire [3:1]NLW_led1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_led1_carry__0_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[2]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt[3]_i_1 
       (.I0(cnt_reg[1]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt[4]_i_1 
       (.I0(cnt_reg[2]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[3]),
        .I4(cnt_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt[5]_i_1 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[4]),
        .I5(cnt_reg[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[6]_i_1 
       (.I0(\cnt[6]_i_2_n_0 ),
        .I1(cnt_reg[5]),
        .I2(cnt_reg[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \cnt[6]_i_2 
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[2]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[3]),
        .O(\cnt[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \cnt_1ms[0]_i_1 
       (.I0(cnt_1ms1),
        .I1(cnt_1ms_reg[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \cnt_1ms[1]_i_1 
       (.I0(cnt_1ms1),
        .I1(cnt_1ms_reg[0]),
        .I2(cnt_1ms_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \cnt_1ms[2]_i_1 
       (.I0(cnt_1ms1),
        .I1(cnt_1ms_reg[0]),
        .I2(cnt_1ms_reg[1]),
        .I3(cnt_1ms_reg[2]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \cnt_1ms[3]_i_1 
       (.I0(cnt_1ms1),
        .I1(cnt_1ms_reg[1]),
        .I2(cnt_1ms_reg[0]),
        .I3(cnt_1ms_reg[2]),
        .I4(cnt_1ms_reg[3]),
        .O(p_0_in__1[3]));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \cnt_1ms[4]_i_1 
       (.I0(cnt_1ms1),
        .I1(cnt_1ms_reg[2]),
        .I2(cnt_1ms_reg[0]),
        .I3(cnt_1ms_reg[1]),
        .I4(cnt_1ms_reg[3]),
        .I5(cnt_1ms_reg[4]),
        .O(p_0_in__1[4]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \cnt_1ms[5]_i_1 
       (.I0(cnt_1ms1),
        .I1(\cnt_1ms[5]_i_2_n_0 ),
        .I2(cnt_1ms_reg[5]),
        .O(p_0_in__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \cnt_1ms[5]_i_2 
       (.I0(cnt_1ms_reg[4]),
        .I1(cnt_1ms_reg[2]),
        .I2(cnt_1ms_reg[0]),
        .I3(cnt_1ms_reg[1]),
        .I4(cnt_1ms_reg[3]),
        .O(\cnt_1ms[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \cnt_1ms[6]_i_1 
       (.I0(cnt_1ms1),
        .I1(\cnt_1ms[9]_i_5_n_0 ),
        .I2(cnt_1ms_reg[6]),
        .O(p_0_in__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0708)) 
    \cnt_1ms[7]_i_1 
       (.I0(cnt_1ms_reg[6]),
        .I1(\cnt_1ms[9]_i_5_n_0 ),
        .I2(cnt_1ms1),
        .I3(cnt_1ms_reg[7]),
        .O(p_0_in__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h007F0080)) 
    \cnt_1ms[8]_i_1 
       (.I0(cnt_1ms_reg[7]),
        .I1(\cnt_1ms[9]_i_5_n_0 ),
        .I2(cnt_1ms_reg[6]),
        .I3(cnt_1ms1),
        .I4(cnt_1ms_reg[8]),
        .O(p_0_in__1[8]));
  LUT2 #(
    .INIT(4'hE)) 
    \cnt_1ms[9]_i_1 
       (.I0(cnt_1ms1),
        .I1(p_1_in),
        .O(\cnt_1ms[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt_1ms[9]_i_10 
       (.I0(cnt_1us_reg[1]),
        .I1(cnt_1us_reg[0]),
        .I2(cnt_1us_reg[3]),
        .I3(cnt_1us_reg[2]),
        .O(\cnt_1ms[9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00007FFF00008000)) 
    \cnt_1ms[9]_i_2 
       (.I0(cnt_1ms_reg[8]),
        .I1(cnt_1ms_reg[6]),
        .I2(\cnt_1ms[9]_i_5_n_0 ),
        .I3(cnt_1ms_reg[7]),
        .I4(cnt_1ms1),
        .I5(cnt_1ms_reg[9]),
        .O(p_0_in__1[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_1ms[9]_i_3 
       (.I0(\cnt_1ms[9]_i_6_n_0 ),
        .I1(\cnt_1ms[9]_i_7_n_0 ),
        .I2(\cnt_1us[9]_i_3_n_0 ),
        .I3(\cnt_1ms[9]_i_8_n_0 ),
        .I4(\cnt_1ms[9]_i_9_n_0 ),
        .I5(\cnt_1ms[9]_i_10_n_0 ),
        .O(cnt_1ms1));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \cnt_1ms[9]_i_4 
       (.I0(\cnt_1ms[9]_i_10_n_0 ),
        .I1(\cnt_1ms[9]_i_9_n_0 ),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[0]),
        .I5(\cnt_1us[9]_i_3_n_0 ),
        .O(p_1_in));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_1ms[9]_i_5 
       (.I0(cnt_1ms_reg[5]),
        .I1(cnt_1ms_reg[3]),
        .I2(cnt_1ms_reg[1]),
        .I3(cnt_1ms_reg[0]),
        .I4(cnt_1ms_reg[2]),
        .I5(cnt_1ms_reg[4]),
        .O(\cnt_1ms[9]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \cnt_1ms[9]_i_6 
       (.I0(cnt_1ms_reg[1]),
        .I1(cnt_1ms_reg[0]),
        .I2(cnt_1ms_reg[3]),
        .I3(cnt_1ms_reg[2]),
        .O(\cnt_1ms[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \cnt_1ms[9]_i_7 
       (.I0(cnt_1ms_reg[5]),
        .I1(cnt_1ms_reg[4]),
        .I2(cnt_1ms_reg[6]),
        .I3(cnt_1ms_reg[7]),
        .I4(cnt_1ms_reg[9]),
        .I5(cnt_1ms_reg[8]),
        .O(\cnt_1ms[9]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \cnt_1ms[9]_i_8 
       (.I0(cnt_reg[2]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .O(\cnt_1ms[9]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \cnt_1ms[9]_i_9 
       (.I0(cnt_1us_reg[4]),
        .I1(cnt_1us_reg[5]),
        .I2(cnt_1us_reg[6]),
        .I3(cnt_1us_reg[7]),
        .I4(cnt_1us_reg[9]),
        .I5(cnt_1us_reg[8]),
        .O(\cnt_1ms[9]_i_9_n_0 ));
  FDCE \cnt_1ms_reg[0] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[0]),
        .Q(cnt_1ms_reg[0]));
  FDCE \cnt_1ms_reg[1] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[1]),
        .Q(cnt_1ms_reg[1]));
  FDCE \cnt_1ms_reg[2] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[2]),
        .Q(cnt_1ms_reg[2]));
  FDCE \cnt_1ms_reg[3] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[3]),
        .Q(cnt_1ms_reg[3]));
  FDCE \cnt_1ms_reg[4] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[4]),
        .Q(cnt_1ms_reg[4]));
  FDCE \cnt_1ms_reg[5] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[5]),
        .Q(cnt_1ms_reg[5]));
  FDCE \cnt_1ms_reg[6] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[6]),
        .Q(cnt_1ms_reg[6]));
  FDCE \cnt_1ms_reg[7] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[7]),
        .Q(cnt_1ms_reg[7]));
  FDCE \cnt_1ms_reg[8] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[8]),
        .Q(cnt_1ms_reg[8]));
  FDCE \cnt_1ms_reg[9] 
       (.C(s_clk),
        .CE(\cnt_1ms[9]_i_1_n_0 ),
        .CLR(led_i_2_n_0),
        .D(p_0_in__1[9]),
        .Q(cnt_1ms_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \cnt_1us[0]_i_1 
       (.I0(cnt_1us1__9),
        .I1(cnt_1us_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \cnt_1us[1]_i_1 
       (.I0(cnt_1us1__9),
        .I1(cnt_1us_reg[0]),
        .I2(cnt_1us_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \cnt_1us[2]_i_1 
       (.I0(cnt_1us1__9),
        .I1(cnt_1us_reg[0]),
        .I2(cnt_1us_reg[1]),
        .I3(cnt_1us_reg[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \cnt_1us[3]_i_1 
       (.I0(cnt_1us1__9),
        .I1(cnt_1us_reg[1]),
        .I2(cnt_1us_reg[0]),
        .I3(cnt_1us_reg[2]),
        .I4(cnt_1us_reg[3]),
        .O(p_0_in__0[3]));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \cnt_1us[4]_i_1 
       (.I0(cnt_1us1__9),
        .I1(cnt_1us_reg[2]),
        .I2(cnt_1us_reg[0]),
        .I3(cnt_1us_reg[1]),
        .I4(cnt_1us_reg[3]),
        .I5(cnt_1us_reg[4]),
        .O(p_0_in__0[4]));
  LUT3 #(
    .INIT(8'h14)) 
    \cnt_1us[5]_i_1 
       (.I0(cnt_1us1__9),
        .I1(\cnt_1us[5]_i_2_n_0 ),
        .I2(cnt_1us_reg[5]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \cnt_1us[5]_i_2 
       (.I0(cnt_1us_reg[4]),
        .I1(cnt_1us_reg[2]),
        .I2(cnt_1us_reg[0]),
        .I3(cnt_1us_reg[1]),
        .I4(cnt_1us_reg[3]),
        .O(\cnt_1us[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \cnt_1us[6]_i_1 
       (.I0(cnt_1us1__9),
        .I1(\cnt_1us[9]_i_5_n_0 ),
        .I2(cnt_1us_reg[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0708)) 
    \cnt_1us[7]_i_1 
       (.I0(cnt_1us_reg[6]),
        .I1(\cnt_1us[9]_i_5_n_0 ),
        .I2(cnt_1us1__9),
        .I3(cnt_1us_reg[7]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h007F0080)) 
    \cnt_1us[8]_i_1 
       (.I0(cnt_1us_reg[7]),
        .I1(\cnt_1us[9]_i_5_n_0 ),
        .I2(cnt_1us_reg[6]),
        .I3(cnt_1us1__9),
        .I4(cnt_1us_reg[8]),
        .O(p_0_in__0[8]));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    \cnt_1us[9]_i_1 
       (.I0(\cnt_1us[9]_i_3_n_0 ),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(cnt_1us1__9),
        .O(cnt_1us0));
  LUT6 #(
    .INIT(64'h00007FFF00008000)) 
    \cnt_1us[9]_i_2 
       (.I0(cnt_1us_reg[8]),
        .I1(cnt_1us_reg[6]),
        .I2(\cnt_1us[9]_i_5_n_0 ),
        .I3(cnt_1us_reg[7]),
        .I4(cnt_1us1__9),
        .I5(cnt_1us_reg[9]),
        .O(p_0_in__0[9]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt_1us[9]_i_3 
       (.I0(cnt_reg[6]),
        .I1(cnt_reg[5]),
        .I2(cnt_reg[4]),
        .I3(cnt_reg[3]),
        .O(\cnt_1us[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \cnt_1us[9]_i_4 
       (.I0(\cnt_1us[9]_i_6_n_0 ),
        .I1(\cnt_1us[9]_i_7_n_0 ),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[0]),
        .I5(\cnt_1us[9]_i_3_n_0 ),
        .O(cnt_1us1__9));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_1us[9]_i_5 
       (.I0(cnt_1us_reg[5]),
        .I1(cnt_1us_reg[3]),
        .I2(cnt_1us_reg[1]),
        .I3(cnt_1us_reg[0]),
        .I4(cnt_1us_reg[2]),
        .I5(cnt_1us_reg[4]),
        .O(\cnt_1us[9]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \cnt_1us[9]_i_6 
       (.I0(cnt_1us_reg[1]),
        .I1(cnt_1us_reg[0]),
        .I2(cnt_1us_reg[3]),
        .I3(cnt_1us_reg[2]),
        .O(\cnt_1us[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \cnt_1us[9]_i_7 
       (.I0(cnt_1us_reg[5]),
        .I1(cnt_1us_reg[4]),
        .I2(cnt_1us_reg[6]),
        .I3(cnt_1us_reg[7]),
        .I4(cnt_1us_reg[9]),
        .I5(cnt_1us_reg[8]),
        .O(\cnt_1us[9]_i_7_n_0 ));
  FDCE \cnt_1us_reg[0] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[0]),
        .Q(cnt_1us_reg[0]));
  FDCE \cnt_1us_reg[1] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[1]),
        .Q(cnt_1us_reg[1]));
  FDCE \cnt_1us_reg[2] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[2]),
        .Q(cnt_1us_reg[2]));
  FDCE \cnt_1us_reg[3] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[3]),
        .Q(cnt_1us_reg[3]));
  FDCE \cnt_1us_reg[4] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[4]),
        .Q(cnt_1us_reg[4]));
  FDCE \cnt_1us_reg[5] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[5]),
        .Q(cnt_1us_reg[5]));
  FDCE \cnt_1us_reg[6] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[6]),
        .Q(cnt_1us_reg[6]));
  FDCE \cnt_1us_reg[7] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[7]),
        .Q(cnt_1us_reg[7]));
  FDCE \cnt_1us_reg[8] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[8]),
        .Q(cnt_1us_reg[8]));
  FDCE \cnt_1us_reg[9] 
       (.C(s_clk),
        .CE(cnt_1us0),
        .CLR(led_i_2_n_0),
        .D(p_0_in__0[9]),
        .Q(cnt_1us_reg[9]));
  FDCE \cnt_reg[0] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[0]),
        .Q(cnt_reg[0]));
  FDCE \cnt_reg[1] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[1]),
        .Q(cnt_reg[1]));
  FDCE \cnt_reg[2] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[2]),
        .Q(cnt_reg[2]));
  FDCE \cnt_reg[3] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[3]),
        .Q(cnt_reg[3]));
  FDCE \cnt_reg[4] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[4]),
        .Q(cnt_reg[4]));
  FDCE \cnt_reg[5] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[5]),
        .Q(cnt_reg[5]));
  FDCE \cnt_reg[6] 
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(p_0_in[6]),
        .Q(cnt_reg[6]));
  LUT2 #(
    .INIT(4'h6)) 
    flag_i_1
       (.I0(cnt_1ms1),
        .I1(flag),
        .O(flag_i_1_n_0));
  FDCE flag_reg
       (.C(s_clk),
        .CE(1'b1),
        .CLR(led_i_2_n_0),
        .D(flag_i_1_n_0),
        .Q(flag));
  CARRY4 led1_carry
       (.CI(1'b0),
        .CO({led1_carry_n_0,led1_carry_n_1,led1_carry_n_2,led1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({led1_carry_i_1_n_0,led1_carry_i_2_n_0,led1_carry_i_3_n_0,led1_carry_i_4_n_0}),
        .O(NLW_led1_carry_O_UNCONNECTED[3:0]),
        .S({led1_carry_i_5_n_0,led1_carry_i_6_n_0,led1_carry_i_7_n_0,led1_carry_i_8_n_0}));
  CARRY4 led1_carry__0
       (.CI(led1_carry_n_0),
        .CO({NLW_led1_carry__0_CO_UNCONNECTED[3:1],led1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,led1_carry_i_1__0_n_0}),
        .O(NLW_led1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,led1_carry_i_2__0_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    led1_carry_i_1
       (.I0(cnt_1ms_reg[6]),
        .I1(cnt_1us_reg[6]),
        .I2(cnt_1us_reg[7]),
        .I3(cnt_1ms_reg[7]),
        .O(led1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    led1_carry_i_1__0
       (.I0(cnt_1ms_reg[8]),
        .I1(cnt_1us_reg[8]),
        .I2(cnt_1us_reg[9]),
        .I3(cnt_1ms_reg[9]),
        .O(led1_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    led1_carry_i_2
       (.I0(cnt_1ms_reg[4]),
        .I1(cnt_1us_reg[4]),
        .I2(cnt_1us_reg[5]),
        .I3(cnt_1ms_reg[5]),
        .O(led1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led1_carry_i_2__0
       (.I0(cnt_1us_reg[9]),
        .I1(cnt_1ms_reg[9]),
        .I2(cnt_1ms_reg[8]),
        .I3(cnt_1us_reg[8]),
        .O(led1_carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    led1_carry_i_3
       (.I0(cnt_1ms_reg[2]),
        .I1(cnt_1us_reg[2]),
        .I2(cnt_1us_reg[3]),
        .I3(cnt_1ms_reg[3]),
        .O(led1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    led1_carry_i_4
       (.I0(cnt_1ms_reg[0]),
        .I1(cnt_1us_reg[0]),
        .I2(cnt_1us_reg[1]),
        .I3(cnt_1ms_reg[1]),
        .O(led1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led1_carry_i_5
       (.I0(cnt_1us_reg[7]),
        .I1(cnt_1ms_reg[7]),
        .I2(cnt_1ms_reg[6]),
        .I3(cnt_1us_reg[6]),
        .O(led1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led1_carry_i_6
       (.I0(cnt_1us_reg[5]),
        .I1(cnt_1ms_reg[5]),
        .I2(cnt_1ms_reg[4]),
        .I3(cnt_1us_reg[4]),
        .O(led1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led1_carry_i_7
       (.I0(cnt_1us_reg[3]),
        .I1(cnt_1ms_reg[3]),
        .I2(cnt_1ms_reg[2]),
        .I3(cnt_1us_reg[2]),
        .O(led1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led1_carry_i_8
       (.I0(cnt_1us_reg[1]),
        .I1(cnt_1ms_reg[1]),
        .I2(cnt_1ms_reg[0]),
        .I3(cnt_1us_reg[0]),
        .O(led1_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    led_i_1
       (.I0(led1_carry__0_n_3),
        .I1(flag),
        .O(led_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    led_i_2
       (.I0(s_rst),
        .O(led_i_2_n_0));
  FDPE led_reg
       (.C(s_clk),
        .CE(1'b1),
        .D(led_i_1_n_0),
        .PRE(led_i_2_n_0),
        .Q(led));
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
