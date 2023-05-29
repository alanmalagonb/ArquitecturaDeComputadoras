`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: ACC Acumulador Permanente
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo Acumulador Final
module acc (
    input D_i,
	input rst_i,
	input      [3:0] ACT_i,
	output reg [3:0] ACC_o
);	
		
  always @(posedge D_i or posedge rst_i)
    begin
	   if (rst_i)
        ACC_o <= 4'b0000;
		else
	     ACC_o <= ACT_i;
	 end

endmodule 
