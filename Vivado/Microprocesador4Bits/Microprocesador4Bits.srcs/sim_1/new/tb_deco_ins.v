`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: DI Decodificador de instrucción (DI)
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

//Modulo de estimulo

module tb_deco_ins ();

//input
reg  [3:0] RI_i;

//output
wire [0:7] DI_o;

deco_ins uut(RI_i, DI_o);

initial 
  begin
    RI_i = 4'b1111;
	 #10
	 RI_i = 4'b0000;
	 #10
	 RI_i = 4'b0001;
	 #10
	 RI_i = 4'b0010;
	 #10
	 RI_i = 4'b0001;
	 #10
	 RI_i = 4'b0011;
	 #10
	 RI_i = 4'b0100;
	 #10
	 RI_i = 4'b0101;
  end
  
initial #70 $finish;

endmodule
	 