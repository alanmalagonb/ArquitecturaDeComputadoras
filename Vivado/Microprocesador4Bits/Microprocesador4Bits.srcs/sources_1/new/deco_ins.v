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

module deco_ins(
   input [3:0] RI_i,
   output reg [0:7] DI_o
);

parameter AND=4'b0000, OR=4'b0001, XOR=4'b0010, SUMA=4'b0011, INV=4'b0100, HOLD=4'b0101, LOAD=4'b0110, RST=4'b0111, UNAB=4'b1000;
parameter NOR=4'b1001, NAND=4'b1010, XNOR=4'b1011, MAYOR=4'b1100,MENOR=4'b1101,IGUAL=4'b1110,RES=4'b1111;
always @(RI_i)
    case (RI_i)
	    AND : DI_o = 8'b10000000;
		OR  : DI_o = 8'b01000000;
		XOR : DI_o = 8'b00100000;
	    NOR : DI_o = 8'b00010000;
	    NAND : DI_o = 8'b00001000;
	    XNOR : DI_o = 8'b00000100;
	    MAYOR : DI_o = 8'b00000010;
	    MENOR : DI_o = 8'b00000011;
	    IGUAL: DI_o = 8'b1100000;
		SUMA: DI_o = 8'b10100000;
		RES : DI_o = 8'b00100000;
		INV : DI_o = 8'b11100000;
		HOLD: DI_o = 8'b11010000;
		LOAD: DI_o = 8'b11111111;
		RST : DI_o = 8'b00000001;
		default: DI_o = 8'b00000000;   //Deshabilita DI
	endcase

endmodule
