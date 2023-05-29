`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: ACT Acumulador Temporal
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo Acumulador temporal
module act (
   input C_i,
	input rst_i,
	input  [3:0] OP_i,
	output reg [3:0] ACT_o
);

  always @(posedge C_i, posedge rst_i)
    begin
	   if (rst_i)
		  ACT_o <= 4'b0000;
		else
	     ACT_o <= OP_i;
	 end
	
endmodule 
