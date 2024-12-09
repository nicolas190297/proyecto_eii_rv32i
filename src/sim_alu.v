`include "alu.v"
module sim_alu ;
    integer i;
    reg [31:0] a;
    reg [ 3:0] sel;
    reg [31:0] b;
    wire[31:0] Y;
    wire[31:0] z;
    alu dut (
        .Y (Y),
        .sel(sel),
        .a (a),
        .b (b),
        .z(z)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0);
        a = 1; b = 5; sel = 4'b0000; #10;
        #10;
    end
endmodule
