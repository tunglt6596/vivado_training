// Shifts data by a fixed depth.
// Optimize in future by finding a way to create 2-d arrays

module shift
#(
    parameter L = 24,
    parameter N = 640,
    parameter K = 3
)
(
  input clk,
  input [L-1:0] data_in,
  output [L-1:0] data_out
);

parameter D = N-K;

// Define holding register for each bit
reg [L-1:0] hr[D-1:0];

integer i;
always @ (posedge clk) 
begin
    hr[0] <= data_in;
    for(i=1; i<D; i=i+1)
        hr[i] <= hr[i-1];
end

assign data_out = hr[D-1];

endmodule