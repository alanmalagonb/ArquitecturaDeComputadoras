`timescale 1ns / 1ps

module single_cycle_tb;
  
  reg [7:0] A;
  reg [7:0] B;
  reg [2:0] op;
  reg clk;
  reg reset_n;
  reg start;
  wire done;
  wire [15:0] result;
  
  single_cycle dut (
    .A(A),
    .B(B),
    .op(op),
    .clk(clk),
    .reset(reset_n),
    .start(start),
    .done(done),
    .result(result)
  );
  
  initial begin
    // Operación lógica AND
    A = 8'd5;
    B = 8'd4;
    op = 3'b000;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Operación lógica OR
    A = 8'd5;
    B = 8'd4;
    op = 3'b001;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Operación lógica XOR
    A = 8'd5;
    B = 8'd4;
    op = 3'b010;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Operación aritmética suma
    A = 8'd5;
    B = 8'd4;
    op = 3'b011;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Operación aritmética resta
    A = 8'd5;
    B = 8'd4;
    op = 3'b100;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Operación aritmética multiplicación
    A = 8'd5;
    B = 8'd4;
    op = 3'b101;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Operación NOP
    A = 8'd5;
    B = 8'd4;
    op = 3'b110;
    start = 1;
    #10;
    start = 0;
    #10;
    
    // Otro caso
    A = 8'd5;
    B = 8'd4;
    op = 3'b000;
    start = 1;
    #10;
    start = 0;
    #10;
    
    $finish;
  end
  
  always begin
    #5 clk = ~clk;
  end
  
endmodule

