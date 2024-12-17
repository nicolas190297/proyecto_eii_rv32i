`include "branch.v"
module sim_branch ;
    integer i;
    reg a,b;
    wire Y;
    branch dut (
        .Y (Y),
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("branch.vcd");
        $dumpvars(0);
        for (i=0;i<4;i = i + 1) begin
            {a,b} = i[1:0];
            #10;
        end
    end
endmodule
