// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:axi_vdma:6.2
// IP Revision: 4

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
design_1_axi_vdma_0_0 your_instance_name (
  .s_axi_lite_aclk(s_axi_lite_aclk),        // input wire s_axi_lite_aclk
  .m_axi_mm2s_aclk(m_axi_mm2s_aclk),        // input wire m_axi_mm2s_aclk
  .m_axis_mm2s_aclk(m_axis_mm2s_aclk),      // input wire m_axis_mm2s_aclk
  .axi_resetn(axi_resetn),                  // input wire axi_resetn
  .s_axi_lite_awvalid(s_axi_lite_awvalid),  // input wire s_axi_lite_awvalid
  .s_axi_lite_awready(s_axi_lite_awready),  // output wire s_axi_lite_awready
  .s_axi_lite_awaddr(s_axi_lite_awaddr),    // input wire [8 : 0] s_axi_lite_awaddr
  .s_axi_lite_wvalid(s_axi_lite_wvalid),    // input wire s_axi_lite_wvalid
  .s_axi_lite_wready(s_axi_lite_wready),    // output wire s_axi_lite_wready
  .s_axi_lite_wdata(s_axi_lite_wdata),      // input wire [31 : 0] s_axi_lite_wdata
  .s_axi_lite_bresp(s_axi_lite_bresp),      // output wire [1 : 0] s_axi_lite_bresp
  .s_axi_lite_bvalid(s_axi_lite_bvalid),    // output wire s_axi_lite_bvalid
  .s_axi_lite_bready(s_axi_lite_bready),    // input wire s_axi_lite_bready
  .s_axi_lite_arvalid(s_axi_lite_arvalid),  // input wire s_axi_lite_arvalid
  .s_axi_lite_arready(s_axi_lite_arready),  // output wire s_axi_lite_arready
  .s_axi_lite_araddr(s_axi_lite_araddr),    // input wire [8 : 0] s_axi_lite_araddr
  .s_axi_lite_rvalid(s_axi_lite_rvalid),    // output wire s_axi_lite_rvalid
  .s_axi_lite_rready(s_axi_lite_rready),    // input wire s_axi_lite_rready
  .s_axi_lite_rdata(s_axi_lite_rdata),      // output wire [31 : 0] s_axi_lite_rdata
  .s_axi_lite_rresp(s_axi_lite_rresp),      // output wire [1 : 0] s_axi_lite_rresp
  .mm2s_frame_ptr_in(mm2s_frame_ptr_in),    // input wire [5 : 0] mm2s_frame_ptr_in
  .mm2s_frame_ptr_out(mm2s_frame_ptr_out),  // output wire [5 : 0] mm2s_frame_ptr_out
  .m_axi_mm2s_araddr(m_axi_mm2s_araddr),    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(m_axi_mm2s_arlen),      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(m_axi_mm2s_arsize),    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(m_axi_mm2s_arburst),  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(m_axi_mm2s_arprot),    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(m_axi_mm2s_arcache),  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(m_axi_mm2s_arready),  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(m_axi_mm2s_rdata),      // input wire [63 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(m_axi_mm2s_rresp),      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(m_axi_mm2s_rlast),      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(m_axi_mm2s_rready),    // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata(m_axis_mm2s_tdata),    // output wire [23 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),    // output wire [2 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tuser(m_axis_mm2s_tuser),    // output wire [0 : 0] m_axis_mm2s_tuser
  .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(m_axis_mm2s_tready),  // input wire m_axis_mm2s_tready
  .m_axis_mm2s_tlast(m_axis_mm2s_tlast),    // output wire m_axis_mm2s_tlast
  .mm2s_introut(mm2s_introut)              // output wire mm2s_introut
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file design_1_axi_vdma_0_0.v when simulating
// the core, design_1_axi_vdma_0_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

