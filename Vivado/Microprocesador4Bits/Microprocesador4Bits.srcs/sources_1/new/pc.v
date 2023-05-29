`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: PC Contador de Programa 
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module pc (
  input   rst_i,
  input   E_i,
  input   [0:7] DI_i,
  output reg [3:0] PC_o 
);

   always @(posedge rst_i or posedge E_i)
	   if (rst_i)
		   PC_o <= 4'b0000;
	   else if (DI_i == 8'b0000001)
		   PC_o <= 4'b0000;
		else if (E_i)
		   PC_o <= PC_o + 1;

endmodule
