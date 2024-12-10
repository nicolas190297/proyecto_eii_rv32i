`include "registro32.v"
module sim_registro32 ;
    integer i;
    reg [31:0] d;
    reg clk;
    reg rst;
    reg load;
    wire [31:0] q;
    registro32 dut (
        .d (d),
        .clk (clk),
        .rst (rst),
        .load (load),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #10 clk = !clk;
    end

    initial begin
        $dumpfile("registro32.vcd");
        $dumpvars(0);
        rst=1;
        d={32{1'bx}}; // Concatena la repetición por 32 veces de 1'bx (constante de 1 bit binaria indeterminado)
        load=1'bx;
        @(posedge clk) #5; // espera al siguiente flanco ascendente y luego 5 unidades de tiempo adicionales
        rst = 0;
        load = 0; // no carga
        d = 5; 
        @(posedge clk) #5;
        load = 1; // carga
        @(posedge clk) #5;
        load = 0;
        #5;
        $finish;
    end
endmodule
