`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: Medio Sumador
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module HA(
    i_bit1,
    i_bit2,
    o_sum,
    o_carry
    );
    
input i_bit1;
input i_bit2;
output o_sum;
output o_carry;

assign o_sum = i_bit1^i_bit2; // bitwise xor
assign o_carry = i_bit1 & i_bit2; // bitwise and

endmodule // half adder
