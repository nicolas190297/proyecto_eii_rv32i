module fn_comparacion_menor (
    output [31:0] Y,
    input  [31:0] a,
    input  [31:0] b,
    input         sin_signo
);
    wire [31:0] xa;
    wire [31:0] xb;
    assign xa = {(sin_signo ? a[31] : ~a[31]), a [30:0]};
    assign xb = {(sin_signo ? b[31] : ~b[31]), b [30:0]};
    assign Y  = xa < xb;
endmodule
