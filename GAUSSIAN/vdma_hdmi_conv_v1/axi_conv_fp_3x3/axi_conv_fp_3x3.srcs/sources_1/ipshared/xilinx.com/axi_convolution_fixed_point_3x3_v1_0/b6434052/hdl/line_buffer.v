`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2018 09:26:09 PM
// Design Name: 
// Module Name: line_buffer
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


module line_buffer
#(
    parameter IMAGE_WIDTH = 640,
    parameter KERNEL_SIZE = 3
)
(
    input wire clk,
    input wire reset_n,
    
    input wire [23:0] pxl_in,
			
	output wire [23:0] reg_00, 
	output wire [23:0] reg_01, 
	output wire [23:0] reg_02,
	 	 	
	output wire [23:0] reg_10, 
	output wire [23:0] reg_11, 
	output wire [23:0] reg_12, 
		
	output wire [23:0] reg_20, 
	output wire [23:0] reg_21, 
	output wire [23:0] reg_22
);    
    wire [23:0] sr_0;
    wire [23:0] sr_1;
    
    register r_00(clk, reset_n, pxl_in, reg_00); 
    register r_01(clk, reset_n, reg_00, reg_01); 
    register r_02(clk, reset_n, reg_01, reg_02); 
    
    shift #(.IMAGE_WIDTH(IMAGE_WIDTH), .KERNEL_SIZE(KERNEL_SIZE)) row_1(clk, reg_02, sr_0);
    
    register r_10(clk, reset_n, sr_0, reg_10); 
    register r_11(clk, reset_n, reg_10, reg_11); 
    register r_12(clk, reset_n, reg_11, reg_12); 
    
    shift #(.IMAGE_WIDTH(IMAGE_WIDTH), .KERNEL_SIZE(KERNEL_SIZE)) row_2(clk, reg_12, sr_1);
    
    register r_20(clk, reset_n, sr_1, reg_20); 
    register r_21(clk, reset_n, reg_20, reg_21); 
    register r_22(clk, reset_n, reg_21, reg_22); 
    
endmodule
