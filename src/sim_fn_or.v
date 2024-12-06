`include "fn_or.v"
module sim_fn_or ;
    integer i;
    reg [31:0] a;
    reg [31:0] b;
    wire[31:0] Y;
    fn_or dut (
        .Y (Y),
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("fn_or.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            a = {32{i[0]}};
            b = {32{i[1]}};
            #10;
        end
    end
endmodule
