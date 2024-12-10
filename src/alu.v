`include "fn_and.v"
`include "fn_comparacion_menor.v"
`include "fn_desp_der.v"
`include "fn_desp_izq.v"
`include "fn_or.v"
`include "fn_suma_resta.v"
`include "fn_xor.v"
`include "fn_cero.v"

module alu (
    output reg [31:0] Y,
    output            z,
    input      [31:0] a,
    input      [31:0] b,
    input      [ 3:0] sel
);
    wire [31:0] y_suma_resta;
    wire [31:0] y_desp_izq;
    wire [31:0] y_desp_der;
    wire [31:0] y_menor;
    wire [31:0] y_and;
    wire [31:0] y_or;
    wire [31:0] y_xor;


    fn_and U_and(
        .Y(y_and),
        .a(a),
        .b(b)
    );

    fn_comparacion_menor U_comparacion_menor (
        .Y(y_menor),
        .a(a),
        .b(b),
        .sin_signo(sel[1])
    );

    fn_desp_der U_desp_der (
        .Y(y_desp_der),
        .a(a),
        .b(b[4:0]),
        .con_signo(sel[0])
    );

    fn_desp_izq U_desp_izq (
        .Y(y_desp_izq),
        .a(a),
        .b(b[4:0])
    );

    fn_or U_or(
        .Y(y_or),
        .a(a),
        .b(b)
    );

    fn_suma_resta U_suma_resta (
        .Y(y_suma_resta),
        .a(a),
        .b(b),
        .resta(sel[0])
    );

    fn_xor U_xor(
        .Y(y_xor),
        .a(a),
        .b(b)
    );

    always @(*) begin
        case (sel[3:1])
        3'b000: Y = y_suma_resta;
        3'b001: Y = y_desp_izq;
        3'b010: Y = y_menor;
        3'b011: Y = y_menor;
        3'b100: Y = y_xor;
        3'b101: Y = y_desp_der;
        3'b110: Y = y_or;
        3'b111: Y = y_and;
        endcase
    end
    fn_cero U_cero(
        .Y(z),
        .a(Y)
    );
endmodule
