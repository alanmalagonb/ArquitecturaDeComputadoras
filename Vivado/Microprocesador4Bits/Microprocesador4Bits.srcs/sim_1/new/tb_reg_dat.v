`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: RD Registro de datos
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Módulo de Estimulo para el registro de Datos

module tb_reg_dat ();
  reg        B_i;
  reg        rst_i;
  reg  [3:0] DM_i;
  wire [3:0] RD_o;
  
  reg_dat RD1(B_i, rst_i, DM_i, RD_o);

//  initial CLK = 1'b0; //Inicializamos el reloj
//  always #5 CLK = ~CLK;	//El ciclo del Reloj  (cambia cada 5 nS)
//  
  initial 
    begin

      	 rst_i = 1'b0; B_i = 1'b0; DM_i = 4'b0000;
      #10 rst_i = 1'b1; B_i = 1'b0; DM_i = 4'b0000;
		#10 rst_i = 1'b0; B_i = 1'b0; DM_i = 4'b0000;
		#25 B_i = 1'b0; DM_i = 4'b0000;
      #5  B_i = 1'b1; DM_i = 4'b1111;
      #25 B_i = 1'b0; DM_i = 4'b1111;
      #25 B_i = 1'b0; DM_i = 4'b0101;
      #25 B_i = 1'b1; DM_i = 4'b1010;
		#5  B_i = 1'b0; DM_i = 4'b1010;
		#25 B_i = 1'b0; DM_i = 4'b1010;
      #10 rst_i = 1'b0; B_i = 1'b0; DM_i = 4'b1100;
      #10 rst_i = 1'b1; B_i = 1'b0; DM_i = 4'b0110;
		#10 rst_i = 1'b0; B_i = 1'b0; DM_i = 4'b0111;
      #25;
    end
  initial
    #250 $finish;
endmodule
      
