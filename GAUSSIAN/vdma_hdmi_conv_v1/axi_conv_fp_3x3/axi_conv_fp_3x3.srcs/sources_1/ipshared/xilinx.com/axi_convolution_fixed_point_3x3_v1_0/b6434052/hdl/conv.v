`timescale 1ns / 1ps

module conv
#(
    parameter integer IMAGE_HEIGHT = 480,
    parameter integer IMAGE_WIDTH  = 640,
    
    parameter integer KERNEL_SIZE  = 3,
    
    parameter integer FP_WORD_LENGTH = 24,
    parameter integer FP_FRAC_LENGTH = 15,
    
    parameter integer KERNEL_00 = 1,
    parameter integer KERNEL_01 = 2,
    parameter integer KERNEL_02 = 1,
    
    parameter integer KERNEL_10 = 0,
    parameter integer KERNEL_11 = 0,
    parameter integer KERNEL_12 = 0,
    
    parameter integer KERNEL_20 = 1025,
    parameter integer KERNEL_21 = 1026,
    parameter integer KERNEL_22 = 1025
)
(
	input wire start,
	
    input wire clk,
    input wire reset_n,
    input wire [23:0] pxl_in,
    output wire [23:0] pxl_out,
	
	output wire start_of_frame,
	output wire ready,
	output wire valid,
	output wire last

    );
    
    wire [FP_WORD_LENGTH-1 : 0] kernel_00;
    wire [FP_WORD_LENGTH-1 : 0] kernel_01;
    wire [FP_WORD_LENGTH-1 : 0] kernel_02;
    wire [FP_WORD_LENGTH-1 : 0] kernel_10;
    wire [FP_WORD_LENGTH-1 : 0] kernel_11;
    wire [FP_WORD_LENGTH-1 : 0] kernel_12;
    wire [FP_WORD_LENGTH-1 : 0] kernel_20;
    wire [FP_WORD_LENGTH-1 : 0] kernel_21;
    wire [FP_WORD_LENGTH-1 : 0] kernel_22;
    
    assign kernel_00 = KERNEL_00;
    assign kernel_01 = KERNEL_01;
    assign kernel_02 = KERNEL_02;
    
    assign kernel_10 = KERNEL_10;
    assign kernel_11 = KERNEL_11;
    assign kernel_12 = KERNEL_12;
    
    assign kernel_20 = KERNEL_20;
    assign kernel_21 = KERNEL_21;
    assign kernel_22 = KERNEL_22;
    
	// Intermediate wires
	// Red channel
	wire [FP_WORD_LENGTH-1:0] wire_00r; wire [FP_WORD_LENGTH-1:0] wire_01r; wire [FP_WORD_LENGTH-1:0] wire_02r;
    wire [FP_WORD_LENGTH-1:0] wire_10r; wire [FP_WORD_LENGTH-1:0] wire_11r; wire [FP_WORD_LENGTH-1:0] wire_12r;
    wire [FP_WORD_LENGTH-1:0] wire_20r; wire [FP_WORD_LENGTH-1:0] wire_21r; wire [FP_WORD_LENGTH-1:0] wire_22r;
    //Green channel
    wire [FP_WORD_LENGTH-1:0] wire_00g; wire [FP_WORD_LENGTH-1:0] wire_01g; wire [FP_WORD_LENGTH-1:0] wire_02g;
    wire [FP_WORD_LENGTH-1:0] wire_10g; wire [FP_WORD_LENGTH-1:0] wire_11g; wire [FP_WORD_LENGTH-1:0] wire_12g;
    wire [FP_WORD_LENGTH-1:0] wire_20g; wire [FP_WORD_LENGTH-1:0] wire_21g; wire [FP_WORD_LENGTH-1:0] wire_22g;
    //Blue channel
	wire [FP_WORD_LENGTH-1:0] wire_00b; wire [FP_WORD_LENGTH-1:0] wire_01b; wire [FP_WORD_LENGTH-1:0] wire_02b;
	wire [FP_WORD_LENGTH-1:0] wire_10b; wire [FP_WORD_LENGTH-1:0] wire_11b; wire [FP_WORD_LENGTH-1:0] wire_12b;
	wire [FP_WORD_LENGTH-1:0] wire_20b; wire [FP_WORD_LENGTH-1:0] wire_21b; wire [FP_WORD_LENGTH-1:0] wire_22b;
    
    // For line buffer
    wire [23:0] reg_00; wire [23:0] reg_01; wire [23:0] reg_02; wire[23:0] sr_0; 	
    wire [23:0] reg_10; wire [23:0] reg_11; wire [23:0] reg_12; wire[23:0] sr_1; 
    wire [23:0] reg_20; wire [23:0] reg_21; wire [23:0] reg_22; 
    
	localparam PAD_SIZE = KERNEL_SIZE/2;
	localparam H_PADDED = IMAGE_HEIGHT+KERNEL_SIZE-1;
	localparam W_PADDED = IMAGE_WIDTH+KERNEL_SIZE-1;
	
	reg [10:0] irow;
    reg [10:0] icol;
	
	reg [23:0] pxl_in_reg;
	always @( posedge clk )
	begin
		if( irow>PAD_SIZE-1 && irow<H_PADDED-1 && icol>PAD_SIZE-1 && icol<W_PADDED-1 )
			pxl_in_reg <= pxl_in;
		else 
			pxl_in_reg <= 24'd0;
	end
	
    line_buffer #(
        .IMAGE_WIDTH(IMAGE_WIDTH),
        .KERNEL_SIZE(KERNEL_SIZE)
    ) lb_unit(
        .clk                (clk),
        .reset_n            (reset_n),
        .pxl_in             (pxl_in_reg),
                
        .reg_00             (reg_00), 
        .reg_01             (reg_01), 
        .reg_02             (reg_02),
                          
        .reg_10             (reg_10), 
        .reg_11             (reg_11), 
        .reg_12             (reg_12), 
                    
        .reg_20             (reg_20), 
        .reg_21             (reg_21), 
        .reg_22             (reg_22)
    );
        
	// Row : 1
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_00r(clk, reg_00[23:16], kernel_00, 0, wire_00r);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_00g(clk, reg_00[15:8], kernel_00, 0, wire_00g);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_00b(clk, reg_00[7:0], kernel_00, 0, wire_00b);
	
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_01r(clk, reg_01[23:16], kernel_01, wire_00r, wire_01r);
    mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_01g(clk, reg_01[15:8], kernel_01, wire_00g, wire_01g);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_01b(clk, reg_01[7:0], kernel_01, wire_00b, wire_01b); 
    
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_02r(clk, reg_02[23:16], kernel_02, wire_01r, wire_02r);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_02g(clk, reg_02[15:8], kernel_02, wire_01g, wire_02g); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_02b(clk, reg_02[7:0], kernel_02, wire_01b, wire_02b);  
    
	// Row : 2
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_10r(clk, reg_10[23:16], kernel_10, wire_02r, wire_10r); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_10g(clk, reg_10[15:8], kernel_10, wire_02g, wire_10g); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_10b(clk, reg_10[7:0], kernel_10, wire_02b, wire_10b); 
    
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_11r(clk, reg_11[23:16], kernel_11, wire_10r, wire_11r);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH))mac_11g(clk, reg_11[15:8], kernel_11, wire_10g, wire_11g); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_11b(clk, reg_11[7:0], kernel_11, wire_10b, wire_11b);  
    
    mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_12r(clk, reg_12[23:16], kernel_12, wire_11r, wire_12r); 
    mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_12g(clk, reg_12[15:8], kernel_12, wire_11g, wire_12g); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_12b(clk, reg_12[7:0], kernel_12, wire_11b, wire_12b); 
    
	// Row : 3
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_20r(clk, reg_20[23:16], kernel_20, wire_12r, wire_20r);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_20g(clk, reg_20[15:8], kernel_20, wire_12g, wire_20g);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_20b(clk, reg_20[7:0], kernel_20, wire_12b, wire_20b); 
    
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_21r(clk, reg_21[23:16], kernel_21, wire_20r, wire_21r); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_21g(clk, reg_21[15:8], kernel_21, wire_20g, wire_21g);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_21b(clk, reg_21[7:0], kernel_21, wire_20b, wire_21b);

	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_22r(clk, reg_22[23:16], kernel_22, wire_21r, wire_22r); 
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_22g(clk, reg_22[15:8], kernel_22, wire_21g, wire_22g);
	mac #(.FP_WORD_LENGTH(FP_WORD_LENGTH),
        .FP_FRAC_LENGTH(FP_FRAC_LENGTH)) mac_22b(clk, reg_22[7:0], kernel_22, wire_21b, wire_22b);
    
    wire [7:0] r_val;
    wire [7:0] g_val;
    wire [7:0] b_val;
    
    generate 
        if(FP_WORD_LENGTH-FP_FRAC_LENGTH-1 > 8) begin
            assign r_val = (wire_22r[FP_WORD_LENGTH-1] ? 8'd0 : (wire_22r[FP_WORD_LENGTH-2:FP_FRAC_LENGTH+7+1] ? 8'd255 : wire_22r[FP_FRAC_LENGTH+7:FP_FRAC_LENGTH]));    
            assign g_val = (wire_22g[FP_WORD_LENGTH-1] ? 8'd0 : (wire_22g[FP_WORD_LENGTH-2:FP_FRAC_LENGTH+7+1] ? 8'd255 : wire_22g[FP_FRAC_LENGTH+7:FP_FRAC_LENGTH]));
            assign b_val = (wire_22b[FP_WORD_LENGTH-1] ? 8'd0 : (wire_22b[FP_WORD_LENGTH-2:FP_FRAC_LENGTH+7+1] ? 8'd255 : wire_22b[FP_FRAC_LENGTH+7:FP_FRAC_LENGTH]));         
        end
        else begin
            assign r_val = wire_22r[FP_FRAC_LENGTH+7:FP_FRAC_LENGTH];
            assign g_val = wire_22g[FP_FRAC_LENGTH+7:FP_FRAC_LENGTH];
            assign b_val = wire_22b[FP_FRAC_LENGTH+7:FP_FRAC_LENGTH];    
        end
    endgenerate     
          
    assign pxl_out = {r_val,g_val,b_val};	
    
    always @( posedge clk )
    begin
        if( ! start ) begin
            irow <= 11'd0;
            icol <= 11'd0;
        end
        else begin 
            icol <= icol + 1;
            if ( icol==W_PADDED-1 ) begin
                if( irow<H_PADDED+5 ) begin
                    irow <= irow + 1;
                    icol <= 11'd0;
                end
                else begin
                    irow <= 11'd0;
                    icol <= 11'd0;
                end
            end
        end
    end
    
    reg ready_reg;
    always @*
    begin
        if( start ) begin
            if( irow>PAD_SIZE-1 && irow<H_PADDED-1 && icol>PAD_SIZE-1 && icol<W_PADDED-1 ) 
                ready_reg = 1'b1;
            else 
                ready_reg = 1'b0;
        end
        else
            ready_reg = 1'b0;
    end
    assign ready = ready_reg;
    
    reg start_of_frame_reg;
    always @( posedge clk )
    begin
        if( start ) begin
            if( irow==KERNEL_SIZE-1 && icol==KERNEL_SIZE-1+9 ) 
                start_of_frame_reg <= 1;
            else
                start_of_frame_reg <= 0;
        end
        else 
            start_of_frame_reg <= 0;
    end
    assign start_of_frame = start_of_frame_reg;
            
    reg valid_reg;
    always @( posedge clk )
    begin
        if( irow>KERNEL_SIZE-2 && irow<H_PADDED ) begin
            if ( icol>KERNEL_SIZE-1+8 )
                valid_reg <= 1'b1;
            else if ( irow>KERNEL_SIZE-1 && icol<9 )
                valid_reg <= 1'b1;
            else
                valid_reg <= 1'b0;
        end
        else if( irow==H_PADDED ) begin
            if ( icol<9 )
                valid_reg <= 1'b1;
            else
                valid_reg <= 1'b0; 
        end
        else 
            valid_reg <= 1'b0; 
    end
    assign valid = valid_reg;
    
    reg last_reg;
    always @( posedge clk )
    begin
        last_reg <= (irow>2) && (irow<H_PADDED+1) && (icol==8);
    end
    assign last = last_reg;
    
endmodule