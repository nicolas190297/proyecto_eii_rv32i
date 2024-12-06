`include "fn_xor.v"
module sim_fn_xor ;
    integer i;

    reg  [31:0] a;
    reg  [31:0] b; // cables o elementos de memoria
    wire [31:0] Y; // cable solo 
    fn_xor dut (
        .Y (Y), // .puerto (cable)
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("fn_xor.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            a = {$random}; // $random genera un integer aleatorio {} es una concatenacion, su resultado es sin signo
            b = {$random};
            #10; // espera 10 unidades de tiempo
        end
    end
endmodule
