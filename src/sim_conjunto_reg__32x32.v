`include "conjunto_reg__32x32.v"
module sim_conjunto_reg__32x32 ;

    reg  clk;
    reg  rst;
    reg  [4:0]  addr1;
    reg  [4:0]  addr2;
    reg  [4:0]  write_addr;
    reg  [31:0] write_data;
    wire [31:0] datos1;
    wire [31:0] datos2;

    conjunto_reg__32x32 dut (
        .clk(clk),
        .rst(rst),
        .addr1(addr1),
        .addr2(addr2),
        .write_addr(write_addr),
        .write_data(write_data),
        .datos1(datos1),
        .datos2(datos2)
    );

    initial begin
        clk = 0;
        forever #5 clk = !clk; // Periodo de 10 unidades de tiempo
    end


    initial begin
      $dumpfile("conjunto_reg__32x32.vcd"); 
      $dumpvars(0); 
        rst = 0;
        addr1 = 0;
        addr2 = 0;
        write_addr = 0;
        write_data = 0;
        #10;

        addr1 = 5'd0; // Probar que el registro 0 siempre es 0
        #5;

        // Intentar escribir en el registro 0 (no debería cambiar)
        rst = 1;
        write_addr = 5'd0;
        write_data = 32'h12345678;
        #10;

        // Leer nuevamente el registro 0
        addr1 = 5'd0;
        #5;

        // Escribir en un registro distinto (ejemplo: registro 1)
        write_addr = 5'd1;
        write_data = 32'hDEADBEEF;
        #10;

        // Leer el registro 1
        rst = 0; // Deshabilitar escritura
        addr1 = 5'd1;
        #5;

        // Probar el segundo puerto de lectura
        addr2 = 5'd1;
        #5;

        // Probar otro registro (ejemplo: registro 2)
        rst = 1;
        write_addr = 5'd2;
        write_data = 32'hCAFEBABE;
        #10;

        rst = 0;
        addr1 = 5'd2;
        #5;
        $finish;
    end

endmodule
