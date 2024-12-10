`include "alu.v"
module sim_alu ;
    integer i;
    reg [31:0] a;
    reg [ 3:0] sel;
    reg [31:0] b;
    wire[31:0] Y;
    wire        z;

    alu dut (
        .Y (Y),
        .sel(sel),
        .a (a),
        .b (b),
        .z (z)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0);
        a = 1; b = 5; sel = 4'b0000; #5; //Suma
        a = 1; b = 5; sel = 4'b0001; #5; //Resta
        a = 5; b = 5; sel = 4'b0001; #5; //Resta igual a cero
        a = 1; b = 5; sel = 4'b001x; #5; //Desplazamiento izquierda
        a = 1; b = 5; sel = 4'b010x; #5; //menor que complemento a 2
        a = 1; b = 5; sel = 4'b011x; #5; //menor que binario natural
        a = 1; b = 5; sel = 4'b100x; #5; //Xor
        a = 32'h80000000; b = 4; sel = 4'b1010; #5; //desplazamiento derecha binario natural
        a = 32'h80000000; b = 4; sel = 4'b1011; #5; //desplazamiento derecha completo a 2
        a = 1; b = 5; sel = 4'b110x; #5; //OR
        a = 1; b = 5; sel = 4'b111x; #5; //AND
    end
endmodule
