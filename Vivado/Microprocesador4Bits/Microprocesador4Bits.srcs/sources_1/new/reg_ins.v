`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: RI Registro de instrucción
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo Registo de instrucciones
module reg_ins (
    input A_i,
	input rst_i,
	input      [3:0] DM_i,
	output reg [3:0] RI_o
);
  always @(posedge A_i or posedge rst_i)
    begin
	    if (rst_i)
		    RI_o <= 4'b0000;
	    else 
		    RI_o <= DM_i;
	 end

endmodule 