`include "fn_suma_resta.v"
module sim_fn_suma_resta ;
    integer i;
    
    reg  [31:0] a;
    reg  [31:0] b;
    reg         resta;
    wire [31:0] Y;

    fn_suma_resta dut (
        .Y     (Y),
        .a     (a),
        .b     (b),
        .resta (resta)
    );

    initial begin
        $dumpfile("fn_suma_resta.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            a = {$random}%2001 - 1000; // $random genera un integer aleatorio {} es una concatenacion, su resultado es sin signo
            b = {$random}%2001 - 1000; // numero aleatorio entre -1000 y 1000
            resta = 0;
            #10; // espera 10 unidades de tiempo
            resta = 1;
            #10;
        end
    end
endmodule
