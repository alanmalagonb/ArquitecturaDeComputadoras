`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: Carry Lookahead 4 Bit
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module carry_lookahead_adder_4_bit_tb ();
  reg [3:0] r_ADD_1 = 0;
  reg [3:0] r_ADD_2 = 0;
  wire [4:0]  w_RESULT;
   
  carry_lookahead_adder_4_bit carry_lookahead_inst(
     .i_add1(r_ADD_1), .i_add2(r_ADD_2), .o_result(w_RESULT));

  initial
    begin
      #10;
      r_ADD_1 = 3'b000;
      r_ADD_2 = 3'b001;
      #10;
      r_ADD_1 = 3'b010;
      r_ADD_2 = 3'b010;
      #10;
      r_ADD_1 = 3'b101;
      r_ADD_2 = 3'b110;
      #10;
      r_ADD_1 = 3'b111;
      r_ADD_2 = 3'b111;
      #10;
      $finish;
    end
endmodule // carry_lookahead_adder_4_bit_tb
