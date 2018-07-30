`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2018 09:03:55 PM
// Design Name: 
// Module Name: axi_conv_fp_3x3_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_conv_fp_3x3_tb();

    localparam T = 20;
    
    localparam L = 24;
    localparam M = 480;
    localparam N = 640;
    localparam K = 3;
        
    localparam NUM_PIXEL_IN = M*N;
    localparam NUM_PIXEL_OUT = (M-2)*(N-2);
	
	reg clk;
	reg reset_n;
	
	reg Start;
    // Ports of Axi Slave Bus Interface S_AXIS
    wire  s_axis_tready;
    reg [31 : 0] s_axis_tdata;
    reg s_axis_tvalid;
    
    // Ports of Axi Master Bus Interface M_AXIS
    wire  m_axis_tvalid;
    wire [31 : 0] m_axis_tdata;
    wire  m_axis_tlast;
    reg  m_axis_tready;
    
	// Instantiate the Unit Under Test (UUT)
	axi_conv_fp_3x3_v1_0 uut (
	    .Start(Start),
	    
		.s_axis_aclk(clk), 
		.s_axis_aresetn(reset_n),
		.s_axis_tready(s_axis_tready), 
		.s_axis_tdata(s_axis_tdata),
		.s_axis_tvalid(s_axis_tvalid),
		
		.m_axis_aclk(clk),
		.m_axis_aresetn(reset_n),
		.m_axis_tready(m_axis_tready),
		.m_axis_tdata(m_axis_tdata),
		.m_axis_tvalid(m_axis_tvalid),
		.m_axis_tlast(m_axis_tlast)
	);

    always 
    begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end

    integer file_out;
    integer i=0;
    reg [31:0] data_reg[NUM_PIXEL_IN-1:0];
    
    initial begin
        //Read all data
        $readmemb("D:\\test2\\image_in.txt", data_reg);
        #10;
        //Open file to write
        file_out = $fopen("D:\\test2\\image_out.txt", "w");
        #10; 
        
        // Reset system
        @(posedge clk);
        reset_n = 0;
        @(posedge clk);
        reset_n = 1;
        
        // Start convolution unit
        @(posedge clk);
        Start = 1'b0;
        @(posedge clk);
        Start = 1'b1;
        
        m_axis_tready = 1'b1;
        
        // 5*5 image
        while(i < NUM_PIXEL_IN) begin
            @(posedge clk);
            s_axis_tdata = data_reg[i];
            s_axis_tvalid = 1;
            if( s_axis_tready )
                i = i + 1;
        end
        s_axis_tvalid = 0;
    end 
    
    //Write data when valid signal of the axi output is set
    integer count = 0;
    initial 
    begin
        while( count < NUM_PIXEL_OUT ) 
        begin
            @(posedge clk);
            if( m_axis_tvalid ) begin
                $fdisplay(file_out, "%b", m_axis_tdata); 
                count = count + 1;
            end
        end
        $fclose(file_out);
        #100;
        $stop;            
    end

endmodule
