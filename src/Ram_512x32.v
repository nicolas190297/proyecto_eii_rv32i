module Ram_512x32 #(parameter archivo = "") (
    output reg [31:0] dout,
    input      [ 8:0] addr,
    input      [31:0] din,
    input             write_en,
    input             clk
);
   reg [31:0] mem [511: 0];

   initial begin //inicializo la RAM
    if (archivo != "") $readmemh(archivo,mem,0,511);
   end

   always @ (posedge clk)
   begin
        if (write_en) begin 
            mem[(addr)] <= din; //guardara lo que haya en la entrada en esa direccion de memoria
        end
        dout <= mem [addr]; //por mas que no haya nada guardara igual 
   end
endmodule
