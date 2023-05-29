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

//Módulo de Estimulo Acumulador Final

module tb_acc ();
  reg        D_i;
  reg        rst_i; 
  reg  [3:0] ACT_i;
  wire [3:0] ACC_o;
  
  acc ACC1(D_i, ACT_i, ACC_o);

//  initial CLK = 1'b0; //Inicializamos el reloj
//  always #5 CLK = ~CLK;	//El ciclo del Reloj  (cambia cada 5 nS)
//  
  initial 
    begin

          D_i = 1'b0; ACT_i = 4'b0000;
      #25 D_i = 1'b0; ACT_i = 4'b0000;
      #5  D_i = 1'b1; ACT_i = 4'b1111;
      #25 D_i = 1'b0; ACT_i = 4'b1111;
      #25 D_i = 1'b0; ACT_i = 4'b0101;
      #25 D_i = 1'b1; ACT_i = 4'b1010;
	  #5  D_i = 1'b0; ACT_i = 4'b1010;
	  #25 D_i = 1'b0; ACT_i = 4'b1010;
      #25;
    end
  initial
    #250 $finish;
endmodule
