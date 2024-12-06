module fn_xor (
    output [31:0] Y, // seniales
    input  [31:0] a,
    input  [31:0] b
);
    assign Y = a ^ b; // para las que no se son registros, always para los registros
endmodule
