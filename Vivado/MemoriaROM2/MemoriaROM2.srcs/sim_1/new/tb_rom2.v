`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 6CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Create Date: 25.03.2023 20:00:34
// Design Name: rom2
// Module Name: rom2
// Project Name: MemoriaROM2
// Target Devices: Artix
// Description: Opción 2
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo de estimulo
module tb_rom2 ();

//Inputs
reg clk;
reg [1:0] address;

//Outputs
wire [3:0] data_out;

//Instantiation of Unit Under Test
rom2 uut(clk,address,data_out);

initial clk = 1'b0;

always #10 clk = ~clk;

initial
  begin
     address = 2'b00;
     #20
     address = 2'b11;
     #20
     address = 2'b10;
     #20
     address = 2'b01;
  end
endmodule