`include "valor_inmediato.v"
module sim_valor_inmediato ;
    integer i;
    wire [31:0] inmediato;
    reg  [31:0] inst;
    reg  [ 2:0] tipo;
    reg  [31:0] esperado;

    valor_inmediato dut (
        .inmediato (inmediato),
        .inst      (inst     ),
        .tipo      (tipo     )
    );

    initial begin
        $dumpfile("valor_inmediato.vcd");
        $dumpvars(0);
        // tipo I 12 bit 11:0
        tipo = 3'b000;
        esperado =  32'd2000; inst = {esperado[11:0],{20{1'bx}}}; #10;
        esperado = -32'd2000; inst = {esperado[11:0],{20{1'bx}}}; #10;
        // tipo S 12 bit 11:0
        tipo = 3'b001;
        esperado =  32'd2000; inst = {esperado[11:5],{13{1'bx}},esperado[4:0],{7{1'bx}}}; #10;
        esperado = -32'd2000; inst = {esperado[11:5],{13{1'bx}},esperado[4:0],{7{1'bx}}}; #10;
        // tipo B 13 bit 12:1
        tipo = 3'b010;
        esperado =  32'd3000; inst = {esperado[12],esperado[10:5],{13{1'bx}},esperado[4:1],esperado[11],{7{1'bx}}}; #10;
        esperado = -32'd3000; inst = {esperado[12],esperado[10:5],{13{1'bx}},esperado[4:1],esperado[11],{7{1'bx}}}; #10;
        // tipo U 20 bit 31:12
        tipo = 3'b011;
        esperado =  32'd409600; inst = {esperado[31:12],{12{1'bx}}}; #10;
        esperado = -32'd409600; inst = {esperado[31:12],{12{1'bx}}}; #10;
        // tipo J 21 bit 20:1
        tipo = 3'b100;
        esperado =  32'd1000000; inst = {esperado[20],esperado[10:1],esperado[11],esperado[19:12],{12{1'bx}}}; #10;
        esperado = -32'd1000000; inst = {esperado[20],esperado[10:1],esperado[11],esperado[19:12],{12{1'bx}}}; #10;
    end
endmodule
