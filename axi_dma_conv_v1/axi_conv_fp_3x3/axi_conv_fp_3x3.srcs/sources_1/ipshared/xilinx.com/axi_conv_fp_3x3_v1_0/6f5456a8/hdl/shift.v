// Shifts data by a fixed depth.
// Optimize in future by finding a way to create 2-d arrays

module shift
#(
    parameter L = 24,
    parameter N = 640,
    parameter K = 3
)
(
  input wire clk,
  input wire [L-1:0] data_in,
  output reg [L-1:0] data_out
);

parameter D = N-K;

// Define holding register for each bit
reg [D-1:0] hr[L-1:0];

integer i;
always @ (posedge clk) begin
    for(i = 0; i<L; i=i+1)
        hr[i][D-1:0] <= {hr[i][D-2:0],data_in[i]};
end

integer j;
always @*
begin
    for(j=0; j<L; j=j+1)
        data_out[j] = hr[j][D-1];
end

endmodule