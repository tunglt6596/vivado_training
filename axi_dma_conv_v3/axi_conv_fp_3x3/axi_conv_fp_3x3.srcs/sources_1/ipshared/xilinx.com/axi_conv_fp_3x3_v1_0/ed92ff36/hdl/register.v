//-----------------------------------------------------------------------------
//
// Title       : register
// Design      : sobel_filter
// Author      : TungLT
// Company     : Hust
//
//-----------------------------------------------------------------------------
//
// File        : d:\my_designs\sobel_filter\sobel_filter\src\register.v
// Generated   : Mon Jun 25 01:31:50 2018
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {register}}
module register
#(
    parameter L = 24
) 
(
	input clk,
	input reset_n, 
	input [L-1:0] w, 
	output reg [L-1:0] r
);

// -- Enter your statements here -- //
always @(posedge clk)
begin
	if(reset_n == 1'b0) 
		r <= {L{1'b0}};
	else 
		r <= w;
end	 

endmodule 
