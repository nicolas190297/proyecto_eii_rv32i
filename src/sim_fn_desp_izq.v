`include "fn_desp_izq.v"
module sim_fn_desp_izq ;
    integer i;
    reg [31:0] a;
    reg [4:0]  b;
    wire [31:0] Y;
    fn_desp_izq dut (
        .Y (Y),
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("fn_desp_izq.vcd");
        $dumpvars(0);
        a = 1;
        for (i=0;i<32;i = i + 1) begin
            b = i;
            #10;
        end
    end
endmodule
