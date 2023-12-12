//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Tue Dec 12 09:22:24 2023
//Host        : DESKTOP-4U8Q409 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (led_0);
  output led_0;

  wire led_breath_0_led;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_RESET0_N;

  assign led_0 = led_breath_0_led;
  design_1_led_breath_0_0 led_breath_0
       (.led(led_breath_0_led),
        .s_clk(processing_system7_0_FCLK_CLK0),
        .s_rst(processing_system7_0_FCLK_RESET0_N));
  design_1_processing_system7_0_0 processing_system7_0
       (.FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N));
endmodule
