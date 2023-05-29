`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Module Name: Mux_2_To_1_Width
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module Mux_2_To_1_Width #(parameter g_WIDTH = 8)
  (input  i_Select,
   input  [g_WIDTH-1:0] i_Data1,
   input  [g_WIDTH-1:0] i_Data2,
   output [g_WIDTH-1:0] o_Data);
   
  assign o_Data = i_Select ? i_Data1 : i_Data2;
   
endmodule // Mux_2_To_1_Width