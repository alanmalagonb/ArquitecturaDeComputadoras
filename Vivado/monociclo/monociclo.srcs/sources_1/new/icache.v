`timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	icache.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Memoria plana para cache de instrucciones - icache - IL1

module icache (
	input				clk_i,
	input		[63:0]icache_addr_i,
	output	[31:0]icache_resp_o,
	input				we_i,				
	input		[31:0]icache_req_i
);
	//Definicion de la memoria. 255 localidades. Instrucciones de 32 bits
	reg		[31:0]icache	[255:0];
	initial
	begin
//		icache[0]	=	32'h00500293;
//		icache[1]	=	32'h00700313;
//		icache[2]	=	32'h00d00393;
//		icache[3]	=	32'h00628e33;
//		icache[4]	=	32'h40530eb3;
//		icache[5]	=	32'h00531f33;
		$readmemh("insercion.mem", icache);
		$display("Initialized icache");
	end
	//Direccion de lectura
	wire		[7:0]	read_addr_w;
	assign			read_addr_w	=	icache_addr_i[9:2];
	//Puerto de lectura
	assign			icache_resp_o	=	icache[read_addr_w];
	//Puerto de escritura
	always @(posedge clk_i)
	begin
		if (we_i)
			icache[read_addr_w]	<=	icache_req_i;	
		$display("icache_resp_o = %h", icache_resp_o);
        $display("icache_addr_i = %h", icache_addr_i);
        $display("we_i = %b", we_i);
        $display("icache_req_i = %h", icache_req_i);
	end
endmodule