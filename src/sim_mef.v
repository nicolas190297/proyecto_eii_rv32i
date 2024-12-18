`include "mef.v"
module sim_mef ;
    integer i;
    reg a,b;
    wire Y;
    mef dut (
        .Y (Y),
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("mef.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            {a,b} = i[1:0];
            #10;
        end
    end
endmodule
