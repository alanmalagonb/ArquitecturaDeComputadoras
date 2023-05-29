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

reg        clk;
reg  [1:0] address;

wire [3:0] data_out;

rom uut(clk, address, data_out);

initial clk = 1'b0;

always #10 clk = ~clk;  //periodo de 20 unidades de tiempo

initial
  begin
    address = 2'b00;  // 0
	 #20
	 address = 2'b11; // 3
	 #20
	 address = 2'b10; // 2
	 #20
	 address = 2'b01; // 1
  end
  
initial #80 $finish;

endmodule