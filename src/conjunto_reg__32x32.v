module conjunto_reg__32x32 (
output reg [31:0] datos1,   //memoria de salida del primer puerto
output reg [31:0] datos2,   //memoria de salida del segundo puerto
    input  [4:0] addr1, //direccion del primer puerto de lectura
    input  [4:0] addr2, //direccion del segundo puerto de lectura
    input  [4:0] write_addr, //direccion del puerto de escritura
    input  [31:0] write_data,       // Datos de entrada para escritura
    input  clk,
    input write_en
);
    integer i;
    reg [31:0] memoria [31:0];

    initial begin  
        for(i=0; i<32; i=i+1) begin // Inicializar el todo la memoria en 0
            memoria[i] = 32'b0;
        end
    end

     always @(posedge clk) begin
        if (write_en && write_addr != 5'b0)begin
            memoria[write_addr] <= write_data;
        end
    end

    always @(posedge clk) begin
        datos1 <= memoria[addr1];
        datos2 <= memoria[addr2];
    end
endmodule
