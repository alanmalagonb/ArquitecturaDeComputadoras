`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 00:09:30
// Design Name: 
// Module Name: tb_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Módulo de Estimulo para la alu

module tb_alu();
  reg  [0:7] DI_i;
  reg  [3:0] RD_i, ACC_i;
  wire [3:0] OP_o;
  
  alu alu1(DI_i, RD_i, ACC_i, OP_o);
  
  initial 
    begin
      	 DI_i = 8'b00000000; RD_i = 4'b0000; ACC_i = 4'b0000;
      #25 DI_i = 8'b10000000; RD_i = 4'b1010; ACC_i = 4'b0101;  //AND
      #25 DI_i = 8'b01000000; RD_i = 4'b1010; ACC_i = 4'b0101;  //OR
      #25 DI_i = 8'b00100000; RD_i = 4'b1010; ACC_i = 4'b1010;  //XOR
      #25 DI_i = 8'b00010000; RD_i = 4'b0001; ACC_i = 4'b0001;  //ADD
      #25 DI_i = 8'b00001000; RD_i = 4'b0000; ACC_i = 4'b0000;  //INV
		#25 DI_i = 8'b00000100; RD_i = 4'b0000; ACC_i = 4'b0000;  //HOLD
	   #25 DI_i = 8'b00000010; RD_i = 4'b1000; ACC_i = 4'b0000;	 //CARGA
		#25 DI_i = 8'b00000001; RD_i = 4'b0011; ACC_i = 4'b0000;  // CARGA
    #25;
    end
  initial
    #250 $finish;
endmodule
