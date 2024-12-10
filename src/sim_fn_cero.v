`include "fn_cero.v"
module sim_fn_cero ;
    integer i;
    reg [31:0] a;
    wire Y;
    fn_cero dut (
        .Y (Y),
        .a (a)
    );

    initial begin
        $dumpfile("fn_cero.vcd");
        $dumpvars(0);
        a = 0;
        #10;
        for (i=0;i<4;i = i + 1) begin
            #10;
        end
           a = 1;
        #10;
        for (i=0;i<4;i = i + 1) begin
            #10;
        end
    end
endmodule
