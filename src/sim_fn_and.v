`include "fn_and.v"
module sim_fn_and ;
    integer i;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] Y;
    fn_and dut (
        .Y (Y),
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("fn_and.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            a = {32{i[0]}}; // `{N{x}}` Repeite `N` veces `x`. `x[k]` selecciona el bit `k` del vector/entero `x`
            b = {32{i[1]}};
            #10;
        end
    end
endmodule
