//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sat Jul 21 10:04:55 2018
//Host        : Tung running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk,
    m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    reset_n,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid);
  input clk;
  output [31:0]m_axis_tdata;
  input m_axis_tready;
  output m_axis_tvalid;
  input reset_n;
  input [3:0]s_axi_awaddr;
  input s_axi_awvalid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  input [31:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;

  wire GND_1;
  wire [31:0]bypass_axis_0_m_axis_tdata;
  wire bypass_axis_0_m_axis_tvalid;
  wire bypass_axis_0_s_axis_tready;
  wire clk_1;
  wire m_axis_tready_1;
  wire reset_n_1;
  wire [3:0]s_axi_awaddr_1;
  wire s_axi_awvalid_1;
  wire [31:0]s_axi_wdata_1;
  wire [3:0]s_axi_wstrb_1;
  wire s_axi_wvalid_1;
  wire [31:0]s_axis_tdata_1;
  wire s_axis_tvalid_1;

  assign clk_1 = clk;
  assign m_axis_tdata[31:0] = bypass_axis_0_m_axis_tdata;
  assign m_axis_tready_1 = m_axis_tready;
  assign m_axis_tvalid = bypass_axis_0_m_axis_tvalid;
  assign reset_n_1 = reset_n;
  assign s_axi_awaddr_1 = s_axi_awaddr[3:0];
  assign s_axi_awvalid_1 = s_axi_awvalid;
  assign s_axi_wdata_1 = s_axi_wdata[31:0];
  assign s_axi_wstrb_1 = s_axi_wstrb[3:0];
  assign s_axi_wvalid_1 = s_axi_wvalid;
  assign s_axis_tdata_1 = s_axis_tdata[31:0];
  assign s_axis_tready = bypass_axis_0_s_axis_tready;
  assign s_axis_tvalid_1 = s_axis_tvalid;
  GND GND
       (.G(GND_1));
  design_1_bypass_axis_0_0 bypass_axis_0
       (.m_axis_aclk(clk_1),
        .m_axis_aresetn(reset_n_1),
        .m_axis_tdata(bypass_axis_0_m_axis_tdata),
        .m_axis_tready(m_axis_tready_1),
        .m_axis_tvalid(bypass_axis_0_m_axis_tvalid),
        .s_axi_aclk(clk_1),
        .s_axi_araddr({GND_1,GND_1,GND_1,GND_1}),
        .s_axi_aresetn(reset_n_1),
        .s_axi_arprot({GND_1,GND_1,GND_1}),
        .s_axi_arvalid(GND_1),
        .s_axi_awaddr(s_axi_awaddr_1),
        .s_axi_awprot({GND_1,GND_1,GND_1}),
        .s_axi_awvalid(s_axi_awvalid_1),
        .s_axi_bready(GND_1),
        .s_axi_rready(GND_1),
        .s_axi_wdata(s_axi_wdata_1),
        .s_axi_wstrb(s_axi_wstrb_1),
        .s_axi_wvalid(s_axi_wvalid_1),
        .s_axis_aclk(clk_1),
        .s_axis_aresetn(reset_n_1),
        .s_axis_tdata(s_axis_tdata_1),
        .s_axis_tlast(GND_1),
        .s_axis_tready(bypass_axis_0_s_axis_tready),
        .s_axis_tstrb({GND_1,GND_1,GND_1,GND_1}),
        .s_axis_tvalid(s_axis_tvalid_1));
endmodule
