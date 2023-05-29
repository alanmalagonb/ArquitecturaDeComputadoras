`timescale 1ns / 1ps
 /*
 * ----------------------------------------------------------------------------------------------
 * Project Name   :	Monociclo
 * File           :	signextend.v
 * Organization   :	Centro de Investigacion en Computacion (CIC-IPN)
 * Author(s)		:	Microse Team
 * Email(s)       :	lagarto@cic.ipn.mx
 * References     :
 * ----------------------------------------------------------------------------------------------
*/

//Modulo de extension de signo - SE

module signextend (
	input wire [31:0]if_inst_i,
	output reg [63:0]se_data_o
);


	wire [31:0] imm_itype;
	wire [31:0] imm_stype;
	wire [31:0] imm_btype;
	wire [31:0] imm_utype;
	wire [31:0] imm_jtype;
	wire [63:0] imm_uitype;
	wire [63:0] imm_shamt;
	wire [63:0] imm_shamt_big;
	wire [31:0] sign_extended;
	assign imm_shamt_big = {{57 {if_inst_i[26]}}, if_inst_i[26:20]};
	assign imm_shamt = {{58 {if_inst_i[25]}}, if_inst_i[25:20]};
	assign imm_itype = {{20 {if_inst_i[31]}}, if_inst_i[31-:12]};
	assign imm_stype = {{20 {if_inst_i[31]}}, if_inst_i[31-:7], if_inst_i[11-:5]};
	assign imm_btype = {{20 {if_inst_i[31]}}, if_inst_i[7], if_inst_i[30-:6], if_inst_i[11-:4], 1'b0};
	assign imm_utype = {if_inst_i[31-:20], 12'b000000000000};
	assign imm_jtype = {{11 {if_inst_i[31]}}, if_inst_i[31], if_inst_i[19-:8], if_inst_i[20], if_inst_i[30-:10], 1'b0};
	assign imm_uitype = {{59 {1'b0}}, if_inst_i[19-:5]};
	assign sign_extended = {32 {if_inst_i[31]}};
	always @(*)
	begin
			case (if_inst_i[6-:7])
			7'b0110111, 7'b0010111: se_data_o = {sign_extended, imm_utype};
			7'b1101111: se_data_o = {sign_extended, imm_jtype};
			7'b1100111, 7'b0000011: se_data_o = {sign_extended, imm_itype};
			7'b0010011:
				case (if_inst_i[14-:3])
					3'b001, 3'b101: se_data_o = imm_shamt_big;
					default: se_data_o = {sign_extended, imm_itype};
				endcase
			7'b0011011:
				case (if_inst_i[14-:3])
					3'b001, 3'b101: se_data_o = imm_shamt;
					default: se_data_o = {sign_extended, imm_itype};
				endcase
			7'b1100011: se_data_o = {sign_extended, imm_btype};
			7'b0100011: se_data_o = {sign_extended, imm_stype};
			7'b1110011:
				case (if_inst_i[14-:3])
					3'b001, 3'b010, 3'b011, 3'b101, 3'b110, 3'b111, 3'b000: se_data_o = {sign_extended, imm_itype};
					default: se_data_o = 64'b0000000000000000000000000000000000000000000000000000000000000000;
				endcase
			default: se_data_o = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		endcase
    end
	
endmodule