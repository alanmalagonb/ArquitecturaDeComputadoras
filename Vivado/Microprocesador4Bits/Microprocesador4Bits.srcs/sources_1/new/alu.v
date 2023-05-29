`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: ALU Unidad Logica y Aritmetica
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module alu (
  input [0:7] DI_i,
  input [3:0] RD_i,
  input [3:0] ACC_i,
  output reg [3:0] OP_o
);

parameter AND = 8'b10000000, OR = 8'b01000000, XOR = 8'b00100000;
parameter NOR = 8'b00010000, NAND = 8'b00001000, XNOR = 8'b00000100;
parameter MAYOR = 8'b00000010, MENOR = 8'b00000011, IGUAL = 8'b1100000;
parameter SUM = 8'b10100000, RES = 8'b10010000;
parameter INV = 8'b11100000, HOLD = 8'b11010000; 

//Opcion if 
 always @(DI_i, ACC_i, RD_i)
   begin 
     if (DI_i == AND)
	     OP_o = ACC_i & RD_i;  //AND
	  else if (DI_i == OR)
	     OP_o = ACC_i | RD_i;  // OR
	  else if (DI_i == XOR)
         OP_o = ACC_i ^ RD_i;  //XOR
      else if (DI_i == NOR)
         OP_o = ~(ACC_i|RD_i);  //NOR
      else if (DI_i == NAND)
         OP_o = ~(ACC_i&RD_i);  //NAND
      else if (DI_i == XNOR)
         OP_o = ~(ACC_i ^ RD_i);  //XNOR
      else if (DI_i == MAYOR)
         OP_o = (ACC_i>RD_i)?8'd1:8'd0;  //MAYOR
      else if (DI_i == MENOR)
         OP_o = (ACC_i<RD_i)?8'd1:8'd0;  //MENOR
      else if (DI_i == IGUAL)
         OP_o = (ACC_i==RD_i)?8'd1:8'd0;  //IGUAL
	  else if (DI_i == SUM)
	     OP_o = ACC_i + RD_i;  // SUMA
	  else if (DI_i == RES)
	     OP_o = ACC_i - RD_i;  // RESTA
	  else if (DI_i == INV)
	     OP_o = ~ACC_i;     // INVIERTE 
	  else if (DI_i == HOLD)
	     OP_o = ACC_i;     // HOLD
	  else 
	     OP_o = RD_i;      // CARGA ACUMULADOR
   end
endmodule
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


