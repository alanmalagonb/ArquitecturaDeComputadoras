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

//Módulo de Estimulo para el FlipFlop JK

module tb_reg_ins ();
  reg        A_i;
  reg      rst_i;
  reg  [3:0] DM_i;
  wire [3:0] RI_o;
  
  reg_ins RI1(A_i, rst_i, DM_i, RI_o);

//  initial CLK = 1'b0; //Inicializamos el reloj
//  always #5 CLK = ~CLK;	//El ciclo del Reloj  (cambia cada 5 nS)
//  
  initial 
    begin

      	 rst_i = 1'b0; A_i = 1'b0; DM_i = 4'b0000;
	 #10 rst_i = 1'b1; A_i = 1'b0; DM_i = 4'b0000;
	 #10 rst_i = 1'b0; A_i = 1'b0; DM_i = 4'b0000;
       #25 A_i = 1'b0; DM_i = 4'b0000;
       #5  A_i = 1'b1; DM_i = 4'b1111;
       #25 A_i = 1'b0; DM_i = 4'b1111;
       #25 A_i = 1'b0; DM_i = 4'b0101;
       #25 A_i = 1'b1; DM_i = 4'b1010;
       #5  A_i = 1'b0; DM_i = 4'b1010;
	   #25 A_i = 1'b0; DM_i = 4'b1010;
	 #10 rst_i = 1'b1; A_i = 1'b0; DM_i = 4'b0000;
	 #10 rst_i = 1'b0; A_i = 1'b0; DM_i = 4'b0000;
      #25;
    end
  initial
    #250 $finish;
    
endmodule
      
