`include "fn_comparacion_menor.v"
module sim_fn_comparacion_menor ;
    integer i;
    reg  [31:0]a;
    reg  [31:0]b;
    reg         sin_signo;
    wire  [31:0]Y;
    fn_comparacion_menor dut (
        .Y (Y),
        .a (a),
        .b (b),
        .sin_signo (sin_signo)
    );

    initial begin
        $dumpfile("fn_comparacion_menor.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            a = {$random}%2001 - 1000; // $random genera un integer aleatorio {} es una concatenacion, su resultado es sin signo
            b = {$random}%2001 - 1000; // numero aleatorio entre -1000 y 1000
            sin_signo = 0;
            #10; // espera 10 unidades de tiempo
            sin_signo = 1;
            #10;
        end
        a = 112;
        b = 112;
        sin_signo = 0;
        #10;
        sin_signo = 1;
        #10;
    end
endmodule
