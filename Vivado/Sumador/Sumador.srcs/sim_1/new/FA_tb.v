`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: Sumador Completo
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module FA_tb;
  reg r_BIT1 = 0;
  reg r_BIT2 = 0;
  reg i_CARRY = 0;
  wire w_SUM;
  wire w_CARRY;
   
  FA DUT (.i_bit1(r_BIT1), .i_bit2(r_BIT2), .i_carry(i_CARRY), .o_sum(w_SUM), .o_carry(w_CARRY) );

  initial
    begin
      r_BIT1 = 1'b0;
      r_BIT2 = 1'b0;
      i_CARRY = 1'b0;
      #10;
      r_BIT1 = 1'b0;
      r_BIT2 = 1'b1;
      i_CARRY = 1'b1;
      #10;
      r_BIT1 = 1'b1;
      r_BIT2 = 1'b0;
      i_CARRY = 1'b0;
      #10;
      r_BIT1 = 1'b1;
      r_BIT2 = 1'b1;
      i_CARRY = 1'b1;
      #10;
      $finish;
    end 
endmodule // FA_tb