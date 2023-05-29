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
    input             clk,
    input  wire [1:0] address,
    output reg  [3:0] data_out
);

always @(posedge clk)
  case (address)
//       0                e
     2'b00   : data_out = 4'b1110;
//       1                3
	 2'b01   : data_out = 4'b0010;
//       2                f	 
	 2'b10   : data_out = 4'b1111;
//       3                4	 
	 2'b11   : data_out = 4'b0100;
	 default : data_out = 4'bxxxx;
  endcase
  
endmodule