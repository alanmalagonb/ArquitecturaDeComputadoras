`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: ACT Acumulador Temporal
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Módulo de Estimulo para el acumulador temporal

module tb_act ();
  reg        C_i;
  reg        rst_i;
  reg  [3:0] OP_i;
  wire [3:0] ACT_o;
  
act UUT(C_i, rst_i, OP_i, ACT_o);

initial 
   begin 
	  C_i = 1'b0;  //Inicializamos el reloj
	  rst_i = 1'b0;
	  OP_i = 4'b0000;
	end
	
always #5 C_i = ~C_i;	//El ciclo del Reloj  (cambia cada 5 nS)

initial 
   begin

             rst_i = 1'b0; OP_i = 4'b0000;
        #10  rst_i = 1'b1; OP_i = 4'b0000; 
		#10  rst_i = 1'b1; OP_i = 4'b0000; 
		#10  rst_i = 1'b0; OP_i = 4'b0001; 
        #10  rst_i = 1'b0; OP_i = 4'b1111;
        #10  rst_i = 1'b0; OP_i = 4'b1111;
        #10  rst_i = 1'b0; OP_i = 4'b0101;
        #10  rst_i = 1'b0; OP_i = 4'b1010;
		#10  rst_i = 1'b0; OP_i = 4'b1010;
		#10  rst_i = 1'b0; OP_i = 4'b1010;
		#10  rst_i = 1'b0; OP_i = 4'b0000; 
		#10  rst_i = 1'b1; OP_i = 4'b0000;
		#10  rst_i = 1'b0; OP_i = 4'b0001; 
		#10  rst_i = 1'b0; OP_i = 4'b0001; 
        #10;
   end
//
  initial
    #150 $finish;
endmodule