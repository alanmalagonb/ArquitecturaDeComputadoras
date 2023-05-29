`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Module Name: mux_4to1_logico
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////


module mux_4to1_logico(input wire [1:0] i_Select,
                   input wire i_Data1,
                   input wire i_Data2,
                   input wire i_Data3,
                   input wire i_Data4,
                   output wire o_Data);
   
assign o_Data = (i_Data1 & ~i_Select[1] & ~i_Select[0]) |
                (i_Data2 & ~i_Select[1] &  i_Select[0]) |
                (i_Data3 &  i_Select[1] & ~i_Select[0]) |
                (i_Data4 &  i_Select[1] &  i_Select[0]);

endmodule