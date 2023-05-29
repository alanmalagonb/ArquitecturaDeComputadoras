`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: GCM Generador de Ciclo de Máquina
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module gcm (
    input clk,
    input rst_i,
	output reg A_o,
	output reg B_o,
	output reg C_o,
	output reg D_o,
    output reg E_o,
	output  [3:0] Q_o
);

reg [3:0] Q;

  always @(posedge clk or posedge rst_i)
    begin
       if (rst_i)  
	       Q <= 0;
	   else if (Q == 4'b0110)
		    Q <= 0;
	   else if (clk)
	       Q <= Q +1;	
	 end
	  
  always @(Q)
     case (Q) 
          4'b0000 :  begin A_o = 1'b1; E_o <= 1'b0; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0001 : begin A_o <= 1'b0; E_o <= 1'b1; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0010 : begin A_o <= 1'b0; E_o <= 1'b0; B_o <= 1'b1; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0011 : begin A_o <= 1'b0; E_o <= 1'b1; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0100 : begin A_o <= 1'b0; E_o <= 1'b0; B_o <= 1'b0; C_o <= 1'b1; D_o <= 1'b0; end
		  default : begin A_o <= 1'b0; E_o <= 1'b0; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b1; end
     endcase
	  
assign Q_o = Q;
endmodule 