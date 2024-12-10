module fn_cero (
    output  Y,
    input  [31:0] a
);
    assign Y = a == 32'b0;
endmodule
