`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 6CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Create Date: 25.03.2023 20:00:34
// Design Name: rom3
// Module Name: rom3
// Project Name: MemoriaROM3
// Target Devices: Artix
// Description: Opción 3
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo de estimulo
module read_file ();

localparam WIDTH= 4;
localparam DEPTH = 4;
localparam DEPTH_LOG = $clog2(DEPTH);

//Inputs
reg clk;
reg [DEPTH_LOG-1:0] addr_rd;
wire [WIDTH-1:0] data_rd;

integer i;

// Instanciamos el modulo
rom3 #(.WIDTH(WIDTH),
    .DEPTH(DEPTH)
    ) ROM0
    (
        .clk (clk),
        .addr_rd (addr_rd),
        .data_out(data_rd)
    );
    
// Creamos la señal del reloj
initial clk = 1'b0;

always #10 clk = ~clk;

initial 
begin
    #1;
    $display($time,"Contenido de la ROM:");
    for(i=0;i<DEPTH;i=i+1) begin
        read_data(i);
     end
    #40 $stop;
   end
   
   // Leemos los datos de forma asíncrona
   task read_data(input[DEPTH_LOG-1:0] address_in);
    begin
        @(posedge clk);
        addr_rd = address_in;
        @(posedge clk);
        #0.1; // Esperamos a que los datos se propaguen
        $display($time,"address=%2d, data_rd=%x",addr_rd,data_rd);
    end
    endtask
endmodule