module mef (
    output esc_pc,
    output branch,
    output sel_dir,
    output esc_mem,
    output esc_inst,
    output [2:0] sel_inmediato,
    output [1:0] modo_alu,
    output [1:0] sel_op1,
    output [1:0] sel_op2,
    output [1:0] sel_y,
    input  reset,
    input clk,
    input [6:0] op
);
    //asignacion de estados
    parameter [2:0] ESCRIBE         = 0;
    parameter [2:0] CARGA           = 1;
    parameter [2:0] DECODIFICA      = 2;
    parameter [2:0] DIRECCION       = 3;
    parameter [2:0] MEMORIA_EJECUTA = 4;

    reg [2:0] estado_sig;
    reg [2:0]     estado;

    always @ (posedge clk)
    begin
        if(reset)
            estado <= ESCRIBE;
        else
            estado <= estado_sig;
    end

    //LES
    always @(posedge clk)
    begin
        case (estado)
            ESCRIBE         : estado_sig = CARGA;
            CARGA           : estado_sig = DECODIFICA;
            DECODIFICA      : estado_sig = DIRECCION;
            DIRECCION       : estado_sig = MEMORIA_EJECUTA;
            MEMORIA_EJECUTA : estado_sig = ESCRIBE;
            default         : estado_sig = ESCRIBE; 
        endcase
    end

endmodule
