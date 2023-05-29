 `timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	monociclo.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Procesador Monociclo - Taller Lagarto 2022

module monociclo (
	input						clk_i,
	input						rst_ni,
	output		[63:0]	wb_datard_o//,
	/*output [63:0] pcb_pcsrc_o_o,
	output [63:0] pc_next_o,
	output [63:0] pc_gen_o,
	output [63:0] icache_inst_o_o,
	output [6:0] id_opcode_w_o,
	output [4:0] id_addrs1_w_o,
	output [4:0] id_addrs2_w_o,
	output [4:0] id_addrd_w_o,
	output [3:0] id_aluop_w_o,
	output id_alusrc_o_o,
	output id_regwrite_o_o,
	output id_memread_o_o,
	output id_memwrite_o_o,
	output id_branch_o_o,
	output id_memtoreg_o_o,
	output [2:0] id_aluop_o_o,
	output id_pcregwrite_o_o,
	output [63:0]rr_datars1_o_o,
	output [63:0]rr_datars2_o_o,
 	output [63:0]wb_datard_o_o,
 	output [63:0]se_datars2_o_o,
 	output [63:0]sl_datars2_o_o,
 	output [63:0]pcb_pc_o_o,
 	output ex_branchflag_o_o,
 	output [63:0]muxalusrc_datars2_w_o,
 	output [63:0]ex_datard_o_o,
 	output [63:0]mem_datard_o_o*/
);
	//////*******
	//////*******	Etapa de Fetch - IF
	//////*******
	wire			[63:0]pcb_pcsrc_o;
	reg			[63:0]	pc_next;
	wire			[63:0]	pc_gen;
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			pc_next	<=	64'h0;
		else
			pc_next	<=	pcb_pcsrc_o;
	end
	//Calculo del siguiente PC
	pc_gen	pcgeu_u0	(
		.pc_i				(pc_next),
		.pc_next_o		(pc_gen)
	);
	
	//////*******
	//////*******	Cache de Instrucciones - IL1
	//////*******
	wire			[31:0]icache_inst_o;
	icache	icache_u0 (
		.clk_i			(clk_i),
		.icache_addr_i	(pc_next),
		.we_i				(1'b0),
		.icache_req_i	(32'h0),
		.icache_resp_o	(icache_inst_o)
	);

	//////*******
	//////*******	Decodificacion/Control - ID
	//////*******
	wire			[6:0]	id_opcode_w;
	wire			[4:0]	id_addrs1_w;			//Registro fuente 1
	wire			[4:0]	id_addrs2_w;			//Registro fuente 2
	wire			[4:0]	id_addrd_w;				//Registro destino
	wire			[3:0]	id_aluop_w;				//ALU operation
	assign				id_opcode_w	=	icache_inst_o[6:0];
	assign				id_addrd_w	=	icache_inst_o[11:7];
	assign				id_aluop_w	=	{icache_inst_o[30],icache_inst_o[14:12]};
	assign				id_addrs1_w	=	icache_inst_o[19:15];
	assign				id_addrs2_w	=	icache_inst_o[24:20];
	
	wire					id_alusrc_o;
	wire					id_regwrite_o;
	wire					id_memread_o; 
	wire					id_memwrite_o;
	wire					id_branch_o;
	wire					id_memtoreg_o;
	wire			[2:0]	id_aluop_o;
	wire					id_pcregwrite_o;
	
	decode	decode_u0 (
		.opcode_i		(id_opcode_w),
		.alusrc_o		(id_alusrc_o),
		.regwrite_o		(id_regwrite_o),
		.memread_o		(id_memread_o), 
		.memwrite_o		(id_memwrite_o),
		.branch_o		(id_branch_o),  
		.memtoreg_o		(id_memtoreg_o),
		.aluop_o			(id_aluop_o),
		.pcregwrite_o	(id_pcregwrite_o)
		
	);
	
	//////*******
	//////*******	Busqueda de Operandos/Lectura de Registros - RR
	//////*******
	wire			[63:0]rr_datars1_o;
	wire			[63:0]rr_datars2_o;
//	wire			[63:0]wb_datard_o;
	registerfile registerfile_u0 (	
		.clk_i			(clk_i),
		.rers1_i			(1'b1),		
		.raddrrs1_i		(id_addrs1_w),	
		.rdatars1_o		(rr_datars1_o),	
		.rers2_i			(1'b1),		
		.raddrrs2_i		(id_addrs2_w),	
		.rdatars2_o		(rr_datars2_o),	
		.we_i				(id_regwrite_o),			
		.waddr_i			(id_addrd_w),		
		.wdata_i			(wb_datard_o)	
	);
		
	//////*******
	//////*******	Extension de Signo - SE
	//////*******
	wire			[63:0]se_datars2_o;
	signextend signext_u0 (
		.if_inst_i		(icache_inst_o),
		.se_data_o		(se_datars2_o)
	);
	
	//////*******
	//////*******	ShiflLeft Immediate - SL
	//////*******
	wire			[63:0]sl_datars2_o;
	assign				sl_datars2_o = {se_datars2_o[63:1], 1'b0};
	
	//////*******
	//////*******	PC Branch	- PCB
	//////*******	
	wire			[63:0]pcb_pc_o;
	pc_branch	pcb_u0(
		.immediate_i	(sl_datars2_o),
		.pc_i				(pc_next),
		.pcbranch_o		(pcb_pc_o)
	);

	//////*******
	//////*******	Mux PCSrc
	//////*******
	wire					ex_branchflag_o;
	assign				pcb_pcsrc_o	=	(id_branch_o && ex_branchflag_o) ? pcb_pc_o : pc_gen;
	
	//////*******
	//////*******	Multiplexor ALUSrc (Register Read - Sign Extend) - muxalusrc
	//////*******	
	wire			[63:0]muxalusrc_datars2_w;
	assign				muxalusrc_datars2_w = (id_alusrc_o) ? se_datars2_o : rr_datars2_o;
	
	
	//////*******
	//////*******	Ejecucion - EX
	//////*******
	wire			[63:0]ex_datard_o;
	alu aluex_u0 (
		.opcode_i		(id_opcode_w),
		.aluop_i			(id_aluop_w),
		.src1_i			(rr_datars1_o),
		.src2_i			(muxalusrc_datars2_w),
		.resultado_o	(ex_datard_o),
		.branchflag_o	(ex_branchflag_o)
	);
	
	//////*******
	//////*******	Cache de Datos - MEM
	//////*******
	wire			[63:0]mem_datard_o;
	dcache dcache_u0	(
		.clk_i				(clk_i),
		.dcache_addr_i		(ex_datard_o),
		.re_i					(id_memread_o),
		.dcache_resp_o		(mem_datard_o),
		.we_i					(id_memwrite_o),			
		.dcache_req_i		(rr_datars2_o)
	);
	
	//////*******
	//////*******	Multiplexor Mem-to-Reg (Ejecucion - Memoria) - wb_datard_o
	//////*******	
	assign				wb_datard_o = (id_memtoreg_o) ? mem_datard_o : ex_datard_o;	
	
	/*
	assign  pcb_pcsrc_o_o = pcb_pcsrc_o;
    assign  pc_next_o = pc_next;
    assign  pc_gen_o = pc_gen;
    assign  icache_inst_o_o = icache_inst_o;
    assign  id_opcode_w_o = id_opcode_w;
    assign  id_addrs1_w_o = id_addrs1_w;
    assign  id_addrs2_w_o = id_addrs2_w;
    assign  id_addrd_w_o = id_addrd_w;
    assign  id_aluop_w_o = id_aluop_w;
    assign id_alusrc_o_o = id_alusrc_o;
    assign id_regwrite_o_o = id_regwrite_o;
    assign id_memread_o_o = id_memread_o;
    assign id_memwrite_o_o = id_memwrite_o;
    assign id_branch_o_o = id_branch_o;
    assign id_memtoreg_o_o = id_memtoreg_o;
    assign id_aluop_o_o = id_aluop_o;
    assign id_pcregwrite_o_o = id_pcregwrite_o;
    assign rr_datars1_o_o = rr_datars1_o;
    assign rr_datars2_o_o = rr_datars2_o;
    assign wb_datard_o_o = wb_datard_o;
    assign se_datars2_o_o = se_datars2_o;
    assign sl_datars2_o_o = sl_datars2_o;
    assign pcb_pc_o_o = pcb_pc_o;
    assign ex_branchflag_o_o = ex_branchflag_o;
    assign muxalusrc_datars2_w_o = muxalusrc_datars2_w;
    assign ex_datard_o_o = ex_datard_o;
    assign mem_datard_o_o = mem_datard_o;
    */
	
endmodule