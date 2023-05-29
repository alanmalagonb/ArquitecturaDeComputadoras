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

//Unidad de ejecucion - EX

module alu (
	input			[6:0]		opcode_i,
	input			[3:0]		aluop_i,
	input			[63:0]	src1_i,
	input			[63:0]	src2_i,
	output reg	[63:0]	resultado_o,
	output reg				branchflag_o
);
	//assign	branchflag_o	=	(resultado_o == 64'h0) ? 1'b1 : 1'b0;	
	always @(*)
	begin
		branchflag_o = 1'b0;
		case(opcode_i)
			7'b0010011:		//Instrucciones Tipo I
				begin
					case (aluop_i)
						4'b0000:		//Suma - addi
									resultado_o	=	src1_i + src2_i;

						4'b0010:		//Set if less than immediate - slti
									begin
										if (src1_i < src2_i)
											resultado_o = 64'h1;
										else
											resultado_o = 64'h0;
									end
						4'b0011:		//Set if less than immediate unsigned - sltiu
									begin
										if (src1_i < src2_i)
											resultado_o = 64'h1;
										else
											resultado_o = 64'h0;
									end
						4'b0100:	//xori
									resultado_o	=	src1_i ^ src2_i;
						4'b0110:	//ori
									resultado_o	=	src1_i | src2_i;
						4'b0111:	//andi
									resultado_o	=	src1_i & src2_i;
						4'b0001:	//slli
									resultado_o	=	src1_i << src2_i;
						4'b0101:	//srli
									resultado_o =	src1_i >> src2_i;
						4'b1101:	//srai
									resultado_o	=	src1_i >>> src2_i;
						default:
									resultado_o	=	64'h0;				
					endcase
				end
			7'b0110011:		//Instrucciones Tipo R
				begin
					case (aluop_i)
						4'b0000:		//Suma - add
									resultado_o	=	src1_i + src2_i;
						4'b1000:		//Resta - sub
									resultado_o	=	src1_i - src2_i;
						4'b0001:		//Shift Left Logical - sll
									resultado_o	=	src1_i << src2_i;
						4'b0010:		//Set if Less Than - slt
									begin
										if (src1_i < src2_i)
											resultado_o = 64'h1;
										else
											resultado_o = 64'h0;
									end
						4'b0011:		//Set if Less Than - sltu
									begin
										if (src1_i < src2_i)
											resultado_o = 64'h1;
										else
											resultado_o = 64'h0;
									end
						4'b0100:		//xor
									resultado_o	=	src1_i ^ src2_i;
						4'b0101:		//Shift Right Logical - srl
									resultado_o	=	src1_i >> src2_i;
						4'b1101:		//Shift Right Arithmetic - sra
									resultado_o	=	src1_i >>> src2_i;
						4'b0110:		//or
									resultado_o	=	src1_i | src2_i;
						4'b0111:		//and
									resultado_o	=	src1_i & src2_i;
						default:
									resultado_o = 64'h0;
					endcase
				end
			7'b1100011:											//Branch
				begin
					resultado_o	=	src1_i ^ src2_i;
					if (aluop_i[2:0] == 3'b000)			//BEQ
						if (resultado_o == 64'h0)			//BEQ
							branchflag_o = 1'b1;
						else
							branchflag_o = 1'b0;
					else if (aluop_i[2:0] == 3'b001)		//BNE
						if (resultado_o != 64'h0)			//BNE
							branchflag_o = 1'b1;
						else
							branchflag_o = 1'b0;	
					else
						branchflag_o = 1'b0;
				end
			7'b0000011:											//Loads
				begin
					resultado_o	= src1_i + src2_i;
				end
			7'b0100011:											//Stores
				begin
					resultado_o	= src1_i + src2_i;
				end
				
			default:
						resultado_o	=	64'h0;
		endcase
		$display("opcode_i = %b", opcode_i);
		$display("aluop_i = %b", aluop_i);
		$display("src1_i = %b", src1_i);
		$display("src2_i = %b", src2_i);
		$display("resultado_o = %b", resultado_o);
		$display("branchflag_o = %b", branchflag_o);
	end
	
endmodule 
