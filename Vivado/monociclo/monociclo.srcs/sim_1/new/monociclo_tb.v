`timescale 1ns / 1ps

module monociclo_tb();
	reg				clk_i;
	reg				rst_ni;
	wire	[63:0]	wb_datard_o;
  /*  wire [63:0] pcb_pcsrc_o_o;
    wire [63:0] pc_next_o;
    wire [63:0] pc_gen_o;
    wire [63:0] icache_inst_o_o;
    wire [6:0] id_opcode_w_o;
    wire [4:0] id_addrs1_w_o;
    wire [4:0] id_addrs2_w_o;
    wire [4:0] id_addrd_w_o;
    wire [3:0] id_aluop_w_o;
    wire id_alusrc_o_o;
    wire id_regwrite_o_o;
    wire id_memread_o_o;
    wire id_memwrite_o_o;
    wire id_branch_o_o;
    wire id_memtoreg_o_o;
    wire [2:0] id_aluop_o_o;
    wire id_pcregwrite_o_o;
    wire [63:0] rr_datars1_o_o;
    wire [63:0] rr_datars2_o_o;
    wire [63:0] wb_datard_o_o;
    wire [63:0] se_datars2_o_o;
    wire [63:0] sl_datars2_o_o;
    wire [63:0] pcb_pc_o_o;
    wire ex_branchflag_o_o;
    wire [63:0] muxalusrc_datars2_w_o;
    wire [63:0] ex_datard_o_o;
    wire [63:0] mem_datard_o_o;
*/
	initial
	begin
		clk_i		=	1'b1;
		rst_ni	=	1'b0;
	end
	
	monociclo DUT(
		.clk_i			(clk_i),
		.rst_ni			(rst_ni),
		.wb_datard_o	(wb_datard_o)/*,
		.pcb_pcsrc_o_o(pcb_pcsrc_o_o),
        .pc_next_o(pc_next_o),
        .pc_gen_o(pc_gen_o),
        .icache_inst_o_o(icache_inst_o_o),
        .id_opcode_w_o(id_opcode_w_o),
        .id_addrs1_w_o(id_addrs1_w_o),
        .id_addrs2_w_o(id_addrs2_w_o),
        .id_addrd_w_o(id_addrd_w_o),
        .id_aluop_w_o(id_aluop_w_o),
        .id_alusrc_o_o(id_alusrc_o_o),
        .id_regwrite_o_o(id_regwrite_o_o),
        .id_memread_o_o(id_memread_o_o),
        .id_memwrite_o_o(id_memwrite_o_o),
        .id_branch_o_o(id_branch_o_o),
        .id_memtoreg_o_o(id_memtoreg_o_o),
        .id_aluop_o_o(id_aluop_o_o),
        .id_pcregwrite_o_o(id_pcregwrite_o_o),
        .rr_datars1_o_o(rr_datars1_o_o),
        .rr_datars2_o_o(rr_datars2_o_o),
        .wb_datard_o_o(wb_datard_o_o),
        .se_datars2_o_o(se_datars2_o_o),
        .sl_datars2_o_o(sl_datars2_o_o),
        .pcb_pc_o_o(pcb_pc_o_o),
        .ex_branchflag_o_o(ex_branchflag_o_o),
        .muxalusrc_datars2_w_o(muxalusrc_datars2_w_o),
        .ex_datard_o_o(ex_datard_o_o),
        .mem_datard_o_o(mem_datard_o_o)*/
	);
	
	always
	begin
		#50
			clk_i = ~clk_i;
	end
	
	always
	begin
		#100
			rst_ni =	1'b1;
	end
endmodule 
