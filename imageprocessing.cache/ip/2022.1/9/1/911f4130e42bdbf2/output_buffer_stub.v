// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Mon Oct 16 00:20:47 2023
// Host        : DESKTOP-9IG5KHP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ output_buffer_stub.v
// Design      : output_buffer
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(wr_rst_busy, rd_rst_busy, s_aclk, s_aresetn, 
  s_axis_tvalid, s_axis_tready, s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tdata, 
  axis_prog_full)
/* synthesis syn_black_box black_box_pad_pin="wr_rst_busy,rd_rst_busy,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[7:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[7:0],axis_prog_full" */;
  output wr_rst_busy;
  output rd_rst_busy;
  input s_aclk;
  input s_aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output axis_prog_full;
endmodule
