module fn_desp_der (
    output [31:0] Y,
    input  [31:0] a,
    input  [4:0] b,
    input con_signo
);

    assign Y = con_signo? $unsigned($signed(a) >>> b) : a >> b ;
endmodule
