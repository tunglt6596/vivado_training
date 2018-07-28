// Multiply Accumulate Unit

`timescale 1ns / 1ps

module mac
#(
    parameter L = 24
)
(
    input [7:0] in,
    input [L-1:0] w,
    input [L-1:0] b,
    output [L-1:0] out
    );

wire [L-1:0] d;

qmult qmult_unit(
    .i_multiplicand(in),
    .i_multiplier(w),
    .o_result(d)
);

qadd qadd_unit(
    .a(d),
    .b(b),
    .c(out)
);

endmodule
