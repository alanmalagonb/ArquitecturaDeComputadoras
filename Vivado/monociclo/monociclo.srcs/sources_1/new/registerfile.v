`timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	registerfile.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Banco de registros - RR
//Lectura es busqueda de operandos
//Escritura es writeback

module registerfile #(
	parameter					DEPTH = 5,
	parameter					WIDTH = 64
)
(
	//señales generales
	input							clk_i,
	//puerto de lectura rs1
	input							rers1_i,			//Hab de lectura
	input			[DEPTH-1:0]	raddrrs1_i,		//Dir de lectura
	output reg	[WIDTH-1:0]	rdatars1_o,		//Dato de lectura
	//puerto de lectura rs2
	input							rers2_i,			//Hab de lectura
	input			[DEPTH-1:0]	raddrrs2_i,		//Dir de lectura
	output reg	[WIDTH-1:0]	rdatars2_o,		//Dato de lectura
	//puerto de escritura
	input							we_i,			//Hab de escritura
	input			[DEPTH-1:0]	waddr_i,		//Dir de escritura
	input			[WIDTH-1:0]	wdata_i		//Dato de escritura
);
	
	//Definicion de la memoria
	reg		[WIDTH-1:0]	mem	[2**DEPTH-1:1];

	//Puerto escritura
	always @(posedge clk_i)
	begin
		if (we_i && waddr_i > 5'h0)
			mem[waddr_i]	<=	wdata_i;	
	end
	
	//Puerto de lectura RS1
	always @(*)
	begin
		if (rers1_i && raddrrs1_i > 5'h0)
			rdatars1_o	=	mem[raddrrs1_i];
		else
			rdatars1_o	=	{WIDTH{1'b0}};
	end	
	
	//Puerto de lectura RS2
	always @(*)
	begin
		if (rers2_i && raddrrs2_i > 5'h0)
			rdatars2_o	=	mem[raddrrs2_i];
		else
			rdatars2_o	=	{WIDTH{1'b0}};
	end

endmodule 
