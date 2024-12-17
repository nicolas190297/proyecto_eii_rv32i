`include "branch.v"
module sim_branch ;
    reg [2:0] funct3;
    wire z_branch;
    branch dut (
        .z_branch (z_branch),
        .funct3 (funct3)
    );

    initial begin
        $dumpfile("branch.vcd");
        $dumpvars(0);
        funct3 = 000;#10;
        funct3 = 001;#10;
        funct3 = 100;#10;
        funct3 = 101;#10;
        funct3 = 110;#10;
        funct3 = 111;#10;
            #10;
        end
endmodule
