`timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	decode.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Unidad de decodificacion de la instruccion - ID

module decode (
	input			[6:0]	opcode_i,
	output reg			alusrc_o,  
	output reg			regwrite_o,
	output reg			memread_o,  
	output reg			memwrite_o,
	output reg			branch_o,  
	output reg			memtoreg_o,
	output reg			pcregwrite_o,
	output reg	[2:0]	aluop_o      
);
	always @(*)
	begin
		case (opcode_i)
			7'b0110011:		//Instruccion tipo R
				begin
					alusrc_o		=	1'b0;
					regwrite_o	=	1'b1;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					branch_o		=	1'b0;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b0;
					aluop_o		=	3'b001;
				end
			7'b0010011:		//Instruccion tipo I
				begin
					alusrc_o		=	1'b1;
					regwrite_o	=	1'b1;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					branch_o		=	1'b0;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b0;
					aluop_o		=	3'b010;
				end
			7'b1100011:		//Instruccion tipo B
				begin
					alusrc_o		=	1'b0;
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					branch_o		=	1'b1;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b0;
					aluop_o		=	3'b011;
				end
			7'b0000011:		//Instruccion tipo L
				begin
					alusrc_o		=	1'b1;
					regwrite_o	=	1'b1;
					memread_o	=	1'b1;
					memwrite_o	=	1'b0;
					branch_o		=	1'b1;
					memtoreg_o	=	1'b1;
					pcregwrite_o	=	1'b0;
					aluop_o		=	3'b100;
				end
			7'b0100011:		//Instruccion tipo S
				begin
					alusrc_o		=	1'b1;
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b1;
					branch_o		=	1'b0;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b0;
					aluop_o		=	3'b101;
				end
			7'b1101111:		//Instruccion tipo J
				begin
					alusrc_o		=	1'b1;
					regwrite_o	=	1'b1;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					branch_o		=	1'b1;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b1;
					aluop_o		=	3'b110;
				end
			7'b1100111:		//Instruccion tipo Jalr
				begin
					alusrc_o		=	1'b1;
					regwrite_o	=	1'b1;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					branch_o		=	1'b1;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b1;
					aluop_o		=	3'b111;
				end
			default:
				begin
					alusrc_o		=	1'b0;
					regwrite_o	=	1'b0;
					memread_o	=	1'b0;
					memwrite_o	=	1'b0;
					branch_o		=	1'b0;
					memtoreg_o	=	1'b0;
					pcregwrite_o	=	1'b0;
					aluop_o		=	3'b000;
				end
		endcase
		$display("alusrc_o = %b", alusrc_o);
    $display("regwrite_o = %b", regwrite_o);
    $display("memread_o = %b", memread_o);
    $display("memwrite_o = %b", memwrite_o);
    $display("branch_o = %b", branch_o);
    $display("memtoreg_o = %b", memtoreg_o);
    $display("pcregwrite_o = %b", pcregwrite_o);
    $display("aluop_o = %b", aluop_o);
	end
	
endmodule 