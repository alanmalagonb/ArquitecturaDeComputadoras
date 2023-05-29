`timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	dcache.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Memoria Plana para Cache de Datos de Nivel 1 - dcache - DL1

module dcache (
	input					clk_i,
	input			[63:0]dcache_addr_i,
	//Puerto de Lectura
	input					re_i,
	output reg	[63:0]dcache_resp_o,
	//Puerto de Escritura
	input					we_i,				
	input			[63:0]dcache_req_i
);
	//Definicion de la memoria. 255 localidades. Instrucciones de 32 bits
	reg			[63:0]dcache	[255:0];

	//Direccion de lectura/escritura
	wire		[7:0]	rw_addr_w;
	assign			rw_addr_w	=	dcache_addr_i[9:2];
	
	//Puerto de lectura
	always @(*)
	begin
		if (re_i)
			dcache_resp_o	=	dcache[rw_addr_w];
	end
			
	//Puerto de escritura
	always @(posedge clk_i)
	begin
		if (we_i)
			dcache[rw_addr_w]	<=	dcache_req_i;	
		
		$display("clk_i = %b", clk_i);
		$display("dcache_addr_i = %b", dcache_addr_i);
		$display("re_i = %b", re_i);
		$display("dcache_resp_o = %b", dcache_resp_o);
		$display("we_i = %b", we_i);
		$display("dcache_req_i = %b", dcache_req_i);
	end
	
endmodule