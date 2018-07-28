`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:36 01/02/2014 
// Design Name: 
// Module Name:    qmults 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module qmults 
    #(
	//Parameterized values
	parameter N = 24,
	parameter Q = 15
	)
	(
	input wire clk,
	input wire [7:0] a,
	input wire [N-1:0] b,
	output wire [N-1:0] y
	);
    
    reg [7:0] a_pipeline [0:6];
    reg [2*N-2:0] b_pipeline [0:6];
    reg [2*N-2:0] partials [0:7];
    reg [0:7] signs;
    integer i;
    
	always @( posedge clk )
	begin
	    a_pipeline[0] <= a;
        b_pipeline[0] <= b;
        signs[0] <= b[N-1];
        for (i = 1; i < 7; i = i+1) begin
            a_pipeline[i] <= a_pipeline[i-1];
            b_pipeline[i] <= b_pipeline[i-1];
        end
        partials[0] <= a[0] ? b : 0;
        for (i = 1; i < 8; i = i+1) begin
            partials[i] <= (a_pipeline[i-1][i] ? b_pipeline[i-1] << i : 0) +
                    partials[i-1];
            signs[i] <= signs[i-1];
        end
	end
	assign y[N-1] = signs[7];
	assign y[N-2:0] = partials[7][N-17+Q:Q-15];
endmodule
