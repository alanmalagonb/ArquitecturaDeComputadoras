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

//Módulo de estímulo para program Counter
module tb_pc();
  reg rst_i, E_i;
  reg [0:7] DI_i;
  wire [3:0] PC_o;
  
  pc UUT(rst_i, E_i, DI_i, PC_o);
  
  initial E_i = 0;
  
  always #5 E_i = ~E_i;
  
  initial 
   begin
     rst_i=0; DI_i=8'b00000000;
     rst_i=1; DI_i=8'b00000001; #10
     rst_i=0; DI_i=8'b00000010; #10
     rst_i=0; DI_i=8'b00001000; #10
     rst_i=0; DI_i=8'b01000000; #10
     rst_i=0; DI_i=8'b00010000; #10
     rst_i=0; DI_i=8'b00100000; #10
	 rst_i=1; DI_i=8'b00100000; #10
	 rst_i=0; DI_i=8'b10000000; #10
	 rst_i=0; DI_i=8'b00000001; #10
    #10
    $finish;
  end
  
endmodule