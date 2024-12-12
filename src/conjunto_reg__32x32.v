module conjunto_reg__32x32 (
output reg [31:0] datos1,   //datos de salida del primer puerto
output reg [31:0] datos2,   //datos de salida del segundo puerto
    input  [4:0] addr1, //direccion del primer puerto de lectura
    input  [4:0] addr2, //direccion del segundo puerto de lectura
    input  [4:0] write_addr, //direccion del puerto de escritura
    input  [31:0] write_data,       // Datos de entrada para escritura
    input  clk,
    input  rst
);

    reg [31:0] registro [31:0];

    initial begin   // Inicializar el registro 0 a 0
        registro[0] = 32'b0;
    end

     always @(posedge clk) begin
        if (rst && write_addr != 5'b0)begin
            registro[write_addr] <= write_data;
        end
    end

    always @(*) begin
        datos1 = registro[addr1];
        datos2 = registro[addr2];
    end
endmodule
