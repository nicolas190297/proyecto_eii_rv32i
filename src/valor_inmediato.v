module valor_inmediato (
    output reg [31:0] inmediato,
    input  [31:0] inst,
    input  [2:0] tipo
);
    always @(*) begin
        case(tipo)
        3'b000: //Tipo I
        //inmediato[31:11] = {21{inst[31]}};
        //inmediato[10:0] = inst[30:20];
        inmediato = {{21{inst[31]}},inst[30:20]};

        3'b001: //Tipo S
        inmediato = {{21{inst[31]}},inst[30:25],inst[11:7]};

        3'b010: //Tipo B
        inmediato = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};

        3'b011: //Tipo U
        inmediato = {inst[31],inst[30:12],12'b0};

        3'b100: //Tipo J
        inmediato = {{12{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};

        endcase
    
    end
endmodule
