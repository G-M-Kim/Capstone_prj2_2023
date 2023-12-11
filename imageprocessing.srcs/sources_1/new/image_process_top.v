`timescale 1ns / 1ps

module image_processing_top(
  input           axi_clk     ,
  input           axi_reset_n ,
  input           i_data_valid,
  input   [7:0]   i_data      ,
  input   [7:0]   i_color     ,
  input           i_data_ready,
  output          o_data_ready,
  output          o_data_valid,
  output  [7:0]   o_data      ,
  output          o_intr
);

wire    [71:0]  pixel_data;
wire    [71:0]  color_data;
wire            pixel_data_valid;
wire            axis_prog_full;
wire    [7:0]   convolved_data;
wire            convolved_data_valid;

assign o_data_ready = !axis_prog_full;
    
image_control image_control_1(
  .i_clk(axi_clk)                         ,
  .i_rst(!axi_reset_n)                    ,
  .i_pixel_data(i_data)                   ,
  .i_color_data(i_color)                  ,
  .i_pixel_data_valid(i_data_valid)       ,
  .o_pixel_data(pixel_data)               ,
  .o_color_data(color_data)               ,
  .o_pixel_data_valid(pixel_data_valid)   ,
  .o_intr(o_intr)
);    
  
conv conv_1(
  .i_clk(axi_clk)                                ,
  .i_pixel_data(pixel_data)                      ,
  .i_color_data(color_data)                      ,
  .i_pixel_data_valid(pixel_data_valid)          ,
  .o_convolved_data(convolved_data)              ,
  .o_convolved_data_valid(convolved_data_valid)
); 
 
output_buffer output_buffer_1 (
  .wr_rst_busy()                       ,   // output wire wr_rst_busy
  .rd_rst_busy()                       ,   // output wire rd_rst_busy
  .s_aclk(axi_clk)                     ,   // input wire s_aclk
  .s_aresetn(axi_reset_n)              ,   // input wire s_aresetn
  .s_axis_tvalid(convolved_data_valid) ,   // input wire s_axis_tvalid
  .s_axis_tready()                     ,   // output wire s_axis_tready
  .s_axis_tdata(convolved_data)        ,   // input wire [7 : 0] s_axis_tdata
  .m_axis_tvalid(o_data_valid)         ,   // output wire m_axis_tvalid
  .m_axis_tready(i_data_ready)         ,   // input wire m_axis_tready
  .m_axis_tdata(o_data)                ,   // output wire [7 : 0] m_axis_tdata
  .axis_prog_full(axis_prog_full)          // output wire axis_prog_full
);

endmodule