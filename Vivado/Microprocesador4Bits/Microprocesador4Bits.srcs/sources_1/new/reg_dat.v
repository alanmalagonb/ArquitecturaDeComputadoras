`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: RD Registro de datos
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo Registro de Datos
module reg_dat (
    input B_i,
	input rst_i,
	input      [3:0] DM_i,
	output reg [3:0] RD_o
);
  always @(posedge B_i or posedge rst_i)
    begin
	   if (rst_i)
		  RD_o <= 4'b0000;
		else
	     RD_o <= DM_i;
	 end

endmodule 