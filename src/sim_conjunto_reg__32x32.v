`include "conjunto_reg__32x32.v"
module sim_conjunto_reg__32x32 ;
    reg  clk;
    reg  write_en;
    reg  [4:0]  addr1;
    reg  [4:0]  addr2;
    reg  [4:0]  write_addr;
    reg  [31:0] write_data;
    wire [31:0] datos1;
    wire [31:0] datos2;

    conjunto_reg__32x32 dut (
        .clk(clk),
        .write_en(write_en),
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
        write_en = 0;
        addr1 = 0;
        addr2 = 0;
        write_addr = 0;
        write_data = 0;
        @(posedge clk) #1;


        addr1 = 0; // Probar que el registro 0 siempre es 0
        // Intentar escribir en el registro 0 (no debería cambiar)
        write_en = 1;
        write_addr = 0;
        write_data = 32'h12345678;
        @(posedge clk) #1;
         // Leer nuevamente el registro 0
        write_en = 0;
        @(posedge clk) #1;

        // Escribe registro 1
        write_addr = 5'd1;
        write_data = 32'hDEADBEEF;
        write_en = 1;
        @(posedge clk) #1;
        // Escribe registro 2
        write_addr = 5'd2;
        write_data = 32'h12345678;
        write_en = 1;
        @(posedge clk) #1;
        // No escribe
        write_en = 0;
        write_data = 0;

        // Lee registros 1 y 2
        addr1 = 1;
        addr2 = 2;
        @(posedge clk) #1;
        @(posedge clk) #1;
        #5;
        $finish;
    end

endmodule
