`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Create Date: 25.03.2023 20:00:34
// Design Name: rom
// Module Name: rom
// Project Name: MemoriaROM
// Target Devices: Artix
// Description: Version 1 
// Una declaración de caso para definir el contenido de cada ubicación en la 
// memoria en función de la dirección entrante
//
//////////////////////////////////////////////////////////////////////////////////

// Example: Behavioral Model of a 4x4 Synchronous Read Only Memory in Verilog
// Brock J. LaMeres, Introduction to Logic Circuits & Logic Design with Verilog,
// Springer, 1st Edition, USA, 2017.  pp 353

module rom (
    input  [3:0] address,
    output reg  [3:0] data_out
);

always @(address)
  case (address)
     4'b0000   : data_out = 4'b0000;
	 4'b0001   : data_out = 4'b1110;
	 4'b0010   : data_out = 4'b0010;
	 4'b0011   : data_out = 4'b0100;
	 4'b0100   : data_out = 4'b1101;
	 4'b0101   : data_out = 4'b0110;
	 default : data_out = 4'bXXXX;
  endcase
  
endmodule