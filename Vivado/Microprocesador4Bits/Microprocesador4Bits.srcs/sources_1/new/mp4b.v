`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Microprocesador de 4 bits
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module mp4b (

	input rst,
	input clk,
	
	output  [3:0] DM_out,
	
	output A_out,
	output B_out,
	output C_out,
	output D_out,
	output E_out,

	output  [0:7] DI_out,
	output  [3:0] RI_out,
    output  [3:0] RD_out,
    output  [3:0] ACC_out,
    output  [3:0] ACT_out,
    output  [3:0] OP_out,	
	output  [3:0] Q_out,
	output  [3:0] PC_o
);

wire [3:0] RD, RI, ACC, ACT, OP, Q, PC, DM;
wire A, B, C, D, E;
wire [0:7] DI;

acc acc1 (.D_i(D), .rst_i(rst), .ACT_i(ACT), .ACC_o(ACC));
act act1 (.C_i(C), .rst_i(rst), .OP_i(OP), .ACT_o(ACT));
alu alu1 (.DI_i(DI), .RD_i(RD), .ACC_i(ACC), .OP_o(OP));
reg_dat RD1 (.B_i(B), .rst_i(rst), .DM_i(DM), .RD_o(RD));
reg_ins RI1 (.A_i(A), .rst_i(rst), .DM_i(DM), .RI_o(RI));
deco_ins DEEC (.RI_i(RI), .DI_o(DI));
gcm UC1 (.clk(clk), .rst_i(rst), .A_o(A), .B_o(B), .C_o(C), .D_o(D), .E_o(E), .Q_o(Q));
pc UPC (.rst_i(rst), .E_i(E), .DI_i(DI), .PC_o(PC));
rom MEM (.address(PC), .data_out(DM));

assign DM_out = DM;
assign DI_out = DI;
assign RI_out = RI;
assign RD_out = RD;
assign ACC_out = ACC;
assign ACT_out = ACT;
assign OP_out = OP;
assign A_out = A;
assign B_out = B;
assign C_out = C;
assign D_out = D;
assign E_out = E;
assign Q_out = Q;
assign PC_o = PC;

endmodule
