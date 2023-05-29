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

module FA   (
 i_bit1,
 i_bit2,
 i_carry,
 o_sum,
o_carry  );

input  i_bit1;
 input  i_bit2;
 input  i_carry;
 output o_sum;
 output o_carry;

 wire   w_WIRE_1;
 wire   w_WIRE_2;
wire   w_WIRE_3;
       
assign w_WIRE_1 = i_bit1 ^ i_bit2;
 assign w_WIRE_2 = w_WIRE_1 & i_carry;
 assign w_WIRE_3 = i_bit1 & i_bit2;

 assign o_sum   = w_WIRE_1 ^ i_carry;
 assign o_carry = w_WIRE_2 | w_WIRE_3;

  // FYI: Code above using wires will produce the same results as:
  // assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
  // assign o_carry = (i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);
   
endmodule // full_adder
