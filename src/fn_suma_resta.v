module fn_suma_resta (
    output [31:0] Y,
    input  [31:0] a,
    input  [31:0] b,
    input         resta
);
    wire [31:0] x;
    assign x = resta? ~ b : b;
    assign Y = a + x + resta;
endmodule
