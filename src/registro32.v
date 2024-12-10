module registro32 (
    output reg [31:0] q,
    input  [31:0] d,
    input  clk,
    input  rst,
    input  load
);

    always @(posedge clk) begin
        if (rst)       q <= 0;
        else if (load) q <= d;
    end
endmodule
