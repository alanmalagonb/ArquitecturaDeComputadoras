`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Project Name: ALU
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module alu (
  input [0:7] DI_i,
  input [3:0] RD_i,
  input [3:0] ACC_i,
  output reg [3:0] OP_o
);

parameter AND = 8'b10000000, OR = 8'b01000000, XOR = 8'b00100000, SUM = 8'b00010000;
parameter INV = 8'b00001000, HOLD = 8'b00000100; 

//Opcion if 
 always @(DI_i, ACC_i, RD_i)
   begin 
     if (DI_i == AND)
	     OP_o = ACC_i & RD_i;  //AND
	  else if (DI_i == OR)
	     OP_o = ACC_i | RD_i;  // OR
	  else if (DI_i == XOR)
	     OP_o = ACC_i ^ RD_i;  //XOR
	  else if (DI_i == SUM)
	     OP_o = ACC_i + RD_i;  // SUMA
	  else if (DI_i == INV)
	     OP_o = ~ACC_i;     // INVIERTE 
	  else if (DI_i == HOLD)
	     OP_o = ACC_i;     // HOLD
	  else 
	     OP_o = RD_i;      // CARGA ACUMULADOR
   end
//Opcion case
//
//   always @(DI_i,ACC_i, RD_i)
//	  begin
//	   case (DI_i)
//		  AND  : OP_o = ACC_i & RD_i;
//		  OR   : OP_o = ACC_i | RD_i;
//		  XOR  : OP_o = ACC_i ^ RD_i;
//		  SUM  : OP_o = ACC_i + RD_i;
//		  INV  : OP_o = ~ACC_i;
//		  HOLD : OP_o = ACC_i;
//		  default : OP_o = RD_i;
//      endcase
//	  end

endmodule