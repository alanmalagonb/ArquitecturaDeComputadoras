`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Microprocesador de 4 bits
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Módulo de Estimulo para m4b (Microprocesador de 4 bits

module tb_m4b ();
    reg rst;
	reg clk;
	
	wire [3:0] DM;
	
	wire        A_out;
	wire        B_out;
	wire        C_out;
	wire        D_out;
	wire        E_out;
	
	wire  [0:7] DI_out;
	wire  [3:0] RI_out;
    wire  [3:0] RD_out;
    wire  [3:0] ACC_out;
    wire  [3:0] ACT_out;
    wire  [3:0] OP_out;	
	wire  [3:0] Q_out;
	wire  [3:0] PC_o;
  
  mp4b m4b1(rst, clk, DM, A_out, B_out, C_out, D_out, E_out, DI_out, RI_out, RD_out, ACC_out, ACT_out, OP_out, Q_out, PC_o);

  initial clk = 1'b0; //Inicializamos el reloj
  always #5 clk = ~clk;	//El ciclo del Reloj  (cambia cada 5 nS)

  initial 
    begin

          rst=1'b0; //DM=4'b0000;
	  #10 rst=1'b1; //DM=4'b0001;
	  #10 rst=1'b0; //DM=4'b0010;
	  #10 rst=1'b0; //DM=4'b0100;
      #10 rst=1'b0; //DM=4'b0000; 
      #10 rst=1'b0; //DM=4'b0100;
      #10 rst=1'b0; //DM=4'b0010; 
      #10 rst=1'b0; //DM=4'b0100;
      #10 rst=1'b0; //DM=4'b0010;
      #10 rst=1'b0; //DM=4'b0100;
	  #10 rst=1'b0; //DM=4'b0010;
	  #10 rst=1'b0; //DM=4'b0100;
	  #10 rst=1'b0; //DM=4'b0010;
	  #10 rst=1'b0; //DM=4'b0100;
	  #10 rst=1'b0; //DM=4'b0010;
      #25;
    end
  initial
    #250 $finish;
endmodule
      