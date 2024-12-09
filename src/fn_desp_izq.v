module fn_desp_izq (
    output [31:0] Y,
    input  [31:0] a,
    input  [4:0] b
);
    assign Y = a << b;
endmodule
