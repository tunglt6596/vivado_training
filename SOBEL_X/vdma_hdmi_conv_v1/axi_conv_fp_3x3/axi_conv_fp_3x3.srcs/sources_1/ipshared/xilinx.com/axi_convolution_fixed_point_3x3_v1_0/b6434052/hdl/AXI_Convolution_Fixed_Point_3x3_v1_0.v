
`timescale 1 ns / 1 ps

	module AXI_Convolution_Fixed_Point_3x3_v1_0 #
	(
		// Users to add parameters here
        parameter integer IMAGE_HEIGHT = 480,
        parameter integer IMAGE_WIDTH  = 640,
        
        parameter integer KERNEL_SIZE  = 3,
        
        parameter integer FP_WORD_LENGTH = 11,
        parameter integer FP_FRAC_LENGTH = 0,
        
        parameter integer KERNEL_00 = 1,
        parameter integer KERNEL_01 = 2,
        parameter integer KERNEL_02 = 1,
        
        parameter integer KERNEL_10 = 0,
        parameter integer KERNEL_11 = 0,
        parameter integer KERNEL_12 = 0,
        
        parameter integer KERNEL_20 = 1025,
        parameter integer KERNEL_21 = 1026,
        parameter integer KERNEL_22 = 1025,
            
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXIS
		parameter integer C_S_AXIS_TDATA_WIDTH	= 24,

		// Parameters of Axi Master Bus Interface M_AXIS
		parameter integer C_M_AXIS_TDATA_WIDTH	= 24,
		parameter integer C_M_AXIS_START_COUNT	= 24,

		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 6
	)
	(
		// Users to add ports here
        input wire Start,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXIS
		input wire  s_axis_aclk,
		input wire  s_axis_aresetn,
		output wire  s_axis_tready,
		input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] s_axis_tdata,
		input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] s_axis_tstrb,
		input wire  s_axis_tlast,
		input wire  s_axis_tvalid,

		// Ports of Axi Master Bus Interface M_AXIS
		input wire  m_axis_aclk,
		input wire  m_axis_aresetn,
		output wire  m_axis_tvalid,
		output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] m_axis_tdata,
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tstrb,
		output wire  m_axis_tuser,
		output wire  m_axis_tlast,
		input wire  m_axis_tready

	);
    
	// Add user logic here
    conv #(
        // Image parameters
        .IMAGE_HEIGHT(IMAGE_HEIGHT),
        .IMAGE_WIDTH(IMAGE_WIDTH),
        // Kernel size
        .KERNEL_SIZE(KERNEL_SIZE),
        // Fixed point number
        .FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH),
        // Kernel parameters
        .KERNEL_00(KERNEL_00),
        .KERNEL_01(KERNEL_01),
        .KERNEL_02(KERNEL_02),
        .KERNEL_10(KERNEL_10),
        .KERNEL_11(KERNEL_11),
        .KERNEL_12(KERNEL_12),
        .KERNEL_20(KERNEL_20),
        .KERNEL_21(KERNEL_21),
        .KERNEL_22(KERNEL_22)
    )conv_unit(
        .start(Start),
        .clk(s_axis_aclk),
        .reset_n(s_axis_aresetn),
        .pxl_in(s_axis_tdata),
        .pxl_out(m_axis_tdata),
        .start_of_frame(m_axis_tuser),
        .ready(s_axis_tready),
        .valid(m_axis_tvalid),
        .last(m_axis_tlast)
    );    
    
	// User logic ends

	endmodule
