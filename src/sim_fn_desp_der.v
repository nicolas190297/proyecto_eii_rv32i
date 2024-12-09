`include "fn_desp_der.v"
module sim_fn_desp_der ;
    integer i;
    reg [31:0] a;
    reg [4:0] b;
    reg con_signo;
    wire [31:0] Y;
    
    fn_desp_der dut (
        .Y (Y),
        .a (a),
        .b (b),
        .con_signo(con_signo)
    );

    initial begin
        $dumpfile("fn_desp_der.vcd");
        $dumpvars(0);
        a = 32'h80000000;
        con_signo = 0;
        for (i=0;i<32;i = i + 1) begin
        b = i;
            #10;
        end
        con_signo = 1;
        for (i=0;i<32;i = i + 1) begin
        b = i;
            #10;
        end
    end
endmodule
