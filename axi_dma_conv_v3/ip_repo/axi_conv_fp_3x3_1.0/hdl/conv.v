`timescale 1ns / 1ps

module conv
#(
    parameter L = 24,
    parameter M = 480,
    parameter N = 640,
    parameter K = 3
)
(
	input Start,
	
    input clk,
    input reset_n,
    input [31:0] pxl_in,
    output [31:0] pxl_out,
	
	output valid,
	output last
    );
    
	// Intermediate wires
	wire [L-1:0] wire_00r; wire [L-1:0] wire_01r; wire [L-1:0] wire_02r;
    wire [L-1:0] wire_10r; wire [L-1:0] wire_11r; wire [L-1:0] wire_12r;
    wire [L-1:0] wire_20r; wire [L-1:0] wire_21r; wire [L-1:0] wire_22r;
        
    wire [L-1:0] wire_00g; wire [L-1:0] wire_01g; wire [L-1:0] wire_02g;
    wire [L-1:0] wire_10g; wire [L-1:0] wire_11g; wire [L-1:0] wire_12g;
    wire [L-1:0] wire_20g; wire [L-1:0] wire_21g; wire [L-1:0] wire_22g;
            
	wire [L-1:0] wire_00b; wire [L-1:0] wire_01b; wire [L-1:0] wire_02b;
	wire [L-1:0] wire_10b; wire [L-1:0] wire_11b; wire [L-1:0] wire_12b;
	wire [L-1:0] wire_20b; wire [L-1:0] wire_21b; wire [L-1:0] wire_22b;
    
    wire [L-1:0] reg_00r; wire [L-1:0] reg_01r; wire [L-1:0] reg_02r; wire[L-1:0] sr_0r; 	
    wire [L-1:0] reg_10r; wire [L-1:0] reg_11r; wire [L-1:0] reg_12r; wire[L-1:0] sr_1r; 
    wire [L-1:0] reg_20r; wire [L-1:0] reg_21r; wire [L-1:0] reg_22r; 
    
    wire [L-1:0] reg_00g; wire [L-1:0] reg_01g; wire [L-1:0] reg_02g; wire[L-1:0] sr_0g; 	
    wire [L-1:0] reg_10g; wire [L-1:0] reg_11g; wire [L-1:0] reg_12g; wire[L-1:0] sr_1g; 
    wire [L-1:0] reg_20g; wire [L-1:0] reg_21g; wire [L-1:0] reg_22g; 
        
    wire [L-1:0] reg_00b; wire [L-1:0] reg_01b; wire [L-1:0] reg_02b; wire[L-1:0] sr_0b; 	
    wire [L-1:0] reg_10b; wire [L-1:0] reg_11b; wire [L-1:0] reg_12b; wire[L-1:0] sr_1b; 
    wire [L-1:0] reg_20b; wire [L-1:0] reg_21b; wire [L-1:0] reg_22b;  
    
	// 3*3 kernel
	wire [L-1:0] kernel_00;
    wire [L-1:0] kernel_01;
    wire [L-1:0] kernel_02;
    wire [L-1:0] kernel_10;
    wire [L-1:0] kernel_11;
    wire [L-1:0] kernel_12;
    wire [L-1:0] kernel_20;
    wire [L-1:0] kernel_21;
    wire [L-1:0] kernel_22;
            
    assign kernel_00 = 24'b000000000000111000111001; 
    assign kernel_01 = 24'b000000000000111000111001; 
    assign kernel_02 = 24'b000000000000111000111001;
    assign kernel_10 = 24'b000000000000111000111001; 
    assign kernel_11 = 24'b000000000000111000111001; 
    assign kernel_12 = 24'b000000000000111000111001;
    assign kernel_20 = 24'b000000000000111000111001; 
    assign kernel_21 = 24'b000000000000111000111001; 
    assign kernel_22 = 24'b000000000000111000111001; 

	// Row : 1
	mac mac_00r(clk, pxl_in[23:16], kernel_00, 0, wire_00r);
	mac mac_00g(clk, pxl_in[15:8], kernel_00, 0, wire_00g);
	mac mac_00b(clk, pxl_in[7:0], kernel_00, 0, wire_00b);
	register r_00r(clk, reset_n, wire_00r, reg_00r); 
	register r_00g(clk, reset_n, wire_00g, reg_00g); 
	register r_00b(clk, reset_n, wire_00b, reg_00b); 
	
	mac mac_01r(clk, pxl_in[23:16], kernel_01, reg_00r, wire_01r);
    mac mac_01g(clk, pxl_in[15:8], kernel_01, reg_00g, wire_01g);
	mac mac_01b(clk, pxl_in[7:0], kernel_01, reg_00b, wire_01b); 
	register r_01r(clk, reset_n, wire_01r, reg_01r); 
    register r_01g(clk, reset_n, wire_01g, reg_01g); 
    register r_01b(clk, reset_n, wire_01b, reg_01b); 
    
	mac mac_02r(clk, pxl_in[23:16], kernel_02, reg_01r, wire_02r);
	mac mac_02g(clk, pxl_in[15:8], kernel_02, reg_01g, wire_02g); 
	mac mac_02b(clk, pxl_in[7:0], kernel_02, reg_01b, wire_02b);  
	register r_02r(clk, reset_n, wire_02r, reg_02r); 
    register r_02g(clk, reset_n, wire_02g, reg_02g); 
    register r_02b(clk, reset_n, wire_02b, reg_02b); 
    
    shift row_1r(clk, reg_02r, sr_0r);
    shift row_1g(clk, reg_02g, sr_0g);
	shift row_1b(clk, reg_02b, sr_0b);

	// Row : 2
	mac mac_10r(clk, pxl_in[23:16], kernel_10, sr_0r, wire_10r); 
	mac mac_10g(clk, pxl_in[15:8], kernel_10, sr_0g, wire_10g); 
	mac mac_10b(clk, pxl_in[7:0], kernel_10, sr_0b, wire_10b); 
	register r_10r(clk, reset_n, wire_10r, reg_10r); 
	register r_10g(clk, reset_n, wire_10g, reg_10g); 
    register r_10b(clk, reset_n, wire_10b, reg_10b); 
    
	mac mac_11r(clk, pxl_in[23:16], kernel_11, reg_10r, wire_11r);
	mac mac_11g(clk, pxl_in[15:8], kernel_11, reg_10g, wire_11g); 
	mac mac_11b(clk, pxl_in[7:0], kernel_11, reg_10b, wire_11b);  
	register r_11r(clk, reset_n, wire_11r, reg_11r);
	register r_11g(clk, reset_n, wire_11g, reg_11g); 
	register r_11b(clk, reset_n, wire_11b, reg_11b);  
    
    mac mac_12r(clk, pxl_in[23:16], kernel_12, reg_11r, wire_12r); 
    mac mac_12g(clk, pxl_in[15:8], kernel_12, reg_11g, wire_12g); 
	mac mac_12b(clk, pxl_in[7:0], kernel_12, reg_11b, wire_12b); 
	register r_12r(clk, reset_n, wire_12r, reg_12r); 
    register r_12g(clk, reset_n, wire_12g, reg_12g);
    register r_12b(clk, reset_n, wire_12b, reg_12b);
    
	shift row_2r(clk, reg_12r, sr_1r);
    shift row_2g(clk, reg_12g, sr_1g);
    shift row_2b(clk, reg_12b, sr_1b);
    
	// Row : 3
	mac mac_20r(clk, pxl_in[23:16], kernel_20, sr_1r, wire_20r);
	mac mac_20g(clk, pxl_in[15:8], kernel_20, sr_1g, wire_20g);
	mac mac_20b(clk, pxl_in[7:0], kernel_20, sr_1b, wire_20b); 
	register r_20r(clk, reset_n, wire_20r, reg_20r); 
	register r_20g(clk, reset_n, wire_20g, reg_20g); 
    register r_20b(clk, reset_n, wire_20b, reg_20b); 
    
	mac mac_21r(clk, pxl_in[23:16], kernel_21, reg_20r, wire_21r); 
	mac mac_21g(clk, pxl_in[15:8], kernel_21, reg_20g, wire_21g);
	mac mac_21b(clk, pxl_in[7:0], kernel_21, reg_20b, wire_21b);
	register r_21r(clk, reset_n, wire_21r, reg_21r); 
	register r_21g(clk, reset_n, wire_21g, reg_21g); 
	register r_21b(clk, reset_n, wire_21b, reg_21b); 

	mac mac_22r(clk, pxl_in[23:16], kernel_22, reg_21r, wire_22r); 
	mac mac_22g(clk, pxl_in[15:8], kernel_22, reg_21g, wire_22g);
	mac mac_22b(clk, pxl_in[7:0], kernel_22, reg_21b, wire_22b);
	register r_22r(clk, reset_n, wire_22r, reg_22r); 
	register r_22g(clk, reset_n, wire_22g, reg_22g);
	register r_22b(clk, reset_n, wire_22b, reg_22b);
	
	assign pxl_out = {pxl_in[31:24],reg_22r[22:15],reg_22g[22:15],reg_22b[22:15]};	
	
	reg [9:0] irow;
    reg [9:0] icol;
        
    always @( posedge clk )
    begin
        if( Start == 1'b0 ) begin
            irow <= 10'd0;
            icol <= 10'd1;
        end
        else begin 
            icol <= icol + 1;
            if ( icol == N-1 ) begin
                icol <= 0;
                irow <= irow + 1;
            end
        end
    end
        
    reg valid_reg;
    always @( posedge clk )
    begin
        if( irow > 1 && irow < M ) begin
            if ( icol > K+7 )
                valid_reg <= 1'b1;
            else if ( irow > 2 && icol < K-1+7 )
                valid_reg <= 1'b1;
            else
                valid_reg <= 1'b0;
        end
        else if( irow == M ) begin
            if ( icol < K-1+7 )
                valid_reg <= 1'b1;
            else
                valid_reg <= 1'b0; 
        end
        else 
            valid_reg <= 1'b0; 
    end
    assign valid = valid_reg;
   
endmodule