`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: GCM Generador de Ciclo de Máquina
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Módulo de Estimulo

module tb_gcm();
  reg clk, rst_i;
  wire A_o,B_o,C_o,D_o, E_o;
  wire [3:0] Q_o;
  
  gcm UC1(clk, rst_i, A_o, B_o, C_o, D_o, E_o, Q_o);
  
  initial clk = 1'b0;   //Inicializamos el reloj
  always #5 clk = ~clk;	//El ciclo del Reloj  (cambia cada 5 nS)
  
  initial 
    begin
      	      rst_i = 1'b0;	
        #10   rst_i = 1'b1;
        #10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#20   rst_i = 1'b0;

    #25;
    end
  initial
    #250 $finish;
endmodule