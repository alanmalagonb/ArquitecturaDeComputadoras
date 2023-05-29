`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Modulo: Carry Lookahead
// FPGA: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module carry_lookahead_adder_tb ();
  parameter WIDTH = 8;
  reg [WIDTH-1:0] r_ADD_1 = 0;
  reg [WIDTH-1:0] r_ADD_2 = 0;
  wire [WIDTH:0]  w_RESULT;
   
  carry_lookahead_adder #(.WIDTH(WIDTH)) carry_lookahead_inst(
     .i_add1(r_ADD_1), .i_add2(r_ADD_2), .o_result(w_RESULT));

  initial
    begin
      #10;
      r_ADD_1 = 8'b00011010;
      r_ADD_2 = 8'b00101011;
      #10;
      r_ADD_1 = 8'b01001010;
      r_ADD_2 = 8'b01011010;
      #10;
      r_ADD_1 = 8'b10111001;
      r_ADD_2 = 8'b11001011;
      #10;
      r_ADD_1 = 8'b11110110;
      r_ADD_2 = 8'b11100110;
      #10;
      $finish;
    end
endmodule // carry_lookahead_adder_tb
