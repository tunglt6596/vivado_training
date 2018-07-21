`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2018 09:46:57 AM
// Design Name: 
// Module Name: design_1_wrapper_tb
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


module design_1_wrapper_tb();
    
    localparam T = 20;
    localparam NUM_PIXEL = 640*480;
        
    reg clk;
    reg reset_n;
    
    //For axi-lite
    reg [3:0]s_axi_awaddr;
    reg s_axi_awvalid;
    reg [31:0]s_axi_wdata;
    reg [3:0]s_axi_wstrb;
    reg s_axi_wvalid;
    
    //For axis-slave(input)
    reg [31:0]s_axis_tdata;
    reg s_axis_tvalid;
    wire s_axis_tready;
    
    //For axis-master(output)
    wire [31:0]m_axis_tdata;
    wire m_axis_tvalid;
    reg m_axis_tready;
    
    design_1_wrapper design_1_wrapper_unit(
        .clk(clk),
        .reset_n(reset_n),
        
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
                
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid)
    );

    always 
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
       
    integer file_out;
    reg [31:0] data_reg[NUM_PIXEL-1:0];
        
    initial 
    begin
        //Read all data
        $readmemb("D:\\test\\image_in.txt", data_reg);
        #10;
        //Open file to write
        file_out = $fopen("D:\\test\\image_out.txt", "w");
        #10; 
                
        //Reset 
        reset_n = 1'b0;
        @(posedge clk);
        reset_n = 1'b1;
        @(posedge clk);
                 
        //Write 1 value to register 1 of AXI-Lite
        s_axi_awvalid = 1;
        s_axi_wvalid = 1;
        s_axi_awaddr = 2'h1;
        s_axi_wdata = 32'h0001;
        s_axi_wstrb = 4'b1111;
        @(posedge clk);      
               
        //Set ready signal for AXI output
        m_axis_tready = 1'b1;
        @(posedge clk);
            
        //Set valid signal for AXI input
        s_axis_tvalid = 1'b1;
        @(posedge clk);
                    
        repeat(5) @(posedge clk);
        m_axis_tready = 1'b0;
        #200;
            
        m_axis_tready = 1'b1;
        @(posedge clk);
            
        repeat(5) @(posedge clk);
        s_axis_tvalid = 1'b0;
        #200;
            
        s_axis_tvalid = 1'b1;
        @(posedge clk);
    end
        
    //Read data when ready signal of the axi input is set
    integer i;
    assign en_input = s_axis_tready & s_axis_tvalid;
    initial
    begin
        i = 0;
            while(i < NUM_PIXEL) begin
                @(posedge clk);
                if(en_input == 1'b1) begin
                    s_axis_tdata = data_reg[i];  
                    i = i + 1;
                end
            end
        end
        
    //Write data when valid signal of the axi output is set
    integer count = 0;
    initial 
    begin
        while(count < NUM_PIXEL) begin
            @(posedge clk);
            if(m_axis_tvalid) begin
                $fdisplay(file_out, "%b", m_axis_tdata); 
                count = count + 1;
            end
        end
        $fclose(file_out);
        $stop;            
    end    
       
endmodule
