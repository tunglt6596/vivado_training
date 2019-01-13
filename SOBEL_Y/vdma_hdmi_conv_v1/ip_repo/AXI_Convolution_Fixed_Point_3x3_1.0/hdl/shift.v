// Shifts data by a fixed depth.
// Optimize in future by finding a way to create 2-d arrays

module shift
#(
    parameter IMAGE_WIDTH = 640,
    parameter KERNEL_SIZE = 3
)
(
  input clk,
  input [23:0] data_in,
  output [23:0] data_out
);

parameter D = IMAGE_WIDTH-1;

// Define holding register for each bit

reg [23:0] hr[D-1:0];

integer i;
always @ (posedge clk) 
begin
    hr[0] <= data_in;
    for(i=1; i<D; i=i+1)
        hr[i] <= hr[i-1];
end

assign data_out = hr[D-1];

endmodule