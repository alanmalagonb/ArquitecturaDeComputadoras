`timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	pc_gen.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Unidad de calculo de siguiente PC
 
module	pc_gen (
	input			[63:0]	pc_i,
	output 		[63:0]	pc_next_o
);

	assign		pc_next_o	=	pc_i + 4'h4;

    initial begin
        $display("pc_i = %h", pc_i);
        $display("pc_next_o = %h", pc_next_o);
        // Additional code or simulation steps
      end
endmodule
