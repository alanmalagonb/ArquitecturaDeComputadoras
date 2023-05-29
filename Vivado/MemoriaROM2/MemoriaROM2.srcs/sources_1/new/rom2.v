`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Create Date: 25.03.2023 20:00:34
// Design Name: rom3
// Module Name: rom3
// Project Name: MemoriaROM3
// Target Devices: Artix
// Description: Opción 3: Inicializar arreglo por medio de archivo
//
//////////////////////////////////////////////////////////////////////////////////

//modulo descriptivo
module rom3
#(
parameter WIDTH = 4,
parameter DEPTH = 4,
parameter DEPTH_LOG = $clog2(DEPTH))
(
input clk,
input [DEPTH_LOG-1:0] addr_rd,
output reg  [WIDTH-1:0] data_out
);

// Declaramos el arreglo de la ROM
reg [WIDTH-1:0] rom [0:DEPTH-1];

// Cargamos la rom con datos del archivo data.mem
// La ubicación relativa depende de la ubicación del proyecto de Vivado
initial 
  begin
     $readmemb("data.mem",rom,0,DEPTH-1);
  end
  
 //  La lectura es síncrona
always @(posedge clk)
  data_out <= rom[addr_rd];
  
endmodule

