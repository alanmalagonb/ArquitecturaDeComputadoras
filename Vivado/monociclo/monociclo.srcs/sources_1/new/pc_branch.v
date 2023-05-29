`timescale 1ns / 1ps
/*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	pc_branch.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Unidad de calculo del PC de Branch

module	pc_branch (
	input			[63:0]	immediate_i,
	input			[63:0]	pc_i,
	output		[63:0]	pcbranch_o
);

	assign					pcbranch_o	= immediate_i + pc_i;
	
	// Bloque para imprimir las variables
	initial begin
		$display("immediate_i = %b", immediate_i);
		$display("pc_i = %b", pc_i);
		$display("pcbranch_o = %b", pcbranch_o);
	end

endmodule
