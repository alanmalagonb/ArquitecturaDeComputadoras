`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 6CV1
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

//Modulo de Estimulo
module tb_rom ();

reg  [3:0] address;

wire [3:0] data_out;

rom uut(address, data_out);


initial
  begin
    address = 4'b0000;  
	 #20
	 address = 4'b0101; 
	 #20
	 address = 4'b0100; 
	 #20
	 address =4 'b0010;
	 #20
	 address =4 'b0001; 
	 #20;
  end
  
initial #100 $finish;

endmodule