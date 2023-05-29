`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Module Name: Mux_2_To_1
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module Mux_2_To_1 (input  i_Select,
                   input  i_Data1,
                   input  i_Data2,
                   output o_Data);
 
  assign o_Data = i_Select ? i_Data1 : i_Data2;
 
endmodule // Mux_2_To_1
